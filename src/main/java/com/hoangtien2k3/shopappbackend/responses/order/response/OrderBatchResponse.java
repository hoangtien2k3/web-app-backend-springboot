package com.hoangtien2k3.shopappbackend.responses.order.response;

import com.fasterxml.jackson.annotation.JsonIgnore;
import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.dtos.order.PaymentInfo;
import com.hoangtien2k3.shopappbackend.dtos.order.ProductInfo;
import com.hoangtien2k3.shopappbackend.dtos.order.UserInfo;
import lombok.Builder;
import lombok.Data;

import java.util.List;

@Builder
@Data
public class OrderBatchResponse {
    @JsonProperty("order_id")
    private Long orderId;
    @JsonProperty("order_date")
    private String orderDate;
    @JsonProperty("user_info")
    private UserInfo userInfo;
    @JsonProperty("shipping_address")
    private ShippingAddressResp shippingAddressResp;
    @JsonProperty("products")
    private List<ProductInfo> productInfos;
    @JsonProperty("total_money")
    private String totalMoney;
    @JsonProperty("discount")
    @JsonIgnore
    private String discount;
    @JsonIgnore
    @JsonProperty("shipping_free")
    private String shippingFee;
    @JsonProperty("final_money")
    @JsonIgnore
    private String finalMoney;
    @JsonProperty("currency")
    private String currency;
    @JsonProperty("payment_info")
    private PaymentInfo paymentInfo;
    @JsonProperty("shipping_info")
    private ShippingInfoResp shippingInfoResp;
//    @JsonProperty("promotion_details")
//    private PromotionDetailsResp promotionDetailsResp;
    @JsonProperty("order_status")
    private String orderStatus;
    @JsonProperty("notes")
    private String notes;
}
