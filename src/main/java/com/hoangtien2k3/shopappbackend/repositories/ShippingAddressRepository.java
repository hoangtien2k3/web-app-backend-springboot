package com.hoangtien2k3.shopappbackend.repositories;

import com.hoangtien2k3.shopappbackend.models.Shipping;
import com.hoangtien2k3.shopappbackend.models.ShippingAddress;
import com.hoangtien2k3.shopappbackend.utils.ConfixSql;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShippingAddressRepository extends JpaRepository<ShippingAddress, Long> {

//    @Query(name = ConfixSql.ShippingAddress.GET_ALL_SHIPPING_ADDRESS, nativeQuery = true)
//    ShippingAddress findByShippingId(@Param("shippingId") Long shippingId);

    @Query("SELECT s FROM ShippingAddress s WHERE s.shippingId.id = :shippingId")
    ShippingAddress findByShippingId(@Param("shippingId") Long shippingId);
}
