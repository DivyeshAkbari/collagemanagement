package com.collagemanagement.bean;

import java.io.InputStream;

public class QuoraSession {
	
	private int queryId;
	private String topicname;
	private String ctype;
	private String tdescription;
	private int userid;
	private String username;
	private String userProfilepic;
	private InputStream userProfilepicStream;
	private int is_active;
	private int tagid;
	private String tagname;
	

	@Override
	public String toString() {
		return "QuoraSession [queryId=" + queryId + ", topicname=" + topicname + ", ctype=" + ctype + ", tdescription="
				+ tdescription + ", userid=" + userid + ", username=" + username + ", userProfilepic=" + userProfilepic
				+ ", userProfilepicStream=" + userProfilepicStream + ", is_active=" + is_active + ", tagid=" + tagid
				+ "]";
	}
	public int getIs_active() {
		return is_active;
	}
	public void setIs_active(int is_active) {
		this.is_active = is_active;
	}

	public InputStream getUserProfilepicStream() {
		return userProfilepicStream;
	}
	public void setUserProfilepicStream(InputStream image) {
		this.userProfilepicStream = image;
	}
	public String getUserProfilepic() {
		return userProfilepic;
	}
	public void setUserProfilepic(String userProfilepic) {
		this.userProfilepic = userProfilepic;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public int getQueryId() {
		return queryId;
	}
	public void setQueryId(int queryId) {
		this.queryId = queryId;
	}
	
	public int getUserid() {
		return userid;
	}
	public void setUserid(int userid) {
		this.userid = userid;
	}
	public String getTopicname() {
		return topicname;
	}
	public void setTopicname(String topicname) {
		this.topicname = topicname;
	}
	public String getCtype() {
		return ctype;
	}
	public void setCtype(String ctype) {
		this.ctype = ctype;
	}
	public String getTdescription() {
		return tdescription;
	}
	public void setTdescription(String tdescription) {
		this.tdescription = tdescription;
	}
	public int getTagid() {
		return tagid;
	}
	public void setTagid(int tagid) {
		this.tagid = tagid;
	}
	public String getTagname() {
		return tagname;
	}
	public void setTagname(String tagname) {
		this.tagname = tagname;
	}

}
