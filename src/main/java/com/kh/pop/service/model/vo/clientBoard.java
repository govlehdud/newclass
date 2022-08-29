package com.kh.pop.service.model.vo;

public class clientBoard {
	private int cId;
	private int code;

	private String companyName; // 상호명
	private String traderNum;	// 사업자 등록번호
	private String onerName;	// 대표자 이름
	private String category;	// 업종
	private String state;		// 업태
	private String address1;	// 사업장 주소1
	private String address2;	// 사업장 주소2
	private String tel;			// 전화번호 통합
	private String tel1;		// 전화번호1
	private String tel2;		// 전화번호2
	private String tel3;		// 전화번호3
	private String pax;			// 팩스 통합
	private String pax1;		// 팩스1
	private String pax2;		// 팩스2
	private String pax3;		// 팩스3
	private String manager;		// 담당자
	private String phone;		// 핸드폰 통합 번호
	private String phone1;		// 핸드폰1
	private String phone2;		// 핸드폰2 
	private String phone3;		// 핸드폰3

	public String getTel() {
		if (tel1 == "" || tel2 == "" || tel3 == "") {
			tel = "";
		} else {
			tel = tel1 + tel2 + tel3;
		}
		return tel;
	}

	public String getPax() {
		if (pax1 == "" || pax2 == "" || pax3 == "") {
			pax = "";
		} else {
			pax = pax1 + pax2 + pax3;
		}
		return pax;
	}

	public String getPhone() {
		if (phone1 == "" && phone2 == "" && phone3 == "") {
			phone = "";
		} else {
			phone = phone1 + phone2 + phone3;
//			phone = phone1+"-"+phone2+"-"+phone3;
		}
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getPhone1() {
		return phone1;
	}

	public void setPhone1(String phone1) {
		this.phone1 = phone1;
	}

	public String getPhone2() {
		return phone2;
	}

	public void setPhone2(String phone2) {
		this.phone2 = phone2;
	}

	public String getPhone3() {
		return phone3;
	}

	public void setPhone3(String phone3) {
		this.phone3 = phone3;
	}

	public int getcId() {
		return cId;
	}

	public void setcId(int cId) {
		this.cId = cId;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getTraderNum() {
		return traderNum;
	}

	public void setTraderNum(String traderNum) {
		this.traderNum = traderNum;
	}

	public String getOnerName() {
		return onerName;
	}

	public void setOnerName(String onerName) {
		this.onerName = onerName;
	}

	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getState() {
		return state;
	}

	public void setState(String state) {
		this.state = state;
	}

	public String getAddress1() {
		return address1;
	}

	public void setAddress1(String address1) {
		this.address1 = address1;
	}

	public String getAddress2() {
		return address2;
	}

	public void setAddress2(String address2) {
		this.address2 = address2;
	}

	public String getTel1() {
		return tel1;
	}

	public void setTel1(String tel1) {
		this.tel1 = tel1;
	}

	public String getTel2() {
		return tel2;
	}

	public void setTel2(String tel2) {
		this.tel2 = tel2;
	}

	public String getTel3() {
		return tel3;
	}

	public void setTel3(String tel3) {
		this.tel3 = tel3;
	}

	public String getPax1() {
		return pax1;
	}

	public void setPax1(String pax1) {
		this.pax1 = pax1;
	}

	public String getPax2() {
		return pax2;
	}

	public void setPax2(String pax2) {
		this.pax2 = pax2;
	}

	public String getPax3() {
		return pax3;
	}

	public void setPax3(String pax3) {
		this.pax3 = pax3;
	}

	public String getManager() {
		return manager;
	}

	public void setManager(String manager) {
		this.manager = manager;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public void setPax(String pax) {
		this.pax = pax;
	}

	@Override
	public String toString() {
		return "clientBoard [cId=" + cId + ", code=" + code + ", companyName=" + companyName + ", traderNum="
				+ traderNum + ", onerName=" + onerName + ", category=" + category + ", state=" + state + ", address1="
				+ address1 + ", address2=" + address2 + ", tel=" + tel + ", tel1=" + tel1 + ", tel2=" + tel2 + ", tel3="
				+ tel3 + ", pax=" + pax + ", pax1=" + pax1 + ", pax2=" + pax2 + ", pax3=" + pax3 + ", manager="
				+ manager + ", phone=" + phone + ", phone1=" + phone1 + ", phone2=" + phone2 + ", phone3=" + phone3
				+ "]";
	}

}
