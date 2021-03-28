package com.collagemanagement.bean;

import java.util.List;

public class Stream
{
	private int streamid;
	private String streamname;
	private List<Semester1> semesters;
	private boolean streamCheck;
	
	@Override
	public String toString() {
		return "Stream [streamid=" + streamid + ", streamname=" + streamname + ", semesters=" + semesters
				+ ", streamCheck=" + streamCheck + "]";
	}
	public int getStreamid() {
		return streamid;
	}
	public void setStreamid(int streamid) {
		this.streamid = streamid;
	}
	public String getStreamname() {
		return streamname;
	}
	public void setStreamname(String streamname) {
		this.streamname = streamname;
	}
	public List<Semester1> getSemesters() {
		return semesters;
	}
	public void setSemesters(List<Semester1> semesters) {
		this.semesters = semesters;
	}
	public boolean isStreamCheck() {
		return streamCheck;
	}
	public void setStreamCheck(boolean streamCheck) {
		this.streamCheck = streamCheck;
	}
	
}
