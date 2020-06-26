package model;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "college",schema = "king")
public class College implements Serializable {
    private static final long serialVersionUID = 1L;
    private String login_name;
    private String college_name;
    private String place;
    private String level;
    private String academy;
    public int min_score;
    public int max_score;
    @Id
    public String getLogin_name() {
        return login_name;
    }
    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }

    @Column(name = "college")
    @Id
    public String getCollege_name() {
        return college_name;
    }
    public void setCollege_name(String college_name) {
        this.college_name = college_name;
    }
    public String getPlace() {
        return place;
    }
    public void setPlace(String place) {
        this.place = place;
    }
    public String getLevel() {
        return level;
    }
    public void setLevel(String level) {
        this.level = level;
    }
    public String getAcademy() {
        return academy;
    }
    public void setAcademy(String academy) {
        this.academy = academy;
    }
    public int getMin_score() {
        return min_score;
    }
    public void setMin_score(int min_score) {
        this.min_score = min_score;
    }
    public int getMax_score() {
        return max_score;
    }
    public void setMax_score(int max_score) {
        this.max_score = max_score;
    }
}
