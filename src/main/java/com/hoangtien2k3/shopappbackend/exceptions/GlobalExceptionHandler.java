package com.hoangtien2k3.shopappbackend.exceptions;

import com.hoangtien2k3.shopappbackend.components.TranslateMessages;
import com.hoangtien2k3.shopappbackend.constants.CommonErrorCode;
import com.hoangtien2k3.shopappbackend.exceptions.payload.BusinessException;
import com.hoangtien2k3.shopappbackend.exceptions.payload.DataNotFoundException;
import com.hoangtien2k3.shopappbackend.exceptions.payload.InvalidParamException;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.RestControllerAdvice;
import org.springframework.web.server.ServerWebExchange;
import reactor.core.publisher.Mono;

import java.util.Objects;

@Slf4j
@RestControllerAdvice
@RequiredArgsConstructor
public class GlobalExceptionHandler extends TranslateMessages {

    @ExceptionHandler(value = {
            DataNotFoundException.class,
            InvalidParamException.class
    })
    public ResponseEntity<ApiResponse> handleSpecificExceptions(Exception e) {
        HttpStatus status = HttpStatus.INTERNAL_SERVER_ERROR;

        String detail = translate(MessageKeys.ERROR_MESSAGE);

        if (e instanceof DataNotFoundException) {
            status = HttpStatus.NOT_FOUND;
            detail = e.getMessage();
        } else if (e instanceof InvalidParamException) {
            status = HttpStatus.BAD_REQUEST;
            detail = e.getMessage();
        }

        ApiResponse apiResponse = new ApiResponse();
        apiResponse.setMessage(String.valueOf(status.value()));
        apiResponse.setError(detail);
        return ResponseEntity.status(status).body(apiResponse);
    }

    @ExceptionHandler(value = RuntimeException.class)
    public ResponseEntity<ApiResponse> handlingRuntimeException(RuntimeException exception) {
        log.error("Exception: ", exception);
        ApiResponse apiResponse = new ApiResponse();

        apiResponse.setMessage(String.valueOf(ErrorCode.UNCATEGORIZED_EXCEPTION.getCode()));
        apiResponse.setError(translate(ErrorCode.UNCATEGORIZED_EXCEPTION.getMessage()));
        return ResponseEntity.badRequest().body(apiResponse);
    }

    @ExceptionHandler(value = AppException.class)
    ResponseEntity<ApiResponse> handlingAppException(AppException exception) {
        ErrorCode errorCode = exception.getErrorCode();
        ApiResponse apiResponse = new ApiResponse();

        apiResponse.setMessage(String.valueOf(errorCode.getCode()));
        apiResponse.setError(errorCode.getMessage());
        return ResponseEntity.status(errorCode.getStatusCode()).body(apiResponse);
    }

    @ExceptionHandler(value = AccessDeniedException.class)
    ResponseEntity<ApiResponse> handlingAccessDeniedException(AccessDeniedException exception) {
        ErrorCode errorCode = ErrorCode.UNAUTHORIZED;

        return ResponseEntity.status(errorCode.getStatusCode())
                .body(ApiResponse.builder()
                        .success(false)
                        .message(String.valueOf(errorCode.getCode()))
                        .error(translate(errorCode.getMessage()))
                        .build());
    }

    @ExceptionHandler(BusinessException.class)
    public Mono<ResponseEntity<ApiResponse<Object>>> businessException(
            BusinessException ex, ServerWebExchange serverWebExchange) {
        String errorCode = ex.getErrorCode();
        HttpStatus httpStatus = HttpStatus.BAD_REQUEST;
        if (!DataUtil.isNullOrEmpty(errorCode)) {
            if (errorCode.equals(CommonErrorCode.NOT_FOUND)) {
                httpStatus = HttpStatus.NOT_FOUND;
            } else if (errorCode.equals(CommonErrorCode.NO_PERMISSION)) {
                httpStatus = HttpStatus.FORBIDDEN;
            }
        }
        return Mono.just(new ResponseEntity<>(
                ApiResponse.builder()
                        .success(false)
                        .message(String.valueOf(ex.getMessage()))
                        .error(translate(ex.getErrorCode()))
                        .build(),
                httpStatus));
    }
}