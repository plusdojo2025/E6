package dto;

import java.io.Serializable;

public class User implements Serializable {
	private Integer regist_number; // 登録番号
	private String mail; //メールアドレス
	private String password; //パスワード
	private String name; //氏名
	private String company; //会社名
	private int receive_coin;
	private int ranking_coin;

	public User(String mail, String password) {
        this.mail = mail;
        this.password = password;
    }

    public User(String mail) {
        this.mail = mail;
    }

    public User() {}
    
    public User(Integer regist_number, String company, String name, String mail, String password) {
        this.regist_number = regist_number;
        this.company = company;
        this.name = name;
        this.mail = mail;
        this.password = password;
    }
    
    public User(String mail, String password, String name, String company) {
        this.mail = mail;
        this.password = password;
        this.name = name;
        this.company = company;
    }

	public Integer getRegist_number() {
		return regist_number;
	}

	public void setRegist_number(Integer regist_number) {
		this.regist_number = regist_number;
	}

	public String getMail() {
		return mail;
	}

	public void setMail(String mail) {
		this.mail = mail;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getCompany() {
		return company;
	}

	public void setCompany(String company) {
		this.company = company;
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
