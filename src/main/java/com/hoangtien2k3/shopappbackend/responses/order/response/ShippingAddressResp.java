package com.hoangtien2k3.shopappbackend.responses.order.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class ShippingAddressResp {
    @JsonProperty("full_name")
    private String fullName;
    private String street;
    private String city;
    private String district;
    @JsonProperty("postal_code")
    private String postalCode;
    private String country;
    private String phone;
}
