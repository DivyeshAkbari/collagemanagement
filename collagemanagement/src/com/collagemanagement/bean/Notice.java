package com.collagemanagement.bean;

public class Notice {
	
	private int noticeId;
	private String noticetitle;
	private String noticedetails;
	private String noticedate;
	
	
	public int getNoticeId() {
		return noticeId;
	}

	public void setNoticeId(int noticeId) {
		this.noticeId = noticeId;
	}

	public String getNoticedate() {
		return noticedate;
	}

	public void setNoticedate(String noticedate) {
		this.noticedate = noticedate;
	}
	
	public String getNoticetitle() {
		return noticetitle;
	}

	public void setNoticetitle(String noticetitle) {
		this.noticetitle = noticetitle;
	}

	public String getNoticedetails() {
		return noticedetails;
	}

	public void setNoticedetails(String noticedetails) {
		this.noticedetails = noticedetails;
	}

	@Override
	public String toString() {
		return String.format("Notice [noticeId=%s, noticetitle=%s, noticedetails=%s, noticedate=%s]", noticeId,
				noticetitle, noticedetails, noticedate);
	}
	
}
