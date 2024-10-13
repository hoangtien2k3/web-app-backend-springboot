package com.hoangtien2k3.shopappbackend.services.impl;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.hoangtien2k3.shopappbackend.components.TranslateMessages;
import com.hoangtien2k3.shopappbackend.dtos.CartItemDTO;
import com.hoangtien2k3.shopappbackend.dtos.OrderDTO;
import com.hoangtien2k3.shopappbackend.dtos.order.*;
import com.hoangtien2k3.shopappbackend.exceptions.payload.BusinessException;
import com.hoangtien2k3.shopappbackend.exceptions.payload.DataNotFoundException;
import com.hoangtien2k3.shopappbackend.factory.ObjectMapperFactory;
import com.hoangtien2k3.shopappbackend.models.*;
import com.hoangtien2k3.shopappbackend.models.ShippingAddress;
import com.hoangtien2k3.shopappbackend.repositories.*;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;
import com.hoangtien2k3.shopappbackend.responses.order.OrderResponse;
import com.hoangtien2k3.shopappbackend.responses.order.response.OrderBatchResponse;
import com.hoangtien2k3.shopappbackend.responses.order.response.ShippingAddressResp;
import com.hoangtien2k3.shopappbackend.responses.order.response.ShippingInfoResp;
import com.hoangtien2k3.shopappbackend.services.OrderService;
import com.hoangtien2k3.shopappbackend.services.validate.ValidateServiceImpl;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import com.hoangtien2k3.shopappbackend.utils.DateUtil;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.*;

@Service
@RequiredArgsConstructor
public class OrderServiceImpl extends TranslateMessages implements OrderService {

    private final OrderRepository orderRepository;
    private final OrderDetailRepository orderDetailRepository;
    private final UserRepository userRepository;
    private final ModelMapper modelMapper;
    private final ProductRepository productRepository;
    private final PaymentRepository paymentRepository;
    private final ShippingAddressRepository shippingAddressRepository;
    private final ShippingRepository shippingRepository;
    private final ValidateServiceImpl validateServiceImpl;
    private final ObjectMapper objectMapper = ObjectMapperFactory.getInstance();

    @Override
    @Transactional
    public ApiResponse<Order> createOrder(OrderDTO orderDTO) throws BusinessException {
        ApiResponse<Order> apiResponse = new ApiResponse<>();
        apiResponse.setSuccess(true);
        apiResponse.setMessage("create.order.success");
        apiResponse.setError("1");
        try {
            // kiểm tra xem userId có tồn tại hay không
            User user = userRepository.findById(orderDTO.getUserId())
                    .orElseThrow(() -> new DataNotFoundException(translate(MessageKeys.NOT_FOUND, orderDTO.getUserId())));

            // convert orderDTO -> order
            // using modelMapper
            modelMapper.typeMap(OrderDTO.class, Order.class)
                    .addMappings(mapper -> mapper.skip(Order::setId));

            // cập nhật các trường của đơn hàng từ orderDTO
            Order order = new Order();
            modelMapper.map(orderDTO, order);
            order.setUser(user);
            order.setOrderDate(new Date()); // lấy thời điểm hiện tại
            order.setStatus(OrderStatus.PENDING);

            // Kiểm tra shipping date >= ngày hôm nay
            LocalDate shippingDate = orderDTO.getShippingDate() == null
                    ? LocalDate.now()
                    : orderDTO.getShippingDate();
            if (shippingDate.isBefore(LocalDate.now())) {
                throw new DataNotFoundException(translate(MessageKeys.TOKEN_EXPIRATION_TIME));
            }
            order.setShippingDate(shippingDate); // set thời điểm giao hàng
            order.setActive(true); // trạng thái đơn hàng đã được active
            order.setTotalMoney(orderDTO.getTotalMoney());
            orderRepository.save(order); // lưu vào database

            // tạo danh sách các đối tượng orderDetails
            List<OrderDetail> orderDetails = new ArrayList<>();
            for (CartItemDTO cartItemDTO : orderDTO.getCartItems()) {
                OrderDetail orderDetail = new OrderDetail();
                orderDetail.setOrder(order);

                // lấy thông tin sản phẩm từ cartItemDTO
                Long productId = cartItemDTO.getProductId();
                Integer quantity = cartItemDTO.getQuantity();

                // tìm thông tin sản phẩm từ cơ sở dữ liệu
                Product product = productRepository.findById(productId)
                        .orElseThrow(() -> new DataNotFoundException(
                                translate(MessageKeys.PRODUCT_NOT_FOUND, productId))
                        );

                //kiem tra xem san pham ton kho va san pham dat hang
                if (quantity > product.getProductStock()) {
                    throw new BusinessException("CREATE001", translate("product.invoice.not.full"), quantity.toString(), product.getProductStock().toString());
                }

                // Đặt thông tin cho orderDetails
                orderDetail.setProduct(product);
                orderDetail.setNumberOfProducts(quantity);
                orderDetail.setPrice(product.getPrice());

                // thêm orderDetails vào danh sách
                orderDetails.add(orderDetail);
            }

            // Lưu danh sách OrderDetails vào cơ sở dữ liệu
            orderDetailRepository.saveAll(orderDetails);
            apiResponse.setPayload(order);
        } catch (BusinessException exception) {
            apiResponse.setSuccess(false);
            apiResponse.setMessage("create.order.success");
            apiResponse.setError("-1");
            apiResponse.setErrors(List.of(exception.getMessage()));
        }
        return apiResponse;
    }

    @Override
    public ApiResponse<OrderBatchResponse> createOrderBatch(OrderRequestDTO orderRequestDTO) throws BusinessException {
        ApiResponse<OrderBatchResponse> apiResponse = new ApiResponse<>();
        apiResponse.setSuccess(true);
        apiResponse.setMessage("create.order.success");
        apiResponse.setError("1");
        try {
            // Validate order
            validateServiceImpl.validateOrderBatch(orderRequestDTO);

            // Find user
            User user = userRepository.findById(orderRequestDTO.getUserId())
                    .orElseThrow(() -> new DataNotFoundException(
                            translate(MessageKeys.NOT_FOUND, orderRequestDTO.getUserId())));

            // Prepare order data
            String jsonDateOrder = objectMapper.writeValueAsString(orderRequestDTO);
            Date orderDate = Optional.ofNullable(orderRequestDTO.getOrderDate()).orElse(new Date());
            String estimatedDeliveryDateStr = DateUtil.date2ddMMyyyyHHMMss(DateUtil.addDate(new Date(), 5));

            // Create order object
            Order order = buildOrder(orderRequestDTO, user, jsonDateOrder);

            // Create order details and calculate total price
            List<OrderDetail> lstOrderDetail = new ArrayList<>();
            double totalPrice = processOrderDetails(orderRequestDTO.getProductInfos(), order, lstOrderDetail);

            // Calculate price to pay
            double priceToPay = calculatePrice(orderRequestDTO, totalPrice);

            // Save order
            order.setTotalMoney((float) totalPrice);
            Order savedOrder = orderRepository.save(order);
            List<OrderDetail> orderDetail = orderDetailRepository.saveAll(lstOrderDetail);

            // Save payment info
            savePaymentInfo(orderRequestDTO.getPaymentInfo(), user, savedOrder);
            // Save shipping info
            Shipping shipping = saveShippingInfo(orderRequestDTO.getShippingInfo(), savedOrder);
            // Prepare response
            OrderBatchResponse orderBatchResponse = buildOrderBatchResponse(order, user, orderRequestDTO, shipping, orderDate, estimatedDeliveryDateStr, totalPrice, priceToPay);

            apiResponse.setPayload(orderBatchResponse);
        } catch (BusinessException | JsonProcessingException e) {
            apiResponse.setSuccess(false);
            apiResponse.setMessage("create.order.failed");
            apiResponse.setError("-1");
            throw new RuntimeException(e); // rethrow the exception if needed
        }
        return apiResponse;
    }

    private Order buildOrder(OrderRequestDTO orderRequestDTO, User user, String jsonDateOrder) {
        return Order.builder()
                .user(user)
                .fullName(user.getFullName())
                .address(user.getAddress())
                .phoneNumber(user.getPhoneNumber())
                .email(user.getEmail())
                .note(orderRequestDTO.getNotes())
                .orderDate(new Date()) // current time
                .status(OrderStatus.PENDING)
                .active(true)
                .orderData(jsonDateOrder)
                .build();
    }

    private double processOrderDetails(List<ProductInfo> lstProductInfo, Order order, List<OrderDetail> lstOrderDetail) throws BusinessException {
        double totalPrice = 0D;
        for (ProductInfo productInfo : lstProductInfo) {
            Product product = productRepository.findById(productInfo.getProductId())
                    .orElseThrow(() -> new DataNotFoundException(
                            translate(MessageKeys.PRODUCT_NOT_FOUND, productInfo.getProductId())));

            //kiem tra con hang hay khong
            checkProductStock(productInfo.getQuantity(), product);
            OrderDetail orderDetail = getOrderDetail(order, productInfo, product);
            lstOrderDetail.add(orderDetail);

            totalPrice += product.getPrice();
        }
        return totalPrice;
    }

    private static OrderDetail getOrderDetail(Order order, ProductInfo productInfo, Product product) {
        OrderDetail orderDetail = new OrderDetail();
        orderDetail.setOrder(order);
        orderDetail.setProduct(product);
        orderDetail.setNumberOfProducts(productInfo.getQuantity());
        orderDetail.setPrice(product.getPrice());
        orderDetail.setTotalMoney(order.getTotalMoney() != null ? order.getTotalMoney().doubleValue() : 0L);
        orderDetail.setColor(productInfo.getColorName());
        orderDetail.setBrandId(productInfo.getBrandId());
        orderDetail.setOrderQuantity(1);
        return orderDetail;
    }

    private void checkProductStock(int quantity, Product product) throws BusinessException {
        int productStock = Optional.ofNullable(product.getProductStock())
                .orElseThrow(() -> new BusinessException("CREATE003", "product.invoice.stock.missing"));
        if (quantity > productStock) {
            throw new BusinessException("CREATE001",
                    translate("product.invoice.not.full", String.valueOf(quantity), String.valueOf(productStock)));
        }
    }

    private double calculatePrice(OrderRequestDTO orderRequestDTO, double totalPrice) {
        double shippingFee = Optional.ofNullable(orderRequestDTO.getShippingFee()).orElse(0D);
        double discount = Optional.ofNullable(orderRequestDTO.getDiscount()).orElse(0D);

        return totalPrice + shippingFee - discount;
    }

    private void savePaymentInfo(PaymentInfo paymentInfo, User user, Order savedOrder) {
        Payment payment = Payment.builder()
                .paymentMethod(paymentInfo.getPaymentMethod())
                .paymentStatus(paymentInfo.getPaymentStatus())
                .transactionId(paymentInfo.getTransactionId())
                .user(user)
                .order(savedOrder)
                .createAt(new Date())
                .build();
        paymentRepository.save(payment);
    }

    private Shipping saveShippingInfo(ShippingInfo shippingInfo, Order savedOrder) {
        //luu thong tin shipping
        Shipping shipping = new Shipping();
        shipping.setShippingMethod(shippingInfo.getShippingMethod());
        shipping.setOrderId(savedOrder);
        shipping.setTrackingNumber(shippingInfo.getTrackingNumber());
        shipping.setCarrier(shippingInfo.getCarrier());
        shippingRepository.save(shipping);

        //luu thong tin shipping address
        ShippingAddressInfo shippingAddressInfo = shippingInfo.getShippingAddress();
        ShippingAddress shippingAddress = new ShippingAddress();
        modelMapper.map(shippingAddressInfo, shippingAddress);
        shippingAddress.setShippingId(shipping);
        shippingAddressRepository.save(shippingAddress);

        return shipping;
    }

    private OrderBatchResponse buildOrderBatchResponse(Order order, User user, OrderRequestDTO orderRequestDTO, Shipping shipping,
                                                       Date orderDate, String estimatedDeliveryDateStr, double totalPrice, double priceToPay) {
        return OrderBatchResponse.builder()
                .orderId(order.getId())
                .orderDate(DateUtil.date2ddMMyyyyHHMMss(orderDate))
                .userInfo(UserInfo.builder()
                        .userId(user.getId())
                        .name(user.getFullName())
                        .email(user.getEmail())
                        .phone(user.getPhoneNumber())
                        .build())
                .shippingAddressResp(ShippingAddressResp.builder()
                        .fullName(user.getFullName())
                        .street(shipping.getShippingMethod())
                        .city(orderRequestDTO.getShippingInfo().getShippingAddress().getCity())
                        .district(orderRequestDTO.getShippingInfo().getShippingAddress().getDistrict())
                        .postalCode(orderRequestDTO.getShippingInfo().getShippingAddress().getPostalCode())
                        .country(orderRequestDTO.getShippingInfo().getShippingAddress().getCountry())
                        .phone(user.getPhoneNumber())
                        .build())
                .productInfos(orderRequestDTO.getProductInfos())
                .totalMoney(convertDoubleToString(totalPrice))
                .discount(convertDoubleToString(orderRequestDTO.getDiscount()))
                .shippingFee(convertDoubleToString(orderRequestDTO.getShippingFee()))
                .finalMoney(convertDoubleToString(priceToPay))
                .currency("VND")
                .paymentInfo(orderRequestDTO.getPaymentInfo())
                .shippingInfoResp(ShippingInfoResp.builder()
                        .shippingMethod(shipping.getShippingMethod())
                        .estimatedDeliveryDate(estimatedDeliveryDateStr)
                        .trackingNumber(shipping.getTrackingNumber())
                        .carrier(shipping.getCarrier())
                        .build())
                .orderStatus(OrderStatus.PENDING)
                .notes(orderRequestDTO.getNotes())
                .build();
    }

    public OrderBatchResponse getAllOrderBatchResponse(Order order) {
        //lay ra thong tin Shipping
        ShippingInfoResp shippingInfoResp = new ShippingInfoResp();
        Shipping shipping = shippingRepository.findByOrderId(order.getId());
        ShippingAddress shippingAddress = shippingAddressRepository.findByShippingId(shipping.getId());
        User user = order.getUser();

        //lay ra thong tin orderDetail
        List<OrderDetail> lstOrderDetail = orderDetailRepository.findByOrderId(order.getId());
        //lay ra list ProductInfo
        List<ProductInfo> lstProductInfo = new ArrayList<>();
        for(OrderDetail orderDetail : lstOrderDetail) {
            Product product = orderDetail.getProduct();
            ProductInfo productInfo = ProductInfo.builder()
                    .productId(product.getId())
                    .productName(product.getName())
                    .brandId(orderDetail.getBrandId())
                    .colorName(orderDetail.getColor())
                    .unitPrice(orderDetail.getPrice().intValue())
                    .quantity(orderDetail.getNumberOfProducts())
                    .totalPrice(orderDetail.getTotalMoney().intValue())
                    .build();
            lstProductInfo.add(productInfo);
        }

        //lay ra thong tin payment info
        Payment payment = paymentRepository.findByOrderId(order.getId());
        PaymentInfo paymentInfo = null;
        if (!DataUtil.isNullOrEmpty(payment)) {
            paymentInfo = PaymentInfo.builder()
                    .paymentMethod(payment.getPaymentMethod())
                    .paymentStatus(payment.getPaymentStatus())
                    .transactionId(payment.getTransactionId())
                    .build();
        }

        return OrderBatchResponse.builder()
                .orderId(order.getId())
                .orderDate(DateUtil.date2ddMMyyyyHHMMss(order.getOrderDate()))
                .userInfo(UserInfo.builder()
                        .userId(user.getId())
                        .name(user.getFullName())
                        .email(user.getEmail())
                        .phone(user.getPhoneNumber())
                        .build())
                .shippingAddressResp(ShippingAddressResp.builder()
                        .fullName(user.getFullName())
                        .street(shipping.getShippingMethod())
                        .city(shippingAddress.getCity())
                        .district(shippingAddress.getDistrict())
                        .postalCode(shippingAddress.getPostalCode())
                        .country(shippingAddress.getCountry())
                        .phone(user.getPhoneNumber())
                        .build())
                .productInfos(lstProductInfo)
                .totalMoney(convertDoubleToString(Double.valueOf(order.getTotalMoney())))
//                .discount(convertDoubleToString(orderRequestDTO.getDiscount()))
//                .shippingFee(convertDoubleToString(orderRequestDTO.getShippingFee()))
//                .finalMoney(convertDoubleToString(priceToPay))
                .currency("VND")
                .paymentInfo(paymentInfo)
                .shippingInfoResp(ShippingInfoResp.builder()
                        .shippingMethod(shipping.getShippingMethod())
                        .estimatedDeliveryDate(DateUtil.date2ddMMyyyyHHMMss(DateUtil.addDate(order.getOrderDate(), 5)))
                        .trackingNumber(shipping.getTrackingNumber())
                        .carrier(shipping.getCarrier())
                        .build())
                .orderStatus(OrderStatus.PENDING)
                .notes(order.getNote())
                .build();
    }

    @Override
    public Order getOrderById(Long id) {
        return orderRepository.findById(id).orElse(null);
    }

    @Override
    @Transactional
    public Order updateOrder(Long id, OrderDTO orderDTO) {
        Order order = orderRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException(translate(MessageKeys.NOT_FOUND, id)));
        User existsUser = userRepository.findById(orderDTO.getUserId())
                .orElseThrow(() -> new DataNotFoundException(translate(MessageKeys.NOT_FOUND, orderDTO.getUserId())));

        // tạo một luồng ánh xạ
        modelMapper.typeMap(OrderDTO.class, Order.class)
                .addMappings(mapper -> mapper.skip(Order::setId));
        // cập nhật các trường của đơn hàng từ orderDTO
        modelMapper.map(orderDTO, order);
        order.setUser(existsUser);
        return orderRepository.save(order);
    }

    @Override
    @Transactional
    public void deleteOrder(Long id) {
        // xoá mềm, không xoá cứng bản ghi trong DB
        // no hard-delete, please soft-delete
        Order order = orderRepository.findById(id).orElse(null);
        if (order != null) {
            order.setActive(false);
            orderRepository.save(order);
        }
    }

    @Override
    public List<Order> findByUserId(Long userId) {
        return orderRepository.findByUserId(userId);
    }

    @Override
    public Page<OrderResponse> findByKeyword(String keyword, Pageable pageable) {
        // lấy danh sách sản phẩm theo trang(page) và giới hạn(limit)
        Page<Order> orderPage;
        orderPage = orderRepository.findByKeyword(keyword, pageable);
        return orderPage.map(OrderResponse::fromOrder);
    }

    @Override
    public OrderBatchResponse getOrder(Order order) {
        return getAllOrderBatchResponse(order);
    }

    private static String convertDoubleToString(Double price) {
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getNumberInstance(Locale.US);
        formatter.applyPattern("#,###");
        return formatter.format(price);
    }

}
