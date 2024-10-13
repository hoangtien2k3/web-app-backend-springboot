package com.hoangtien2k3.shopappbackend;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
//@EnableJpaRepositories(basePackages = "com.hoangtien2k3.shopappbackend.repositories.ProductRepository", enableDefaultTransactions = false)
//@EnableElasticsearchRepositories(basePackages = "com.hoangtien2k3.shopappbackend.repositories.ProductSearchRepository", considerNestedRepositories = true, enableDefaultTransactions = false)
public class ShopappBackendApplication {
    public static void main(String[] args) {
        SpringApplication.run(ShopappBackendApplication.class, args);
    }
}
