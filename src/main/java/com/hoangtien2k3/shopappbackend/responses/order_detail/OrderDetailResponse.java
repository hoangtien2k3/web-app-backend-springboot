package com.hoangtien2k3.shopappbackend.responses.order_detail;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.models.OrderDetail;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import lombok.*;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Locale;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class OrderDetailResponse {
    private Long id;

    @JsonProperty("order_id")
    private Long orderId;

    @JsonProperty("product_id")
    private Long productId;

    private String price;

    @JsonProperty("number_of_products")
    private Integer numberOfProducts;

    @JsonProperty("total_money")
    private Double totalMoney;

    private String color;

    public static OrderDetailResponse fromOrderDetail(OrderDetail orderDetail) {
        if (DataUtil.isNullOrEmpty(orderDetail)) {
            return null;
        }
        return OrderDetailResponse.builder()
                .id(orderDetail.getId())
                .orderId(orderDetail.getOrder().getId())
                .productId(orderDetail.getProduct().getId())
                .price(convertDoubleToString(orderDetail.getPrice()))
                .numberOfProducts(orderDetail.getNumberOfProducts())
                .totalMoney(orderDetail.getTotalMoney())
                .color(orderDetail.getColor())
                .build();
    }

    public static List<OrderDetailResponse> fromOrderDetailList(List<OrderDetail> orderDetailList) {
        if (DataUtil.isNullOrEmpty(orderDetailList)) {
            return new ArrayList<>();
        }
        return orderDetailList.stream()
                .map(orderDetail -> OrderDetailResponse.builder()
                            .id(orderDetail.getId())
                            .orderId(orderDetail.getOrder().getId())
                            .productId(orderDetail.getProduct().getId())
                            .price(convertDoubleToString(orderDetail.getPrice()))
                            .numberOfProducts(orderDetail.getNumberOfProducts())
                            .totalMoney(orderDetail.getTotalMoney())
                            .color(orderDetail.getColor())
                            .build()
                ).toList();
    }

    private static String convertDoubleToString(Double price) {
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getNumberInstance(Locale.US);
        formatter.applyPattern("#,###");
        return formatter.format(price);
    }

}
