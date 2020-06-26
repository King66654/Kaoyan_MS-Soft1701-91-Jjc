package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name = "manage_college",schema = "king")
public class Manage_college {
    private String college;
    private String place;
    private String level;
    private String academy;
    @Id
    public String getCollege() {
        return college;
    }
    public void setCollege(String college) {
        this.college = college;
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
}
