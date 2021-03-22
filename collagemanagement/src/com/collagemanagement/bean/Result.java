package com.collagemanagement.bean;

public class Result
{
	public int getResultId()
	{
		return resultId;
	}
	public void setResultId(int resultId)
	{
		this.resultId = resultId;
	}
	public int getStudentId()
	{
		return studentId;
	}
	public void setStudentId(int studentId)
	{
		this.studentId = studentId;
	}
	public int getYear() 
	{
		return year;
	}
	public void setYear(int year) {
		this.year = year;
	}
	public String getStatus() {
		return status;
	}
	public void setStatus(String status) {
		this.status = status;
	}
	public int getSemId() {
		return semId;
	}
	public void setSemId(int semId)
	{
		this.semId = semId;
	}
	public String getResultDate()
	{
		return resultDate;
	}
	public void setResultDate(String resultDate) 
	{
		this.resultDate = resultDate;
	}
	
	private int resultId;
	private int studentId;
	private int year;
	private String status;
	private int semId;
	private String resultDate;
	
}
