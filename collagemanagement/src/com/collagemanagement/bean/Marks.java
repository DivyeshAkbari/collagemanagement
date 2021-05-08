package com.collagemanagement.bean;

public class Marks 
{
	@Override
	public String toString() {
		return "Marks [marksId=" + marksId + ", semId=" + semId + ", studentId=" + studentId + ", subjectId="
				+ subjectId + ", marksvalue=" + marksvalue + "]";
	}
	private int marksId;
	private String grade;
	
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
	public int getMarksId()
	{
		return marksId;
	}
	public void setMarksId(int marksId)
	{
		this.marksId = marksId;
	}
	public int getSemId()
	{
		return semId;
	}
	public void setSemId(int semId) {
		this.semId = semId;
	}
	public int getStudentId() {
		return studentId;
	}
	public void setStudentId(int studentId) {
		this.studentId = studentId;
	}
	public int getSubjectId() {
		return subjectId;
	}
	public void setSubjectId(int subjectId)
	{
		this.subjectId = subjectId;
	}
	public int getMarksvalue() 
	{
		return marksvalue;
	}
	public void setMarksvalue(int marksvalue)
	{
		this.marksvalue = marksvalue;
	}
	private int semId;
	private int studentId;
	private int subjectId;
	private int marksvalue;
}
