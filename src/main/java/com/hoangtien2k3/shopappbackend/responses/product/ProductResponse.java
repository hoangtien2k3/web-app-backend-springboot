package com.hoangtien2k3.shopappbackend.responses.product;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.hoangtien2k3.shopappbackend.models.Brand;
import com.hoangtien2k3.shopappbackend.models.Product;
import com.hoangtien2k3.shopappbackend.models.ProductImage;
import com.hoangtien2k3.shopappbackend.responses.BaseResponse;
import com.hoangtien2k3.shopappbackend.responses.comment.CommentResponse;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import com.hoangtien2k3.shopappbackend.utils.DateUtil;
import lombok.*;

import java.text.DecimalFormat;
import java.text.NumberFormat;
import java.util.*;
import java.util.stream.Collectors;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class ProductResponse extends BaseResponse {
    private Long id;
    private String name;
    private String price;
    @JsonProperty("product_original_price")
    private String productOriginalPrice;
    private String thumbnail;
    private String description;
    @JsonProperty("product_img")
    private String productImg;
    @JsonProperty("product_images")
    private List<ProductImageResponse> productImages = new ArrayList<>();
    @JsonProperty("comments")
    private List<CommentResponse> comments = new ArrayList<>();
    @JsonProperty("brand")
    private Brand brand;
    @JsonProperty("category_id")
    private Long categoryId;
    @JsonProperty("product_stock")
    private Integer productStock;
    @JsonProperty("create_at")
    private String createAt;
    @JsonProperty("update_at")
    private String updateAt;

    public static ProductResponse fromProduct(Product product) {
        return ProductResponse.builder()
                .id(product.getId())
                .name(product.getName())
                .price(formatPrice(product.getPrice()))
                .productOriginalPrice(formatPrice(product.getProductOriginalPrice()))
                .thumbnail(product.getThumbnail())
                .productImg(product.getProductImg())
                .description(product.getDescription())
                .categoryId(product.getCategory().getId())
                .productImages( fromLstProductImage(product.getProductImages()))
                .productStock(product.getProductStock())
                .brand(product.getBrand())
                .comments(Optional.ofNullable(product.getComments())
                        .orElse(Collections.emptyList())
                        .stream()
                        .map(CommentResponse::fromComment)
                        .toList())
                .createAt(DateUtil.date2ddMMyyyyString(product.getCreatedAt()))
                .updateAt(DateUtil.date2ddMMyyyyString(product.getUpdatedAt()))
                .build();
    }

    private static String formatPrice(double price) {
        DecimalFormat formatter = (DecimalFormat) NumberFormat.getNumberInstance(Locale.US);
        formatter.applyPattern("#,###");
        return formatter.format(price);
    }

    public static List<ProductImageResponse> fromLstProductImage(List<ProductImage> lstProductImage) {
        if (DataUtil.isNullOrEmpty(lstProductImage)) {
            return new ArrayList<>();
        }
        return lstProductImage.stream()
                .map(productImage -> new ProductImageResponse(productImage.getImageUrl()))
                .collect(Collectors.toList());
    }
}
