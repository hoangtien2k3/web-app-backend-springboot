package com.hoangtien2k3.shopappbackend.services;

import com.hoangtien2k3.shopappbackend.dtos.OrderDTO;
import com.hoangtien2k3.shopappbackend.dtos.order.OrderRequestDTO;
import com.hoangtien2k3.shopappbackend.models.Order;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;
import com.hoangtien2k3.shopappbackend.responses.order.OrderResponse;
import com.hoangtien2k3.shopappbackend.responses.order.response.OrderBatchResponse;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;

import java.util.List;

public interface OrderService {
    ApiResponse<Order> createOrder(OrderDTO orderDTO) throws Exception;

    ApiResponse<OrderBatchResponse> createOrderBatch(OrderRequestDTO orderRequestDTO) throws Exception;

    Order getOrderById(Long id);

    Order updateOrder(Long id, OrderDTO orderDTO);

    void deleteOrder(Long id);

    List<Order> findByUserId(Long userId);

    Page<OrderResponse> findByKeyword(String keyword, Pageable pageable);

    //lay ra thong tin don hang
    OrderBatchResponse getOrder(Order order);
}
