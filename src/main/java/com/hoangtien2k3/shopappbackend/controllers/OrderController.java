package com.hoangtien2k3.shopappbackend.controllers;

import com.hoangtien2k3.shopappbackend.components.TranslateMessages;
import com.hoangtien2k3.shopappbackend.dtos.order.OrderRequestDTO;
import com.hoangtien2k3.shopappbackend.dtos.OrderDTO;
import com.hoangtien2k3.shopappbackend.models.Order;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;
import com.hoangtien2k3.shopappbackend.responses.order.OrderPageResponse;
import com.hoangtien2k3.shopappbackend.responses.order.OrderResponse;
import com.hoangtien2k3.shopappbackend.responses.order.response.OrderBatchResponse;
import com.hoangtien2k3.shopappbackend.services.OrderService;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.context.support.DefaultMessageSourceResolvable;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.Objects;

@RestController
@RequestMapping("${api.prefix}/orders")
@RequiredArgsConstructor
public class OrderController extends TranslateMessages {

    private final OrderService orderService;

//    @PreAuthorize("hasRole('ROLE_USER')")
    @PostMapping("")
    public ResponseEntity<?> createOrder(@RequestBody @Valid OrderDTO orderDTO,
                                         BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            List<String> errorMessages = bindingResult.getFieldErrors()
                    .stream()
                    .map(DefaultMessageSourceResolvable::getDefaultMessage)
                    .toList();
            return ResponseEntity.badRequest().body(
                    ApiResponse.builder()
                            .errors(errorMessages.stream()
                                    .map(this::translate)
                                    .toList()).build()
            );
        }
        ApiResponse<Order> order = orderService.createOrder(orderDTO);
        if (!order.isSuccess() && Objects.equals(order.getError(), "-1")) {
            return ResponseEntity.badRequest().body(
                    ApiResponse.builder()
                            .error("-1")
                            .message(translate(MessageKeys.CREATE_ORDER_FAILED))
                            .errors(order.getErrors())
                            .build()
            );
        }
        return ResponseEntity.ok().body(
                ApiResponse.<Order>builder().success(true)
                        .message(translate(MessageKeys.CREATE_ORDER_SUCCESS, order.getId()))
                        .payload(order.getPayload()).build()
        );
    }

    //Tạo chi tiết đơn hàng
    @PostMapping("/create")
    public ResponseEntity<?> createOrderBatch(@RequestBody @Valid OrderRequestDTO orderInfoDTO,
                                              BindingResult bindingResult) throws Exception {
        if (bindingResult.hasErrors()) {
            List<String> errorMessages = bindingResult.getFieldErrors()
                    .stream()
                    .map(DefaultMessageSourceResolvable::getDefaultMessage)
                    .toList();
            return ResponseEntity.badRequest().body(
                    ApiResponse.builder().errors(errorMessages.stream().map(this::translate).toList()).build()
            );
        }
        ApiResponse<OrderBatchResponse> apiResponse = orderService.createOrderBatch(orderInfoDTO);
        if (DataUtil.isNullOrEmpty(apiResponse) && !apiResponse.isSuccess() && !Objects.equals(apiResponse.getError(), "1")) {
            return ResponseEntity.badRequest().body(
                    ApiResponse.builder().error("-1").message(translate(MessageKeys.CREATE_ORDER_FAILED)).build()
            );
        }
        return ResponseEntity.ok().body(
                ApiResponse.<OrderBatchResponse>builder().success(true).message(translate(MessageKeys.CREATE_ORDER_SUCCESS, apiResponse.getId())).payload(apiResponse.getPayload()).build()
        );
    }

    /**
     * Lấy ra danh sách đơn hàng theo user_id
     **/
//    @PreAuthorize("hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER')")
    @GetMapping("/user/{user_id}")
    public ResponseEntity<?> getOrders(@Valid @PathVariable("user_id") Long userId) {
        try {
            // lấy ra danh sách đơn hàng của userId
            List<Order> orders = orderService.findByUserId(userId);
            List<OrderResponse> orderResponses = OrderResponse.fromOrdersList(orders);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .payload(orderResponses)
                    .build()
            );
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.GET_INFORMATION_FAILED)).build());
        }
    }

    /*
    lẩy ra chi tiết đơn hàng theo order_id
    */
//    @PreAuthorize("hasRole('ROLE_ADMIN') OR hasRole('ROLE_USER')")
    @GetMapping("/{id}")
    public ResponseEntity<?> getOrder(@Valid @PathVariable("id") Long orderId) {
        try {
            Order existsOrder = orderService.getOrderById(orderId);
//            OrderBatchResponse orderResponse = orderService.getOrder(existsOrder);
            OrderResponse orderResponse = OrderResponse.fromOrder(existsOrder);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .payload(orderResponse).build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.GET_INFORMATION_FAILED)).build()
            );
        }
    }

    /*
    Lấy ra tất cả các đơn hàng với quyền ADMIN
    */
//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @GetMapping("/get-order-by-keyword")
    public ResponseEntity<OrderPageResponse> getOrderByKeyword(
            @RequestParam(defaultValue = "", required = false) String keyword,
            @RequestParam(defaultValue = "0", name = "page") int page,
            @RequestParam(defaultValue = "10", name = "limit") int limit
    ) {
        // tạo Pageable từ thông tin trang và giới hạn
        PageRequest pageRequest = PageRequest.of(
                page,
                limit,
                Sort.by("id").ascending()
        );
        Page<OrderResponse> orderPage = orderService.findByKeyword(keyword, pageRequest);
        List<OrderResponse> orders = orderPage.getContent();
        return ResponseEntity.ok(OrderPageResponse.builder()
                .orders(orders)
                .pageNumber(page)
                .totalElements(orderPage.getTotalElements())
                .pageSize(orderPage.getSize())
                .isLast(orderPage.isLast())
                .totalPages(orderPage.getTotalPages())
                .build());
    }

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PutMapping("/{id}")
    public ResponseEntity<?> updateOrder(
            @Valid @PathVariable long id,
            @Valid @RequestBody OrderDTO orderDTO
    ) {
        try {
            Order order = orderService.updateOrder(id, orderDTO);
            return ResponseEntity.ok().body(ApiResponse.builder()
                    .success(true)
                    .message(translate(MessageKeys.MESSAGE_UPDATE_GET, order.getId()))
                    .payload(order).build()
            );
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.GET_INFORMATION_FAILED)).build()
            );
        }
    }

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrder(@Valid @PathVariable long id) {
        // xoá mềm => cập nhật trường active false
        try {
            orderService.deleteOrder(id);
            return ResponseEntity.ok().body(ApiResponse.builder()
                    .success(true)
                    .message(translate(MessageKeys.MESSAGE_DELETE_SUCCESS, id))
                    .id(id).build());
        } catch (Exception e) {
            return ResponseEntity.ok().body(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.MESSAGE_DELETE_FAILED, id)).build());
        }
    }
}
