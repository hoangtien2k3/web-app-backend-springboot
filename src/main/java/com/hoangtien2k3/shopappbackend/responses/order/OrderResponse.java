package com.hoangtien2k3.shopappbackend.responses.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.models.Order;
import com.hoangtien2k3.shopappbackend.responses.BaseResponse;
import com.hoangtien2k3.shopappbackend.responses.order_detail.OrderDetailResponse;
import com.hoangtien2k3.shopappbackend.utils.DateUtil;
import jakarta.persistence.Column;
import lombok.*;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.time.LocalDate;
import java.util.Date;
import java.util.List;
import java.util.Locale;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderResponse extends BaseResponse {
    private Long id;

    @JsonProperty("user_id")
    private Long userId;

    @Column(name = "fullname")
    private String fullName;

    @Column(name = "email")
    private String email;

    @Column(name = "phone_number")
    private String phoneNumber;

    @Column(name = "address")
    private String address;

    @Column(name = "note")
    private String note;

    @Column(name = "order_date")
    private String orderDate;

    @Column(name = "status")
    private String status;

    @Column(name = "total_money")
    private String totalMoney;

    @Column(name = "shipping_method")
    private String shippingMethod;

    @Column(name = "shipping_address")
    private String shippingAddress;

    @Column(name = "shipping_date")
    private LocalDate shippingDate;

    @Column(name = "tracking_number")
    private String trackingNumber;

    @Column(name = "payment_method")
    private String paymentMethod;

    @Column(name = "active")
    private Boolean active;

    @JsonProperty("order_details")
    private List<OrderDetailResponse> orderDetails;

    public static OrderResponse fromOrder(Order order) {
        return OrderResponse.builder()
                .id(order.getId())
                .userId(order.getId())
                .fullName(order.getFullName())
                .phoneNumber(order.getPhoneNumber())
                .email(order.getEmail())
                .address(order.getAddress())
                .note(order.getNote())
                .orderDate(DateUtil.date2ddMMyyyyHHMMss(order.getOrderDate()))
                .status(order.getStatus())
                .totalMoney(convertDoubleToString(order.getTotalMoney()))
                .shippingMethod(order.getShippingMethod())
                .shippingAddress(order.getShippingAddress())
                .shippingDate(order.getShippingDate())
                .trackingNumber(order.getTrackingNumber())
                .paymentMethod(order.getPaymentMethod())
                .active(order.isActive())
                .orderDetails(OrderDetailResponse.fromOrderDetailList(
                        order.getOrderDetails()
                ))
                .build();
    }

    public static List<OrderResponse> fromOrdersList(List<Order> ordersList) {
        return ordersList.stream().map(OrderResponse::fromOrder).toList();
    }

    private static String convertDoubleToString(Float price) {
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getNumberInstance(Locale.US);
        formatter.applyPattern("#,###");
        return formatter.format(price);
    }

}
