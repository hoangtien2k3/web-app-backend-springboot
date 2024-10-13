package com.hoangtien2k3.shopappbackend.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@Builder
@NoArgsConstructor
@AllArgsConstructor
public class BrandDTO {
//    @JsonProperty("brand_id")
//    private Long brandId;
    @JsonProperty("brand_name")
    private String brandName;
    @JsonProperty("brand_email")
    private String brandEmail;
    @JsonProperty("brand_phone_number")
    private String brandPhoneNumber;
    @JsonProperty("brand_address")
    private String brandAddress;
}
