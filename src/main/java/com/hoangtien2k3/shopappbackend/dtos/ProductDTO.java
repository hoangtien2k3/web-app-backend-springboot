package com.hoangtien2k3.shopappbackend.dtos;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import jakarta.validation.constraints.Max;
import jakarta.validation.constraints.Min;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;
import lombok.*;

@Data
@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductDTO {
    @NotBlank(message = MessageKeys.PRODUCT_TITLE_REQUIRED)
    @Size(min = 3, max = 200, message = MessageKeys.PRODUCT_TITLE_SIZE_REQUIRED)
    private String name;

    @Min(value = 0, message = MessageKeys.PRODUCT_PRICE_MIN_REQUIRED)
    @Max(value = 1000000000, message = MessageKeys.PRODUCT_PRICE_MAX_REQUIRED)
    private Double price;

    private String thumbnail;
    private String description;

    @Min(value = 0, message = MessageKeys.PRODUCT_PRICE_MIN_REQUIRED)
    @Max(value = 1000000000, message = MessageKeys.PRODUCT_PRICE_MAX_REQUIRED)
    @JsonProperty("product_original_price")
    private Double productOriginalPrice;

    @JsonProperty("product_img")
    private String productImg;

    @JsonProperty("brand_id")
    private Long brandId;

    @JsonProperty("product_stock")
    private Integer productStock;

    @JsonProperty("category_id")
    private Long categoryId;
}
