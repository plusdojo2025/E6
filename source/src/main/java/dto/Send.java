package dto;

import java.io.Serializable;

public class Send implements Serializable {
	private int regist_number; // 登録番号
	private int hold_coin; //所持コイン
	private int receive_coin; //
	private int ranking_coin; //氏名

	public Send(int regist_number,int hold_coin,int receive_coin,int ranking_coin){
		this.regist_number= regist_number;
		this.hold_coin=hold_coin;
		this.receive_coin=receive_coin;
		this.ranking_coin=ranking_coin;
	}
	
	public Send() {
		this.regist_number = 0;
		this.hold_coin=0;
		this.receive_coin=0;
		this.ranking_coin=0;
	}

	public int getRegist_number() {
		return regist_number;
	}

	public void setRegist_number(int regist_number) {
		this.regist_number = regist_number;
	}

	public int getHold_coin() {
		return hold_coin;
	}

	public void setHold_coin(int hold_coin) {
		this.hold_coin = hold_coin;
	}

	public int getReceive_coin() {
		return receive_coin;
	}

	public void setReceive_coin(int receive_coin) {
		this.receive_coin = receive_coin;
	}

	public int getRanking_coin() {
		return ranking_coin;
	}

	public void setRanking_coin(int ranking_coin) {
		this.ranking_coin = ranking_coin;
	}
	
	

}
