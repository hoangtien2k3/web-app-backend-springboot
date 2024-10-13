package com.hoangtien2k3.shopappbackend.services.validate;

import com.hoangtien2k3.shopappbackend.components.TranslateMessages;
import com.hoangtien2k3.shopappbackend.dtos.OrderDTO;
import com.hoangtien2k3.shopappbackend.dtos.ProductDTO;
import com.hoangtien2k3.shopappbackend.dtos.order.OrderRequestDTO;
import com.hoangtien2k3.shopappbackend.exceptions.payload.BusinessException;
import com.hoangtien2k3.shopappbackend.services.ValidateService;
import com.hoangtien2k3.shopappbackend.utils.DataUtil;
import org.springframework.stereotype.Service;

@Service
public class ValidateServiceImpl extends TranslateMessages implements ValidateService {
    @Override
    public void validateProduct(ProductDTO productDTO) {
        if (DataUtil.isNullOrEmpty(productDTO)) {
            throw new BusinessException("PRODUCT001", translate("product.null"));
        }
        if (DataUtil.isNullOrEmpty(productDTO.getCategoryId())) {
            throw new BusinessException("PRODUCT002", translate("product.null.category"));
        }
        if (DataUtil.isNullOrEmpty(productDTO.getPrice())) {
            throw new BusinessException("PRODUCT002", translate("product.null.price"));
        }
        if (DataUtil.isNullOrEmpty(productDTO.getBrandId())) {
            throw new BusinessException("PRODUCT002", translate("product.null.brand.id"));
        }
        if (DataUtil.isNullOrEmpty(productDTO.getName())) {
            throw new BusinessException("PRODUCT002", translate("product.null.name"));
        }
    }

    @Override
    public void validateOrderBatch(OrderRequestDTO orderRequestDTO) {
        if (DataUtil.isNullOrEmpty(orderRequestDTO)) {
            throw new BusinessException("ORDER001", translate("order.request.null.find"));
        }
        if (DataUtil.isNullOrEmpty(orderRequestDTO.getUserId())) {
            throw new BusinessException("ORDER002", translate("order.request.user.info.null"));
        }
        if (DataUtil.isNullOrEmpty(orderRequestDTO.getPaymentInfo())) {
            throw new BusinessException("ORDER003", translate("order.request.payment.info.null"));
        }
        if (DataUtil.isNullOrEmpty(orderRequestDTO.getProductInfos())) {
            throw new BusinessException("ORDER004", translate("order.request.product.info.null"));
        }
        if (DataUtil.isNullOrEmpty(orderRequestDTO.getShippingInfo())) {
            throw new BusinessException("ORDER005", translate("order.request.shipping.info.null"));
        }
        if (DataUtil.isNullOrEmpty(orderRequestDTO.getShippingInfo().getShippingAddress())) {
            throw new BusinessException("ORDER006", translate("order.request.shipping.address.null"));
        }
    }

    @Override
    public void validateOrder(OrderDTO orderDTO) {

    }
}
