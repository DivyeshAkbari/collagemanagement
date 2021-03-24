package com.collagemanagement.bean;

public class Papertype
{
	private int papertypeid;
	public int getPapertypeid() {
		return papertypeid;
	}
	public void setPapertypeid(int papertypeid) {
		this.papertypeid = papertypeid;
	}
	public String getPaperType() {
		return paperType;
	}
	@Override
	public String toString() {
		return "Papertype [papertypeid=" + papertypeid + ", paperType=" + paperType + "]";
	}
	public void setPaperType(String paperType) {
		this.paperType = paperType;
	}
	private String paperType;
	
}
