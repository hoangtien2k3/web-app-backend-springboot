package com.hoangtien2k3.shopappbackend.services;

import com.hoangtien2k3.shopappbackend.dtos.BrandDTO;
import com.hoangtien2k3.shopappbackend.models.Brand;

import java.util.List;

public interface BrandService {
    Brand createBrand(BrandDTO brandDTO);

    Brand getBrandById(Long brandId);

    List<Brand> getAllBrands();

    Brand updateBrand(Long brandId, BrandDTO brandDTO);

    void deleteBrand(Long brandId);
}
