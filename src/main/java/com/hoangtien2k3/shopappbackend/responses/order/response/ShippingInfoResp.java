package com.hoangtien2k3.shopappbackend.responses.order.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShippingInfoResp {
    @JsonProperty("shipping_method")
    private String shippingMethod;
    @JsonProperty("estimate_delivery_date")
    private String estimatedDeliveryDate;
    @JsonProperty("tracking_number")
    private String trackingNumber;
    private String carrier;
}
