package com.collagemanagement.bean;

public class Stream
{
	private int streamid;
	private String streamname;
	
	@Override
	public String toString() {
		return "Stream [streamid=" + streamid + ", streamname=" + streamname + "]";
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
}
