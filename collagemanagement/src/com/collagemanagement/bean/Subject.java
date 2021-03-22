package com.collagemanagement.bean;

public class Subject 
{
	public int getSubjectId() 
	{
		return subjectId;
	}
	public void setSubjectId(int subjectId) 
	{
		this.subjectId = subjectId;
	}
	
	public String getSubjectName() 
	{
		return subjectName;
	}
	@Override
	public String toString() {
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + "]";
	}
	public void setSubjectName(String subjectName) 
	{
		this.subjectName = subjectName;
	}	
	private int subjectId;
	private String subjectName;
}
