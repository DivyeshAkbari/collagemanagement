package com.collagemanagement.bean;

import java.io.InputStream;
import java.sql.Blob;
import java.util.List;

public class User 
{
	private String firstname;
	private String middlename;
	private String lastname;
	private String stream;
	private int semester;
	private String division;
	private String xender;
	private String email;
	private String password;
	private InputStream userProfilepicStream;
	private String userProfilepicString;
	private String confirm_password;
	private String qualification;
	private String myHash;
	private int id;
	private String URL;
	private List<Stream> streamList;
	private List<Semester> semesterList;
	private List<Subject> subjectList;
	private byte[] imagedata;
	private String contactno;
	private String address;
	private Blob image;
	private String role;
		
	public byte[] getImagedata() {
		return imagedata;
	}
	public void setImagedata(byte[] imagedata) {
		this.imagedata = imagedata;
	}
	public List<Stream> getStreamList() {
		return streamList;
	}
	public void setStreamList(List<Stream> streamList) {
		this.streamList = streamList;
	}
	public List<Semester> getSemesterList() {
		return semesterList;
	}
	public void setSemesterList(List<Semester> semesterList) {
		this.semesterList = semesterList;
	}
	public List<Subject> getSubjectList() {
		return subjectList;
	}
	public void setSubjectList(List<Subject> subjectList) {
		this.subjectList = subjectList;
	}
	public String getUserProfilepicString() {
		return userProfilepicString;
	}
	public void setUserProfilepicString(String userProfilepicString) {
		this.userProfilepicString = userProfilepicString;
	}
	
	
	@Override
	public String toString() {
		return "User [firstname=" + firstname + ", middlename=" + middlename + ", lastname=" + lastname + ", stream="
				+ stream + ", semester=" + semester + ", division=" + division + ", xender=" + xender + ", email="
				+ email + ", password=" + password + ", userProfilepicStream=" + userProfilepicStream
				+ ", userProfilepicString=" + userProfilepicString + ", confirm_password=" + confirm_password
				+ ", qualification=" + qualification + ", myHash=" + myHash + ", id=" + id + ", URL=" + URL
				+ ", streamList=" + streamList + ", semesterList=" + semesterList + ", subjectList=" + subjectList
				+ ", contactno=" + contactno + ", address=" + address + ", image=" + image + ", role=" + role + "]";
	}

	public String getRole() {
		return role;
	}
	public void setRole(String role) {
		this.role = role;
	}
	public String getFirstname() {
		return firstname;
	}
	public void setFirstname(String firstname) {
		this.firstname = firstname;
	}
	public String getMiddlename() {
		return middlename;
	}
	public void setMiddlename(String middlename) {
		this.middlename = middlename;
	}
	public String getLastname() {
		return lastname;
	}
	public void setLastname(String lastname) {
		this.lastname = lastname;
	}
	public String getStream() {
		return stream;
	}
	public void setStream(String stream) {
		this.stream = stream;
	}
	public int getSemester() {
		return semester;
	}
	public void setSemester(int semester) {
		this.semester = semester;
	}
	public String getDivision() {
		return division;
	}
	public void setDivision(String division) {
		this.division = division;
	}
	public String getXender() {
		return xender;
	}
	public void setXender(String xender) {
		this.xender = xender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getContactno() {
		return contactno;
	}
	public void setContactno(String contactno) {
		this.contactno = contactno;
	}
	public String getAddress() {
		return address;
	}
	public void setAddress(String address) {
		this.address = address;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
	public InputStream getUserProfilepicStream() {
		return userProfilepicStream;
	}
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		this.userProfilepicStream = userProfilepicStream;
	}
	public String getConfirm_password() {
		return confirm_password;
	}
	public void setConfirm_password(String confirm_password) {
		this.confirm_password = confirm_password;
	}
	public String getQualification() {
		return qualification;
	}
	public void setQualification(String qualification) {
		this.qualification = qualification;
	}
	public String getMyHash() {
		return myHash;
	}
	public void setMyHash(String myHash) {
		this.myHash = myHash;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getURL() {
		return URL;
	}
	public void setURL(String uRL) {
		URL = uRL;
	}
}