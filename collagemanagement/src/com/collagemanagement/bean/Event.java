package com.collagemanagement.bean;

import java.io.InputStream;

public class Event {

	private String eventname;
	private String eventDescription;
	private String userProfilepic;
	private InputStream userProfilepicStream;
	private int eventid;
	private String date;
	private int isactive;
	private int d1;
	private String month;
	private int year;
	@Override
	public String toString() {
		return String.format("Event [eventname=%s, eventDescription=%s, userProfilepic=%s, userProfilepicStream=%s]",
				eventname, eventDescription, userProfilepic, userProfilepicStream);
	}
	
	public String getEventname() {
		return eventname;
	}
	public void setEventname(String eventname) {
		this.eventname = eventname;
	}
	public String getEventDescription() {
		return eventDescription;
	}
	public void setEventDescription(String eventDescription) {
		this.eventDescription = eventDescription;
	}
	public String getUserProfilepic() {
		return userProfilepic;
	}
	public void setUserProfilepic(String userProfilepic) {
		this.userProfilepic = userProfilepic;
	}
	public InputStream getUserProfilepicStream() {
		return userProfilepicStream;
	}
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		this.userProfilepicStream = userProfilepicStream;
	}

	public int getEventid() {
		return eventid;
	}

	public void setEventid(int eventid) {
		this.eventid = eventid;
	}

	public String getDate() {
		return date;
	}

	public void setDate(String date) {
		this.date = date;
	}

	public int getIsactive() {
		return isactive;
	}

	public void setIsactive(int isactive) {
		this.isactive = isactive;
	}

	public int getD1() {
		return d1;
	}

	public void setD1(int d1) {
		this.d1 = d1;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public int getYear() {
		return year;
	}

	public void setYear(int year) {
		this.year = year;
	}
}
