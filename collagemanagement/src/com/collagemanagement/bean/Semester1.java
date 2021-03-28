package com.collagemanagement.bean;

import java.util.List;

public class Semester1 {
	private int semId;
	private int semValue;
	private List<Subject> subjects;
	private boolean isSelected;
	
	
	@Override
	public String toString() {
		return "Semester1 [semId=" + semId + ", semValue=" + semValue + ", subjects=" + subjects + ", isSelected="
				+ isSelected + "]";
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
	public List<Subject> getSubjects() {
		return subjects;
	}
	public void setSubjects(List<Subject> subjects) {
		this.subjects = subjects;
	}
	public boolean isSelected() {
		return isSelected;
	}
	public void setSelected(boolean isSelected) {
		this.isSelected = isSelected;
	}
	
}
