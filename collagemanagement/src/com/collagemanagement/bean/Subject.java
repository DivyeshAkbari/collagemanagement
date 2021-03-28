package com.collagemanagement.bean;

public class Subject 
{
	private boolean isSelected;
	
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

	private int subjectId;
	private String subjectName;
}
