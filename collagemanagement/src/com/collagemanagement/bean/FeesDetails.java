package com.collagemanagement.bean;

public class FeesDetails {
	
	int paymentstatus;
	int user_id;
	
	String paymentdate;
	String Orderid;
	String remark;
	String contactno;
	String email;
	
	private String  amount;
	private String username;
	private String stream;
	
	private int student_feesdetail_id;
	private int semester;
	
	
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getUsername() {
		return username;
	}
	public void setUsername(String username) {
		this.username = username;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public int getPaymentstatus() {
		return paymentstatus;
	}
	public void setPaymentstatus(int paymentstatus) {
		this.paymentstatus = paymentstatus;
	}
	public int getUser_id() {
		return user_id;
	}
	public void setUser_id(int user_id) {
		this.user_id = user_id;
	}
	public String getPaymentdate() {
		return paymentdate;
	}
	public void setPaymentdate(String paymentdate) {
		this.paymentdate = paymentdate;
	}
	public String getOrderid() {
		return Orderid;
	}
	public void setOrderid(String orderid) {
		Orderid = orderid;
	}
	public String getRemark() {
		return remark;
	}
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public String getAmount() {
		return amount;
	}
	public void setAmount(String amount) {
		this.amount = amount;
	}
	public int getStudent_feesdetail_id() {
		return student_feesdetail_id;
	}
	public void setStudent_feesdetail_id(int student_feesdetail_id) {
		this.student_feesdetail_id = student_feesdetail_id;
	}
	@Override
	public String toString() {
		return String.format(
				"FeesDetails [paymentstatus=%s, user_id=%s, paymentdate=%s, Orderid=%s, remark=%s, contactno=%s, email=%s, amount=%s, username=%s, stream=%s, student_feesdetail_id=%s, semester=%s]",
				paymentstatus, user_id, paymentdate, Orderid, remark, contactno, email, amount, username, stream,
				student_feesdetail_id, semester);
	}	
}