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
public class UserInfo {
    @JsonProperty("user_id")
    private Long userId;
    private String name;
    private String email;
    private String phone;
}
