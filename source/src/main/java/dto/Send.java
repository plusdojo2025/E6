package dto;

import java.io.Serializable;

public class Send implements Serializable {
	private int id;
	private int regist_number; 
	private String send_date;
	private String comment;
	private int send_coin;
	private int receiver_number;
	
	public Send(int id,int regist_number,String send_date,String comment,int send_coin,int receiver_coin) {
		this.id=id; //ID
		this.regist_number= regist_number; //登録番号
		this.send_date=send_date; //送信日時
		this.comment=comment; //コメント
		this.send_coin=send_coin; //送信コイン
		this.receiver_number=receiver_number; //受信者番号
	}
	
	public Send() {
		this.id=0;
		this.regist_number=0;
		this.send_date="";
		this.comment="";
		this.send_coin=0;
		this.receiver_number=0;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getRegist_number() {
		return regist_number;
	}

	public void setRegist_number(int regist_number) {
		this.regist_number = regist_number;
	}

	public String getSend_date() {
		return send_date;
	}

	public void setSend_date(String send_date) {
		this.send_date = send_date;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}

	public int getSend_coin() {
		return send_coin;
	}

	public void setSend_coin(int send_coin) {
		this.send_coin = send_coin;
	}

	public int getReceiver_number() {
		return receiver_number;
	}

	public void setReceiver_number(int receiver_number) {
		this.receiver_number = receiver_number;
	}
	
	
}
