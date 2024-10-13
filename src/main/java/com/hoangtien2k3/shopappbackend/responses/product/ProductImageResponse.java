package com.hoangtien2k3.shopappbackend.responses.product;

import lombok.Builder;
import lombok.Data;

@Builder
@Data
public class ProductImageResponse {
    private String imageUrl;
}
