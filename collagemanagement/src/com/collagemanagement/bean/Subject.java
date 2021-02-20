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
	@Override
	public String toString() 
	{
		return "Subject [subjectId=" + subjectId + ", subjectName=" + subjectName + "]";
	}
	public String getSubjectName() 
	{
		return subjectName;
	}
	public void setSubjectName(String subjectName) 
	{
		this.subjectName = subjectName;
	}	
	
	private int subjectId;
	private String subjectName;
}
