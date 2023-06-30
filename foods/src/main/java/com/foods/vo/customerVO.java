package com.foods.vo;

import java.sql.Date;
import org.springframework.stereotype.Component;
 
@Component
public class customerVO {
	int customerNo;  //회원문의 번호
	String customerTitle; //제목
	String customerContent; //내용
	String customerWriter; //작성자 id
	Date customerRegdate; //작성일
	int customerCnt;  //조회수    --board 테이블
	String memberName; //작성자 --member 테이블(Join)
	int customerReply; //댓글         --reply 테이블(Join)
	public int getCustomerNo() {
		return customerNo;
	}
	public void setCustomerNo(int customerNo) {
		this.customerNo = customerNo;
	}
	public String getCustomerTitle() {
		return customerTitle;
	}
	public void setCustomerTitle(String customerTitle) {
		this.customerTitle = customerTitle;
	}
	public String getCustomerContent() {
		return customerContent;
	}
	public void setCustomerContent(String customerContent) {
		this.customerContent = customerContent;
	}
	public String getCustomerWriter() {
		return customerWriter;
	}
	public void setCustomerWriter(String customerWriter) {
		this.customerWriter = customerWriter;
	}
	public Date getCustomerRegdate() {
		return customerRegdate;
	}
	public void setCustomerRegdate(Date customerRegdate) {
		this.customerRegdate = customerRegdate;
	}
	public int getCustomerCnt() {
		return customerCnt;
	}
	public void setCustomerCnt(int customerCnt) {
		this.customerCnt = customerCnt;
	}
	public String getMemberName() {
		return memberName;
	}
	public void setMemberName(String memberName) {
		this.memberName = memberName;
	}
	public int getCustomerReply() {
		return customerReply;
	}
	public void setCustomerReply(int customerReply) {
		this.customerReply = customerReply;
	}
	@Override
	public String toString() {
		return "customerVO [customerNo=" + customerNo + ", customerTitle=" + customerTitle + ", customerContent="
				+ customerContent + ", customerWriter=" + customerWriter + ", customerRegdate=" + customerRegdate
				+ ", customerCnt=" + customerCnt + ", memberName=" + memberName + ", customerReply=" + customerReply
				+ "]";
	}


}
