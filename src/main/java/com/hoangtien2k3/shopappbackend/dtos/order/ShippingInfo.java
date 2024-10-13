package com.hoangtien2k3.shopappbackend.dtos.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class ShippingInfo {
    @JsonProperty("shipping_method")
    private String shippingMethod;
    @JsonProperty("shipping_address")
    private ShippingAddressInfo shippingAddress;
    @JsonProperty("tracking_number")
    private String trackingNumber;
    private String carrier;
}
