package com.mycompany.project.model;

public class Employee {
	
	String eno; // 직원번호 //20170303-1234567 이런식으로
	String ename; // 직원 이름
	String eage; // 직원 나이
	String esex; // 직원 성별 //f or m
	String etel; // 직원 전화번호
	String eposition; // 직원 담당업무
	String efaceid; // 직원 얼굴인식 아이디
	
	public String getEno() {
		return eno;
	}
	public void setEno(String eno) {
		this.eno = eno;
	}
	public String getEname() {
		return ename;
	}
	public void setEname(String ename) {
		this.ename = ename;
	}
	public String getEage() {
		return eage;
	}
	public void setEage(String eage) {
		this.eage = eage;
	}
	public String getEsex() {
		return esex;
	}
	public void setEsex(String esex) {
		this.esex = esex;
	}
	public String getEtel() {
		return etel;
	}
	public void setEtel(String etel) {
		this.etel = etel;
	}
	public String getEposition() {
		return eposition;
	}
	public void setEposition(String eposition) {
		this.eposition = eposition;
	}
	public String getEfaceid() {
		return efaceid;
	}
	public void setEfaceid(String efaceid) {
		this.efaceid = efaceid;
	}
}
