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
public class PaymentInfo {
    @JsonProperty("payment_method")
    private String paymentMethod;
    @JsonProperty("payment_status")
    private Integer paymentStatus;
    @JsonProperty("transaction_id")
    private Integer transactionId;
}
