package com.hoangtien2k3.shopappbackend.repositories;

import com.hoangtien2k3.shopappbackend.models.Shipping;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShippingRepository extends JpaRepository<Shipping, Long> {

    @Query("SELECT s FROM Shipping s WHERE s.orderId.id = :orderId")
    Shipping findByOrderId(@Param("orderId") Long orderId);

}
