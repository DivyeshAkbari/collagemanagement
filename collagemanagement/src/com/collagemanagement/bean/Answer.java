package com.collagemanagement.bean;

public class Answer {
	
	private int answerid;
	private int userid;
	private int queryId;
	private String answerdescription;
	private String Questiondescription;
	public int getAnswerid() {
		return answerid;
	}
	public void setAnswerid(int answerid) {
		this.answerid = answerid;
	}
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public int getQueryId() {
		return queryId;
	}
	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}
	public String getAnswerdescription() {
		return answerdescription;
	}
	public void setAnswerdescription(String answerdescription) {
		this.answerdescription = answerdescription;
	}
	public String getQuestiondescription() {
		return Questiondescription;
	}
	public void setQuestiondescription(String questiondescription) {
		Questiondescription = questiondescription;
	}

}
