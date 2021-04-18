package com.collagemanagement.bean;

import java.io.InputStream;
import java.sql.Blob;

public class Image {

	private InputStream userProfilepicStream;
	private String userProfilepicString;
	private byte[] imagedata;
	private Blob image;
	public InputStream getUserProfilepicStream() {
		return userProfilepicStream;
	}
	@Override
	public String toString() {
		return "Image [userProfilepicStream=" + userProfilepicStream + ", userProfilepicString=" + userProfilepicString
				+ ", imagedata=" + imagedata + ", image=" + image + "]";
	}
	public void setUserProfilepicStream(InputStream userProfilepicStream) {
		this.userProfilepicStream = userProfilepicStream;
	}
	public String getUserProfilepicString() {
		return userProfilepicString;
	}
	public void setUserProfilepicString(String userProfilepicString) {
		this.userProfilepicString = userProfilepicString;
	}
	public byte[] getImagedata() {
		return imagedata;
	}
	public void setImagedata(byte[] imagedata) {
		this.imagedata = imagedata;
	}
	public Blob getImage() {
		return image;
	}
	public void setImage(Blob image) {
		this.image = image;
	}
}
