package com.collagemanagement.bean;

public class Notice {
	
	private String noticetitle;
	private String noticedetails;
	
	@Override
	public String toString() {
		return String.format("Notice [noticetitle=%s, noticedetails=%s]", noticetitle, noticedetails);
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
	
	

}
