package com.hoangtien2k3.shopappbackend.controllers;

import com.hoangtien2k3.shopappbackend.components.TranslateMessages;
import com.hoangtien2k3.shopappbackend.dtos.BrandDTO;
import com.hoangtien2k3.shopappbackend.models.Brand;
import com.hoangtien2k3.shopappbackend.responses.ApiResponse;
import com.hoangtien2k3.shopappbackend.services.BrandService;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/brands")
@RequiredArgsConstructor
public class BrandController extends TranslateMessages {

    private final BrandService brandService;

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PostMapping("")
    public ResponseEntity<?> createBrands(@RequestBody @Valid BrandDTO brandDTO,
                                            BindingResult bindingResult) {
        try {
            if (bindingResult.hasErrors()) {
                List<String> errorMessage = bindingResult.getFieldErrors()
                        .stream()
                        .map(FieldError::getDefaultMessage)
                        .toList();
                return ResponseEntity.badRequest().body(
                        ApiResponse.builder()
                                .message(translate(MessageKeys.ERROR_MESSAGE))
                                .errors(errorMessage.stream()
                                        .map(this::translate)
                                        .toList()).build()
                );
            }

            Brand newBrand = brandService.createBrand(brandDTO);
            return ResponseEntity.ok(ApiResponse.builder()
                    .success(true)
                    .message(translate(MessageKeys.CREATE_BRANDS_SUCCESS))
                    .payload(newBrand)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.ok(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.CREATE_BRANDS_FAILED)).build());
        }
    }

    // ai cũng có thể lấy ra danh sách các danh mục sản phẩm
    @GetMapping("")
    public ResponseEntity<ApiResponse<?>> getAllBrands() {
        List<Brand> brands = brandService.getAllBrands();
        /*kafka get all brand*/
        return ResponseEntity.ok(ApiResponse.builder()
                .success(true)
                .payload(brands)
                .build());
    }

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @PutMapping("/{id}")
    public ResponseEntity<?> updateBrands(@PathVariable("id") Long id,
                                              @RequestBody BrandDTO brandDTO) {
        Brand brand = brandService.updateBrand(id, brandDTO);
        return ResponseEntity.ok(ApiResponse.builder().success(true)
                .message(translate(MessageKeys.UPDATE_BRANDS_SUCCESS))
                .payload(brand)
                .build());
    }

//    @PreAuthorize("hasRole('ROLE_ADMIN')")
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteBrand(@PathVariable("id") Long id) {
        try {
            brandService.deleteBrand(id);
            return ResponseEntity.ok(ApiResponse.builder().success(true)
                    .message(translate(MessageKeys.DELETE_BRANDS_SUCCESS))
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(ApiResponse.builder()
                    .error(e.getMessage())
                    .message(translate(MessageKeys.DELETE_BRANDS_SUCCESS))
                    .build());
        }
    }
}
