package com.hoangtien2k3.shopappbackend.responses.order.response;

import com.fasterxml.jackson.annotation.JsonProperty;
import lombok.Builder;
import lombok.Data;

import java.util.Date;

@Data
@Builder
public class PromotionDetailsResp {
    @JsonProperty("promotion_code")
    private String promotionCode;
    private String description;
    @JsonProperty("discount_amount")
    private Double discountAmount;
    @JsonProperty("start_date")
    private Date startDate;
    @JsonProperty("end_date")
    private Date endDate;
}
