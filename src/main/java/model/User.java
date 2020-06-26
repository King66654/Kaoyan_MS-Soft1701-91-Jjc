package model;

import java.util.Date;

public class User {
    private String login_name;
    private String password;
    private String name;
    private String sex;
    private String race;
    private Date birth;
    private String mail;
    private String mail_after;
    private String tel;
    private String address_p;
    private String address_c;
    private String address_d;
    private String address_detail;
    public String getLogin_name() {
        return login_name;
    }
    public void setLogin_name(String login_name) {
        this.login_name = login_name;
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
    public String getSex() {
        return sex;
    }
    public void setSex(String sex) {
        this.sex = sex;
    }
    public String getRace() {
        return race;
    }
    public void setRace(String race) {
        this.race = race;
    }
    public Date getBirth() {
        return birth;
    }
    public void setBirth(Date birth) {
        this.birth = birth;
    }
    public String getMail() {
        return mail;
    }
    public void setMail(String mail) {
        this.mail = mail;
    }
    public String getMail_after() {
        return mail_after;
    }
    public void setMail_after(String mail_after) {
        this.mail_after = mail_after;
    }
    public String getTel() {
        return tel;
    }
    public void setTel(String tel) {
        this.tel = tel;
    }
    public String getAddress_p() {
        return address_p;
    }
    public void setAddress_p(String address_p) {
        this.address_p = address_p;
    }
    public String getAddress_c() {
        return address_c;
    }
    public void setAddress_c(String address_c) {
        this.address_c = address_c;
    }
    public String getAddress_d() {
        return address_d;
    }
    public void setAddress_d(String address_d) {
        this.address_d = address_d;
    }
    public String getAddress_detail() {
        return address_detail;
    }
    public void setAddress_detail(String address_detail) {
        this.address_detail = address_detail;
    }
}