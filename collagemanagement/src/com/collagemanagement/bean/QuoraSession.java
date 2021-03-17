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
	private String tag;
	
	@Override
	public String toString() {
		return String.format(
				"QuoraSession [queryId=%s, topicname=%s, ctype=%s, tdescription=%s, userid=%s, username=%s, userProfilepic=%s, userProfilepicStream=%s, is_active=%s, tag=%s]",
				queryId, topicname, ctype, tdescription, userid, username, userProfilepic, userProfilepicStream,
				is_active, tag);
	}
	public String getTag() {
		return tag;
	}
	public void setTag(String tag) {
		this.tag = tag;
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
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		this.userProfilepicStream = userProfilepicStream;
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

}
