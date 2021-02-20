package com.collagemanagement.bean;

public class Semester1 {
	private int semId;
	private int semValue;
	
	
	@Override
	public String toString() {
		return "Semester1 [semId=" + semId + ", semValue=" + semValue + "]";
	}
	public int getSemId() {
		return semId;
	}
	public void setSemId(int semId) {
		this.semId = semId;
	}
	public int getSemValue() {
		return semValue;
	}
	public void setSemValue(int semValue) {
		this.semValue = semValue;
	}
	
}
