package com.hoangtien2k3.shopappbackend.services;

import com.hoangtien2k3.shopappbackend.dtos.OrderDTO;
import com.hoangtien2k3.shopappbackend.dtos.ProductDTO;
import com.hoangtien2k3.shopappbackend.dtos.order.OrderRequestDTO;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;

public interface ValidateService {

    void validateProduct(ProductDTO productDTO);

    void validateOrder(OrderDTO orderDTO);

    void validateOrderBatch(OrderRequestDTO orderRequestDTO);
}
