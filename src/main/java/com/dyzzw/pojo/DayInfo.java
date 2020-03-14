package com.dyzzw.pojo;

/**
 * 预约医生显示日期实体
 *
 */
public class DayInfo {

	private String date;//日期 (xx月xx日)
	private String week;//具体星期几  (星期x)
	private String fullDate;// 完整日期 (xxxx年xx月xx日)
	private int sw;
	private int xw;
	private int ws;
	private int swstate;
	private int xwstate;

	@Override
	public String toString() {
		return "DayInfo{" +
				"date='" + date + '\'' +
				", week='" + week + '\'' +
				", fullDate='" + fullDate + '\'' +
				", sw=" + sw +
				", xw=" + xw +
				", ws=" + ws +
				", swstate=" + swstate +
				", xwstate=" + xwstate +
				'}';
	}

	public DayInfo() {
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public String getWeek() {
		return week;
	}

	public void setWeek(String week) {
		this.week = week;
	}

	public String getFullDate() {
		return fullDate;
	}

	public void setFullDate(String fullDate) {
		this.fullDate = fullDate;
	}

	public int getSw() {
		return sw;
	}

	public void setSw(int sw) {
		this.sw = sw;
	}

	public int getXw() {
		return xw;
	}

	public void setXw(int xw) {
		this.xw = xw;
	}

	public int getWs() {
		return ws;
	}

	public void setWs(int ws) {
		this.ws = ws;
	}

	public int getSwstate() {
		return swstate;
	}

	public void setSwstate(int swstate) {
		this.swstate = swstate;
	}

	public int getXwstate() {
		return xwstate;
	}

	public void setXwstate(int xwstate) {
		this.xwstate = xwstate;
	}

	public DayInfo(String date, String week, String fullDate, int sw, int xw, int ws, int swstate, int xwstate) {
		this.date = date;
		this.week = week;
		this.fullDate = fullDate;
		this.sw = sw;
		this.xw = xw;
		this.ws = ws;
		this.swstate = swstate;
		this.xwstate = xwstate;
	}
}

