package com.hoangtien2k3.shopappbackend.dtos.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ShippingAddressInfo {
    private String street;
    private String city;
    private String district;
    @JsonProperty("postal_code")
    private String postalCode;
    private String country;
}
