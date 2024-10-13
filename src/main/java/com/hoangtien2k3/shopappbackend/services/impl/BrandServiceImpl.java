package com.hoangtien2k3.shopappbackend.services.impl;

import com.hoangtien2k3.shopappbackend.dtos.BrandDTO;
import com.hoangtien2k3.shopappbackend.exceptions.payload.InvalidParamException;
import com.hoangtien2k3.shopappbackend.models.Brand;
import com.hoangtien2k3.shopappbackend.repositories.BrandRepository;
import com.hoangtien2k3.shopappbackend.services.BrandService;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import com.hoangtien2k3.shopappbackend.utils.LocalizationUtils;
import com.hoangtien2k3.shopappbackend.utils.MessageKeys;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.util.List;

@Service
@RequiredArgsConstructor
public class BrandServiceImpl implements BrandService {

    private final BrandRepository brandRepository;
    private final LocalizationUtils localizationUtils;

    @Override
    @Transactional
    public Brand createBrand(BrandDTO brandDTO) {
        Brand newBrand = Brand.builder()
                .brandAddress(brandDTO.getBrandAddress())
                .brandEmail(brandDTO.getBrandEmail())
                .brandPhoneNumber(brandDTO.getBrandPhoneNumber())
                .brandName(brandDTO.getBrandName())
                .build();
        return brandRepository.save(newBrand);
    }

    @Override
    public Brand getBrandById(Long brandId) {
        return brandRepository.findById(brandId).
                orElseThrow(() -> new RuntimeException(localizationUtils.getLocalizedMessage(MessageKeys.NOT_FOUND)));
    }

    @Override
    public List<Brand> getAllBrands() {
        return brandRepository.findAll();
    }

    @Override
    @Transactional
    public Brand updateBrand(Long brandId, BrandDTO brandDTO) {
        Brand oldBrand = getBrandById(brandId);
        if (DataUtil.isNullOrEmpty(brandDTO)) {
            throw new InvalidParamException("Brand không được null hoặc rỗng");
        }
        if (!DataUtil.safeEqual(oldBrand.getBrandAddress(), brandDTO.getBrandAddress())
                && DataUtil.isNullOrEmpty(brandDTO.getBrandAddress())) {
            oldBrand.setBrandAddress(oldBrand.getBrandAddress());
        }
        if (!DataUtil.safeEqual(oldBrand.getBrandEmail(), brandDTO.getBrandEmail())
                && DataUtil.isNullOrEmpty(brandDTO.getBrandEmail())) {
            oldBrand.setBrandEmail(oldBrand.getBrandEmail());
        }
        if (!DataUtil.safeEqual(oldBrand.getBrandPhoneNumber(), brandDTO.getBrandPhoneNumber())
                && DataUtil.isNullOrEmpty(brandDTO.getBrandEmail())) {
            oldBrand.setBrandPhoneNumber(oldBrand.getBrandPhoneNumber());
        }
        if (!DataUtil.safeEqual(oldBrand.getBrandName(), brandDTO.getBrandName())
                && DataUtil.isNullOrEmpty(brandDTO.getBrandEmail())) {
            oldBrand.setBrandName(oldBrand.getBrandName());
        }
        return brandRepository.save(oldBrand);
    }

    @Override
    @Transactional
    public void deleteBrand(Long brandId) {
        Brand oldBrand = getBrandById(brandId);
        if (!DataUtil.isNullOrEmpty(oldBrand)) {
            brandRepository.deleteById(brandId);
        }
    }
}
