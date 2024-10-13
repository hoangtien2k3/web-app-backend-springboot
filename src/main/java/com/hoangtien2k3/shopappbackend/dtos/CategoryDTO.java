package com.hoangtien2k3.shopappbackend.dtos;

import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import jakarta.validation.constraints.NotEmpty;
import lombok.*;

@Data
@AllArgsConstructor
@NoArgsConstructor
public class CategoryDTO {
    @NotEmpty(message = MessageKeys.CATEGORIES_NAME_REQUIRED)
    private String name;
}
