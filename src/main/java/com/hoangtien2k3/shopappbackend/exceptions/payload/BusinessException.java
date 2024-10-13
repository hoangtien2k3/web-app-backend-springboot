package com.hoangtien2k3.shopappbackend.exceptions.payload;

import lombok.Data;
import lombok.EqualsAndHashCode;
import lombok.NoArgsConstructor;

import java.util.Arrays;

@EqualsAndHashCode(callSuper = true)
@Data
@NoArgsConstructor
public class BusinessException extends RuntimeException{
    private String errorCode;
    private String message;
    private Object[] paramsMsg;

    public BusinessException(String errorCode, String message) {
        this.errorCode = errorCode;
        this.message = message;
    }

    public BusinessException(String errorCode, String message, String... paramsMsg) {
        this.errorCode = errorCode;
        this.paramsMsg = Arrays.stream(paramsMsg).toArray(String[]::new);
        this.message = message;
    }
}
