package com.hoangtien2k3.shopappbackend.dtos.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

import java.util.Date;
import java.util.List;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class OrderRequestDTO {
    @JsonProperty("order_date")
    private Date orderDate;
    @JsonProperty("user_id")
    private Long userId;
    @JsonProperty("products")
    private List<ProductInfo> productInfos;

//    @JsonProperty("total_money")
//    private Double totalMoney;
//    @JsonProperty("final_money")
//    private Double finalMoney;

    @JsonProperty("discount")
    private Double discount;
    @JsonProperty("shipping_free")
    private Double shippingFee;

//    @JsonProperty("promotion_details")
//    private PromotionDetails promotionDetails;

    @JsonProperty("currency")
    private String currency;
    @JsonProperty("payment")
    private PaymentInfo paymentInfo;
    @JsonProperty("shipping")
    private ShippingInfo shippingInfo;

    @JsonProperty("order_status")
    private String orderStatus;
    @JsonProperty("notes")
    private String notes;
}
