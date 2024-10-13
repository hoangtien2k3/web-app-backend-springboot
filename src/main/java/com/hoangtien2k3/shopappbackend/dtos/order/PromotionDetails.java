package com.hoangtien2k3.shopappbackend.dtos.order;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

@Data
@Builder
public class PromotionDetails {
    @JsonProperty("promotion_code")
    private String promotionCode; //ma khuyen mai
    @JsonProperty("discount_percentage")
    private Integer discountPercentage; //giam bao nhieu phan tram
}
