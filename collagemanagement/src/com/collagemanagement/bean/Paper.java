package com.collagemanagement.bean;

import java.io.InputStream;

public class Paper
{
	private int Streamid;
	private String streamname;
	private int paperid;
	private String papertype;
	public int getStreamid() {
		return Streamid;
	}
	public void setStreamid(int streamid) {
		Streamid = streamid;
	}
	public int getSemesterid() {
		return Semesterid;
	}
	public void setSemesterid(int semesterid) {
		Semesterid = semesterid;
	}
	public int getSubjectid() {
		return Subjectid;
	}
	public void setSubjectid(int subjectid) {
		Subjectid = subjectid;
	}
	public int getYear() {
		return Year;
	}
	public void setYear(int year) {
		Year = year;
	}
	public InputStream getPDF() {
		return PDF;
	}
	public void setPDF(InputStream pDF) {
		PDF = pDF;
	}
	public String getPDFString() {
		return PDFString;
	}
	public void setPDFString(String pDFString) {
		PDFString = pDFString;
	}
	
	
	@Override
	public String toString() {
		return "Paper [Streamid=" + Streamid + ", streamname=" + streamname + ", Semesterid=" + Semesterid
				+ ", Subjectid=" + Subjectid + ", Year=" + Year + ", PDF=" + PDF + ", PDFString=" + PDFString
				+ ", Type=" + Type + "]";
	}
	public String getType() {
		return Type;
	}
	public void setType(String type) {
		Type = type;
	}
	public String getStreamname() {
		return streamname;
	}
	public void setStreamname(String streamname) {
		this.streamname = streamname;
	}
	public int getPaperid() {
		return paperid;
	}
	public void setPaperid(int paperid) {
		this.paperid = paperid;
	}
	public String getPapertype() {
		return papertype;
	}
	public void setPapertype(String papertype) {
		this.papertype = papertype;
	}
	private int Semesterid;
	private int Subjectid;
	private int Year;
	private InputStream PDF;
	private String PDFString;
	private String Type;
	 
}
