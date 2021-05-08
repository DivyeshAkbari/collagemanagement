package com.collagemanagement.bean;

public class Subject 
{
	private boolean isSelected;
	private int subjecttype;
	private String stream;
	private String sem;
	private String subjectcredit;
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	@Override
	public String toString() {
		return "Subject [isSelected=" + isSelected + ", subjectId=" + subjectId + ", subjectName=" + subjectName + "]";
	}
	public String getSubjectName() 
	{
		return subjectName;
	}
	public void setSubjectName(String subjectName) 
	{
		this.subjectName = subjectName;
	}	
	
	public boolean isSelected() {
		return isSelected;
	}
	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}

	public int getSubjecttype() {
		return subjecttype;
	}
	public void setSubjecttype(int subjecttype) {
		this.subjecttype = subjecttype;
	}

	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}

	public String getSem() {
		return sem;
	}
	public void setSem(String sem) {
		this.sem = sem;
	}

	public String getSubjectcredit() {
		return subjectcredit;
	}
	public void setSubjectcredit(String subjectcredit) {
		this.subjectcredit = subjectcredit;
	}

	private int subjectId;
	private String subjectName;
}
