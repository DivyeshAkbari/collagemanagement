package com.collagemanagement.bean;

import java.io.InputStream;

public class Answer {
	
	private int answerid;
	private int userid;
	private int queryId;
	private String answerdescription;
	private String Questiondescription;
	private String username;
	private String userProfilepic;
	private InputStream userProfilepicStream;
	
	
	
	
	@Override
	public String toString() {
		return "Answer [answerid=" + answerid + ", userid=" + userid + ", queryId=" + queryId + ", answerdescription="
				+ answerdescription + ", Questiondescription=" + Questiondescription + ", username=" + username
				+ ", userProfilepic=" + userProfilepic + ", userProfilepicStream=" + userProfilepicStream + "]";
	}
	public String getUserProfilepic() {
		return userProfilepic;
	}
	public void setUserProfilepic(String userProfilepic) {
		this.userProfilepic = userProfilepic;
	}
	public InputStream getUserProfilepicStream() {
		return userProfilepicStream;
	}
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		this.userProfilepicStream = userProfilepicStream;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
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
