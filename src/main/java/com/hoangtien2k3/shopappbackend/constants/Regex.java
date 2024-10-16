/*
 * Copyright 2024 the original author Hoàng Anh Tiến
 *
 * Licensed under the Apache License, Version 2.0 (the "License");
 * you may not use this file except in compliance with the License.
 * You may obtain a copy of the License at
 *
 *      https://www.apache.org/licenses/LICENSE-2.0
 *
 * Unless required by applicable law or agreed to in writing, software
 * distributed under the License is distributed on an "AS IS" BASIS,
 * WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 * See the License for the specific language governing permissions and
 * limitations under the License.
 */
package com.hoangtien2k3.shopappbackend.constants;

public class Regex {
    public static final String PHONE_REGEX = "((\\+84|84|0)+(3|5|7|8|9|1|2[2|4|6|8|9]))+([0-9]{8,9})\\b";
    public static final String NUMBER_REGEX = "\\d+";
    public static final String EMAIL_REGEX = "^(?![-_.@])[\\w.-]+(?<![-_.@])@[a-zA-Z0-9.-]+\\.[a-zA-Z0-9]{2,}$";
    public static final String OTP_REGEX = "^\\d{6}$";
    public static final String PASSWORD_REGEX = "^(?=.*\\d)(?=.*[a-z])(?=.*[A-Z])(?=.*[a-zA-Z]).{8,}$";
    public static final String UTF8_REGEX = "^[ -~]{8,}$";
    public static final String CAMELCASE = "([a-z])([A-Z]+)";

    public static final String DATE_FORMAT = "^([0-2][0-9]|(3)[0-1])(\\/)(((0)[0-9])|((1)[0-2]))(\\/)\\d{4}$";
    public static final String PRODUCT_ID = "^[a-zA-Z0-9\\s-]*$";
    public static final String LINK =
            "^(http:\\/\\/|https:\\/\\/)(www\\.)?[a-zA-Z0-9@:%._\\+~#=]{2,256}(\\.[a-z]{2,6})?(:\\d+)?\\b([-a-zA-Z0-9@:%_\\+.~#?&//=]*)$";

    public static final String TAX_CODE_REGEX = "^\\d\\d{9}$|^\\d\\d{12}$";
    public static final String VIETTEL_NUMBER_FORMAT =
            "^8496\\d{7}$|^8497\\d{7}$|^8498\\d{7}$|^8416\\d{8}$|0?96\\d{7}$|0?97\\d{7}$|^0?98\\d{7}$|^0?16\\d{8}$";
}
