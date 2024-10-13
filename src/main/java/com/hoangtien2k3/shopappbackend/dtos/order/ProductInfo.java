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
public class ProductInfo {
    @JsonProperty("product_id")
    private Long productId;
    @JsonProperty("brand_id")
    private Long brandId;
    @JsonProperty("color_name")
    private String colorName;
    @JsonProperty("product_name")
    private String productName;
    private Integer quantity;
    @JsonProperty("unit_price")
    private Integer unitPrice;
    @JsonProperty("total_price")
    private Integer totalPrice;
}
