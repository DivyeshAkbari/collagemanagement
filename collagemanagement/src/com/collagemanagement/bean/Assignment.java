package com.collagemanagement.bean;

import java.io.InputStream;

public class Assignment {

	private int assId;
	public int getAssId() {
		return assId;
	}
	public void setAssId(int assId) {
		this.assId = assId;
	}
	private int streamId;
	private int subjectId;
	private String date;
	private String discription;
	private String title;
	private InputStream assPDF;
	private String assPDFstring;
	private int usesrId;
	private String uploadDate;
	public String getUploadDate() {
		return uploadDate;
	}
	public void setUploadDate(String uploadDate) {
		this.uploadDate = uploadDate;
	}
	public int getUsesrId() {
		return usesrId;
	}
	public void setUsesrId(int usesrId) {
		this.usesrId = usesrId;
	}
	
	@Override
	public String toString() {
		return "Assignment [assId=" + assId + ", streamId=" + streamId + ", subjectId=" + subjectId + ", date=" + date
				+ ", discription=" + discription + ", title=" + title + ", assPDF=" + assPDF + ", assPDFstring="
				+ assPDFstring + ", usesrId=" + usesrId + ", uploadDate=" + uploadDate + "]";
	}
	public int getStreamId() {
		return streamId;
	}
	public void setStreamId(int streamId) {
		this.streamId = streamId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId) {
		this.subjectId = subjectId;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	public String getDiscription() {
		return discription;
	}
	public void setDiscription(String discription) {
		this.discription = discription;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public InputStream getAssPDF() {
		return assPDF;
	}
	public void setAssPDF(InputStream assPDF) {
		this.assPDF = assPDF;
	}
	public String getAssPDFstring() {
		return assPDFstring;
	}
	public void setAssPDFstring(String assPDFstring) {
		this.assPDFstring = assPDFstring;
	}
	
}
