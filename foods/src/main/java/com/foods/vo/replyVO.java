package com.foods.vo;

import java.sql.Date;

public class replyVO {
	int rNo;
	int customerNo;
	String replyText;
	String replyer;
	String memberName;
	Date regDate;
	Date updateDate;
	public int getrNo() {
		return rNo;
	}
	public void setrNo(int rNo) {
		this.rNo = rNo;
	}
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public String getReplyText() {
		return replyText;
	}
	public void setReplyText(String replyText) {
		this.replyText = replyText;
	}
	public String getReplyer() {
		return replyer;
	}
	public void setReplyer(String replyer) {
		this.replyer = replyer;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public Date getRegDate() {
		return regDate;
	}
	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}
	public Date getUpdateDate() {
		return updateDate;
	}
	public void setUpdateDate(Date updateDate) {
		this.updateDate = updateDate;
	}
	@Override
	public String toString() {
		return "replyVO [rNo=" + rNo + ", customerNo=" + customerNo + ", replyText=" + replyText + ", replyer="
				+ replyer + ", memberName=" + memberName + ", regDate=" + regDate + ", updateDate=" + updateDate + "]";
	}
	
	
}
