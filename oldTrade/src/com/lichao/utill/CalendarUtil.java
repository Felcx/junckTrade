package com.lichao.utill;

import java.sql.Timestamp;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;

public class CalendarUtil {
	
	private static SimpleDateFormat mFormate=new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
	private static SimpleDateFormat mFormate2=new SimpleDateFormat("yyyy-MM-dd");
	
	public static String noon=" 08:00:00";
	public static String afterNoon=" 14:00:00";
	
	/**
	 * 获取n天后的日期字符串
	 * @param sign
	 * @return
	 */
	public static String getOtherDay(int sign){
		Calendar calendar=Calendar.getInstance();
	    calendar.add(Calendar.DAY_OF_MONTH, sign);
	    return mFormate2.format(calendar.getTime());
	}
	
	public static String getDate(Timestamp time){
		return mFormate.format(new Date(time.getTime()));
	}
     	
	/**
	 * 获取n天后的日期字符串，包括时分秒
	 * @param sign
	 * @return
	 */
	public static String getOtherDate(int sign){
		Calendar calendar=Calendar.getInstance();
	    calendar.add(Calendar.DAY_OF_MONTH, sign);
	    return mFormate.format(calendar.getTime());
	}
	/**
	 * 根据年月日获取日期字符串
	 * @param year
	 * @param month
	 * @param day
	 * @return
	 */
	public static String getDateString(int year,int month,int day){
		Calendar calendar=Calendar.getInstance();
		calendar.set(year, month, day);
		 return mFormate2.format(calendar.getTime());
	}
	/**
	 * 根据2个日期字符串比较日期大小
	 * @param dateStart
	 * @param dateEnd
	 * @return
	 */
	public static boolean compareDate(String dateStart,String dateEnd){
		Date tDateStart=new Date(),tDateEnd=new Date();
		try {
			 tDateStart= mFormate2.parse(dateStart);
			 tDateEnd= mFormate2.parse(dateEnd);
			
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return !tDateStart.after(tDateEnd);
	}
	/**
	 * 根据日期字符串获取calendar对象
	 * @param date
	 * @return
	 */
	public static Calendar getCalendar(String date){
		Calendar calendar=Calendar.getInstance();
		try {
			calendar.setTime(mFormate2.parse(date));
		} catch (ParseException e) {
			e.printStackTrace();
		}
		return calendar;
	}
}
