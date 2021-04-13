package com.collagemanagement.bean;

import java.io.InputStream;

public class Event {

	private String eventname;
	private String eventDescription;
	private String userProfilepic;
	private InputStream userProfilepicStream;
	
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
}
