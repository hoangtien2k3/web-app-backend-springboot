package com.hoangtien2k3.shopappbackend.responses.user;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.*;

@Getter
@Setter
@Builder
@AllArgsConstructor
@NoArgsConstructor
public class LoginResponse {
    @JsonProperty("type")
    private String type;

    @JsonProperty("access_token")
    private String token;

    @JsonProperty("access_token_expire")
    private String tokenExpireDate;

    @JsonProperty("refresh_token")
    private String refreshToken;

    @JsonProperty("refresh_token_expire")
    private String refreshTokenExpireDate;
}
