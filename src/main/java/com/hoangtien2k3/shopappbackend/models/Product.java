package com.hoangtien2k3.shopappbackend.models;

import com.fasterxml.jackson.annotation.JsonManagedReference;
import jakarta.persistence.*;
import lombok.*;

import java.util.ArrayList;
import java.util.List;

@EqualsAndHashCode(callSuper = true)
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
@Entity
//@Document(indexName = "products")
@Table(name = "products")
@EntityListeners(ProductListener.class)  // Envent-driven approach SPRING DATA JPA
public class Product extends BaseEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @Column(name = "name", nullable = false, length = 350)
    private String name;

    @Column(name = "price")
    private Double price;

    @Column(name = "thumbnail", length = 300)
    private String thumbnail;

    @Column(name = "description", columnDefinition = "LONGTEXT")
    private String description;

    @Column(name = "product_original_price")
    private Double productOriginalPrice;

    @Column(name = "product_img")
    private String productImg;

    @Column(name = "product_stock")
    private Integer productStock;

    @ManyToOne
    @JoinColumn(name = "category_id")
    private Category category;

    @JsonManagedReference
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ProductImage> productImages;

    // một sản phẩm có nhiều comments
    @JsonManagedReference
    @OneToMany(mappedBy = "product", cascade = CascadeType.ALL)
    private List<Comment> comments = new ArrayList<>();

    @OneToOne
    @JoinColumn(name = "brand_id")
    private Brand brand;
}
