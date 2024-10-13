package com.hoangtien2k3.shopappbackend.utils;

import javax.xml.datatype.DatatypeConfigurationException;
import javax.xml.datatype.DatatypeFactory;
import javax.xml.datatype.XMLGregorianCalendar;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.ZoneId;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;

/**
 * @author hoangtien2k3
 * @version 1.0
 */
public final class DateUtil {

    public static boolean compare(Date date1, Date date2, String format) throws Exception {
        if (date1 == null || date2 == null) {
            return false;
        }

        SimpleDateFormat dateFormat = new SimpleDateFormat(format);
        return dateFormat.format(date1).equals(dateFormat.format(date2));
    }

    public static String dateTime2Stringddmmyyyy(Date value) {
        return date2ddMMyyyyHHMMss(value);
    }

    public static boolean equalOnlyField(Date date1, Date date2, int type) {
        if (date1 == null || date2 == null) {
            return false;
        }
        Calendar c1 = Calendar.getInstance();
        Calendar c2 = Calendar.getInstance();
        c1.setTime(date1);
        c2.setTime(date2);
        return c1.get(type) == c2.get(type);
    }

    /**
     * add day
     *
     * @param nowDate Date
     * @param period  integer
     * @return Date
     */
    public static Date addDay(Date nowDate, int period) {
        LocalDateTime localDate=nowDate.toInstant()
            .atZone(ZoneId.systemDefault())
            .toLocalDateTime();
       return Date
            .from(localDate.plusDays(period).atZone(ZoneId.systemDefault())
                .toInstant());
    }

    /**
     * @param date1 Date
     * @param date2 Date
     * @return long
     */
    public static long minusDate(Date date1, Date date2) {
        return date1.getTime() - date2.getTime();
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2MMyyString(Date value) {
        if (value != null) {
            SimpleDateFormat date = new SimpleDateFormat("MM/yyyy");
            return date.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2ddMMyyNoSlashString(Date value) {
        if (value != null) {
            SimpleDateFormat date = new SimpleDateFormat("ddMMyyyy");
            return date.format(value);
        }
        return "";
    }

    public static String date2yyyyMMddStringWithSlash(Date value) {
        return date2String(value);
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2yyyyMMddHHString(Date value) {
        return dateH2StringNoSlash(value);
    }

    public static Date string2DateTime(String value) throws ParseException {
        if (!DataUtil.isNullOrEmpty(value)) {
            SimpleDateFormat dateTime = new SimpleDateFormat(
                    "dd/MM/yyyy hh:mm:ss");
            return dateTime.parse(value);
        }
        return null;
    }

    public static Date string2Date(String value) {
        return DateUtil.string2DateByPattern(value, "dd/MM/yyyy");
    }

    public static Date string2DateByPattern(String value, String pattern) {
        if (!DataUtil.isNullOrEmpty(value)) {
            SimpleDateFormat dateTime = new SimpleDateFormat(pattern);
            dateTime.setLenient(false);
            try {
                return dateTime.parse(value);
            } catch (ParseException ex) {
                return null;
            }
        }
        return null;
    }

    private DateUtil() {
    }

    /**
     * @param value String
     * @return Date
     */
    public static Date string2Date(String value, String format) {
        try {
            SimpleDateFormat dbUpdateDateTime = new SimpleDateFormat(format);
            return dbUpdateDateTime.parse(value);
        } catch (ParseException ignored) {
        }

        return new Date();
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2String(Date value) {
        if (value != null) {
            SimpleDateFormat date = new SimpleDateFormat("yyyy/MM/dd");
            return date.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2StringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat dateNoSlash = new SimpleDateFormat("yyyyMMdd");
            return dateNoSlash.format(value);
        }
        return "";
    }

    public static Date addDate(Date date, int numDate) {
        if (date != null) {
            Calendar cal = Calendar.getInstance();
            cal.setTime(date);
            cal.add(Calendar.DATE, numDate);
            date = cal.getTime();
        }
        return date;
    }

    /**
     * @param value Date
     * @return String
     */
    public static String dateH2StringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat dateNoSlash = new SimpleDateFormat("yyyyMMddHH");
            return dateNoSlash.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String dateTime2StringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("yyyyMMddHHmmss");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String dateTime2String(Date value) {
        if (value != null) {
            SimpleDateFormat dateTime = new SimpleDateFormat(
                    "yyyy/MM/dd HH:mm:ss");
            return dateTime.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String dbUpdateDateTime2String(Date value) {
        return dateyyyyMMddHHmmSS(value);
    }

    /**
     * @param value Date
     * @return Timestamp
     */
    public static Timestamp date2Timestamp(Date value) {
        if (value != null) {
            return new Timestamp(value.getTime());
        }
        return null;
    }

    /**
     * @return Date
     */
    public static Date sysDate() {
        return new Date();
    }

    /**
     * return now if input date is null, otherwise return date
     *
     * @param date
     * @return
     */
    public static Date dateToNow(Date date) {
        return date == null ? new Date() : date;
    }

    /**
     * @return Date
     */
    public static Date sysdateYmd() {
        return nextdate(0);
    }

    /**
     * @param day integer
     * @return Date
     */
    public static Date nextdate(int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),
                calendar.get(Calendar.DATE) + day, 0, // hour
                0, // min
                0); // sec
        calendar.clear(Calendar.MILLISECOND);
        return calendar.getTime();
    }

    /**
     * @param date Date
     * @param day  integer
     * @return Date
     */
    public static Date nextdate(Date date, int day) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(calendar.get(Calendar.YEAR), calendar.get(Calendar.MONTH),
                calendar.get(Calendar.DATE) + day, 0, // hour
                0, // min
                0); // sec
        calendar.clear(Calendar.MILLISECOND);
        return calendar.getTime();
    }

    /**
     * get the next n month.
     *
     * @param date  Date
     * @param month number of next month
     * @return Date
     */
    public static Date nextMonth(Date date, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) + month,
                calendar.get(Calendar.DATE),
                0, // hour
                0, // min
                0); // sec
        calendar.clear(Calendar.MILLISECOND);
        return calendar.getTime();
    }

    public static Date nextMonthDateTime(Date date, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.add(Calendar.MONTH, month);
        return calendar.getTime();
    }

    /**
     * get the previos n month
     *
     * @param date  Date
     * @param month integer
     * @return Date
     */
    public static Date getPreMonthDate(Date date, int month) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        calendar.set(calendar.get(Calendar.YEAR),
                calendar.get(Calendar.MONTH) - month,
                calendar.get(Calendar.DATE),
                0, // hour
                0, // min
                0); // sec
        calendar.clear(Calendar.MILLISECOND);
        return calendar.getTime();

    }

    /**
     * @return String
     */
    public static String sysdateString() {
        SimpleDateFormat dbUpdateDateTime = new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
        return dbUpdateDateTime.format(new Date());
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDate() {
        return new SimpleDateFormat("yyyy/MM/dd");
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDateTime() {
        return new SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDateTimeMinute() {
        return new SimpleDateFormat("yyyy/MM/dd HH:mm");
    }

    /**
     * [timestampToStringFF function.].<br>
     * [Detail description of method.]
     *
     * @param date Timestamp
     * @return String
     */
    public static String timestampToStringFF(Timestamp date) {
        if (date != null) {
            SimpleDateFormat dbDateTimeString = new SimpleDateFormat(
                    "yyyy-MM-dd HH:mm:ss.SSS");
            return dbDateTimeString.format(date);
        }
        return "";
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getDbUpdateDateTime() {
        return new SimpleDateFormat(
                "yyyy-MM-dd HH:mm:ss");
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getYYYYMM() {
        return new SimpleDateFormat("yyyyMM");
    }

    /**
     * @return SimpleDateFormat
     */
    public static SimpleDateFormat getMMdd() {
        return new SimpleDateFormat("MM/dd");
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2ddMMyyyyString(Date value) {
        if (value != null) {
            SimpleDateFormat ddMMyyyy = new SimpleDateFormat("dd/MM/yyyy");
            return ddMMyyyy.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String getFirstDateOfMonth(Date value) {
        if (value != null) {
            SimpleDateFormat MMyyyy = new SimpleDateFormat("MM/yyyy");
            return "01/" + MMyyyy.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2MMyyyyString(Date value) {
        return date2MMyyString(value);
    }

    /**
     * date to yyMMddString
     *
     * @param value Date
     * @return String
     */
    public static String date2yyMMddString(Date value) {
        if (value != null) {
            SimpleDateFormat yyMMdd = new SimpleDateFormat("yy/MM/dd");
            return yyMMdd.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2yyMMddStringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat yyMMdd = new SimpleDateFormat("yyMMdd");
            return yyMMdd.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2yyyyMMStringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat yyyymm = new SimpleDateFormat("yyyyMM");
            return yyyymm.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2yyyyMMddStringNoSlash(Date value) {
        return date2StringNoSlash(value);
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2yyMMStringNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat yymm = new SimpleDateFormat("yyMM");
            return yymm.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2MMddString(Date value) {
        if (value != null) {
            SimpleDateFormat mmdd = new SimpleDateFormat("MM/dd");
            return mmdd.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String second2String(Date value) {
        if (value != null) {
            return SimpleDateFormat.getTimeInstance(SimpleDateFormat.MEDIUM).format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return []String
     */
    public static String[] getSplitDate(Date value) {
        if (value != null) {
            DecimalFormat df = new DecimalFormat("00");
            String[] dateTime = dateTime2String(value).split(" ");
            String[] date = new String[6];
            String[] tmpDate = dateTime[0].split("/");
            date[0] = df.format(Integer.parseInt(tmpDate[0]));
            date[1] = df.format(Integer.parseInt(tmpDate[1]));
            date[2] = df.format(Integer.parseInt(tmpDate[2]));
            tmpDate = dateTime[1].split(":");
            date[3] = df.format(Integer.parseInt(tmpDate[0]));
            date[4] = df.format(Integer.parseInt(tmpDate[1]));
            date[5] = df.format(Integer.parseInt(tmpDate[2]));
            return date;
        }
        return new String[6];
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2MMddTime(Date value) {
        if (value != null) {
            SimpleDateFormat mmdd = new SimpleDateFormat("MM/dd HH:mm:ss");
            return mmdd.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2YYYYMMddTime(Date value) {
        return dateTime2String(value);
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2HHMMssNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("HHmmss");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2ddMMyyyyHHMMssNoSlash(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("ddMMyyyyHHmmss");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }


    /**
     * @param value Date
     * @return String
     */
    public static String dateyyyyMMddHHmmSS(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }

    /**
     * @param value Date
     * @return String
     */
    public static String dateyyyyMMdd(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("yyyy-MM-dd");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }

    /**
     * @return
     */
    public static Timestamp nowDateMilli() {
        return new Timestamp(sysDate().getTime());
    }

    /**
     * @param date Date
     * @return integer
     */
    public static int getYY(Date date) {

        Calendar calendar = Calendar.getInstance();
        calendar.setTime(date);
        return (calendar.get(Calendar.YEAR)) % 100;
    }

    /**
     * @param nowDate Date
     * @return integer
     */
    public static int getMonth(Date nowDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        return calendar.get(Calendar.MONTH) + 1;
    }

    /**
     * @param nowDate Date
     * @return integer
     */
    public static int getDay(Date nowDate) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        return calendar.get(Calendar.DAY_OF_WEEK);
    }

    //==========================================================================

    /**
     * addMilli.<br>
     *
     * @param nowDate Date
     * @param period  integer
     * @return Timestamp
     */
    //==========================================================================
    public static Timestamp addMilli(Timestamp nowDate, int period) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        calendar.add(Calendar.MILLISECOND, period);

        return date2Timestamp(calendar.getTime());
    }

    /**
     * add minute
     *
     * @param nowDate Date
     * @param period  integer
     * @return Date
     */
    public static Date addMinute(Date nowDate, int period) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        calendar.add(Calendar.MINUTE, period);

        return calendar.getTime();
    }

    public static Date getddMMyyyy(Date date) throws Exception {
        Date result = date;
        if (result != null) {
            String strDate = DateUtil.date2ddMMyyyyString(date);
            result = DateUtil.string2Date(strDate);
        }
        return result;
    }

    public static Date convertSqlDateToUtilDate(java.sql.Date sqlDate) {
        return new Date(sqlDate.getTime());
    }

    public static Date convertStringToTime(String date, String pattern) throws ParseException {
        if (date == null || date.trim().isEmpty()) {
            return null;
        }
        SimpleDateFormat dateFormat = new SimpleDateFormat(pattern);
        return dateFormat.parse(date);

    }

    /**
     * Ham Reset thoi gian ve cung mot thoi diem
     *
     * @param dateTime
     * @return
     */
    public static Date truncTime(Date dateTime) {
        Calendar cal = Calendar.getInstance();
        try {
            cal.setTime(dateTime);
            cal.set(Calendar.HOUR, 0);
            cal.set(Calendar.MINUTE, 0);
            cal.set(Calendar.SECOND, 0);
            cal.set(Calendar.MILLISECOND, 0);
        } catch (Exception ex) {
            return null;
        }
        return cal.getTime();
    }

    public static String date2StringByPattern(Date date, String pattern) throws ParseException {
        if (date == null || DataUtil.isNullOrEmpty(pattern)) {
            return null;
        }

        DateFormat df = new SimpleDateFormat(pattern);
        return df.format(date);
    }

    public static void main(String[] args) throws Exception {
        Date now = Calendar.getInstance().getTime();
        Date now2 = DateUtil.addMonth(now, 1);

//        System.out.println(daysBetween2Dates(now, now2));
//        System.out.println(daysBetween2Dates(now2, now));
        System.out.println(string2DateByPattern("12132018", "ddMMyyyy"));
    }

    public static String dateToStringWithPattern(Date date, String pattern) {
        try {
            SimpleDateFormat sdf = new SimpleDateFormat(pattern);
            return sdf.format(date);
        } catch (Exception e) {
            SimpleDateFormat sdf = new SimpleDateFormat("dd/MM/yyyy");
            return sdf.format(date);
        }
    }

    public static Long date2LongUpdateDateTime(Date value) {
        if (value != null) {
            SimpleDateFormat date = new SimpleDateFormat("yyyyMMddHHmmss");
            String updateDateTime = date.format(value);
            return Long.parseLong(updateDateTime);
        }
        return null;
    }

    /**
     * kiem tra tuoi khach hang o nam trong khoang min - max hay ko
     *
     * @param minOld
     * @param maxOld
     * @param customerBirthDay
     * @param sysDate
     * @return
     * @throws Exception
     * @author hoangtien2k3
     */
    public static boolean checkCustomerAge(int minOld, int maxOld, Date customerBirthDay, Date sysDate) throws Exception {
        Calendar birthDateCalendar = Calendar.getInstance();
        birthDateCalendar.setTime(customerBirthDay);
        Calendar currDateCalendar = Calendar.getInstance();
        currDateCalendar.setTime(sysDate);

        int yearOfBirthDate = birthDateCalendar.get(Calendar.YEAR);

        int yearOfCurrDate = currDateCalendar.get(Calendar.YEAR);

        return minOld <= yearOfCurrDate - yearOfBirthDate && maxOld >= yearOfCurrDate - yearOfBirthDate;
    }


    /**
     * convert date sang string dinh dang nam-thang-ngay-gio-phut-giay
     *
     * @param value
     * @return
     * @author quangkm
     */
    public static String date2yyyyMMddHHmmSsString(Date value) {
        return dateTime2StringNoSlash(value);
    }

    /**
     * @param value Date
     * @return String
     */
    public static String date2ddMMyyyyHHMMss(Date value) {
        if (value != null) {
            SimpleDateFormat dateTimeNoSlash = new SimpleDateFormat("dd/MM/yyyy HH:mm:ss");
            return dateTimeNoSlash.format(value);
        }
        return "";
    }

    /**
     * @param date
     * @param numMonth
     * @return
     * @desc + / - thang
     */
    public static Date addMonth(Date date, int numMonth) {
        LocalDateTime today = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDateTime();
        return Date.from(today.plusMonths(numMonth).atZone(ZoneId.systemDefault()).toInstant());
    }

    public static Date addMonth(Date date, int... numMonth) {
        for (int i : numMonth) {
            date = addMonth(date, i);
        }
        return date;
    }

    public static Date getLastDayOfMonth(Date date) {
        LocalDate today = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return Date.from(today.withDayOfMonth(today.getMonth().length(today.isLeapYear())).atStartOfDay()
            .atZone(ZoneId.systemDefault())
            .toInstant());
    }

    public static Date getFirstDayOfMonth(Date date) {
        LocalDate today = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return Date.from(today.withDayOfMonth(1).atStartOfDay().atZone(ZoneId.systemDefault()).toInstant());
    }

    public static XMLGregorianCalendar convertToXmlDate(Date date) throws DatatypeConfigurationException {
        GregorianCalendar c = new GregorianCalendar();
        c.setTime(date);
        return DatatypeFactory.newInstance().newXMLGregorianCalendar(c);
    }

    /**
     * @param strDate1
     * @param strDate2
     * @return
     * @date
     * @author T
     * @description
     */
    public static boolean greaterOrEqualsddMMyyyy(String strDate1, String strDate2, int type) {
        String pattern = "dd/MM/yyyy";
        if (strDate1 == null || strDate1 == "" || strDate2 == null | strDate2 == "") {
            return false;
        }
        Date date1 = string2DateByPattern(strDate1, pattern);
        Date date2 = string2DateByPattern(strDate2, pattern);
        return greaterOrEqualsddMMyyyy(date1, date2, type);
    }

    /**
     * @param date1
     * @param date2
     * @return
     * @date
     * @author hoangtien2k3
     * @description So sanh chinh xac 2 ngay
     */
    public static boolean greaterOrEqualsddMMyyyy(Date date1, Date date2, int type) {
        return date1.compareTo(date2) > 0 || equalsByTypeddMMyyyy(date1, date2, type);
    }

    /**
     * @param date1
     * @param date2
     * @return
     * @date
     * @author hoangtien2k3
     * @description
     */
    public static boolean equalsByTypeddMMyyyy(Date date1, Date date2, int type) {
        return equalOnlyField(date1, date2, type) && equalOnlyField(date1, date2, Calendar.YEAR);
    }

    public static boolean isDate(String str, String datePartern) {
        SimpleDateFormat sdf = new SimpleDateFormat(datePartern);
        try {
            sdf.setLenient(false);
            Date date = sdf.parse(str);
            if (date == null) {
                return false;
            }
        } catch (Exception ex) {
            return false;
        }
        return true;
    }

    public static LocalDateTime toLocalDateTime(Long epochMilli) {
        return LocalDateTime.ofInstant(java.time.Instant.ofEpochMilli(epochMilli), ZoneId.systemDefault());
    }

    public static String getDurationString(Long seconds,String lbHours,String lbMinutes,String lbseconds) {
        long hours = seconds / 3600;
        long minutes = (seconds % 3600) / 60;
        seconds = seconds % 60;
        String rs = "";
        if ((hours != 0)) {
            rs += twoDigitString(hours) + " " + lbHours + " ";
        }
        if ((minutes != 0)) {
            rs += twoDigitString(minutes) + " " + lbMinutes + " ";
        }
        if ((seconds != 0)) {
            rs += twoDigitString(seconds) + " " + lbseconds + " ";
        }
        return rs.trim();
    }

    private static String twoDigitString(Long number) {
        if (number == 0) {
            return "00";
        }
        if (number / 10 == 0) {
            return   String.valueOf(number);
        }
        return String.valueOf(number);
}

    public static Long convertTimeExpressionToSeconds(String timeExpression) {
        long seconds = 0L;
        if (!DataUtil.isNullOrEmpty(timeExpression)) {
            try {
                java.time.Duration d = java.time.Duration.parse(timeExpression);
                seconds = d.get(java.time.temporal.ChronoUnit.SECONDS);
            } catch (Exception ex) {
                return null;
            }
        }
        return seconds;
    }

    public static Date truncMonth(Date date) {
        return string2DateByPattern(getFirstDateOfMonth(date), "dd/MM/yyyy");
    }

    /**
     * add second
     *
     * @param nowDate Date
     * @param period  integer
     * @return Date
     */
    public static Date addSecond(Date nowDate, int period) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        calendar.add(Calendar.SECOND, period);

        return calendar.getTime();
    }

    public static Date addYear(Date nowDate, int year) {
        Calendar calendar = Calendar.getInstance();
        calendar.setTime(nowDate);
        calendar.add(Calendar.YEAR, year);

        return calendar.getTime();
    }

    /**
     * ham nay cat phan gio, phut, giat va tra ve doi tuong Date voi phu giay: 00:00:00
     * */
    public static Date truncDay(Date date) {
        LocalDate localDate = date.toInstant().atZone(ZoneId.systemDefault()).toLocalDate();
        return Date.from(localDate.atStartOfDay(ZoneId.systemDefault()).toInstant());
    }
}
