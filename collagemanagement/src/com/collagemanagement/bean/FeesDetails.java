package com.collagemanagement.bean;

public class FeesDetails {
	
	int paymentstatus;
	int user_id;
	
	String paymentdate;
	String Orderid;
	String remark;
	
	private String  amount;
	private int student_feesdetail_id;
	
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
	
}
