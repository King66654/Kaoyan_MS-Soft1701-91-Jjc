package model;

import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;
import java.io.Serializable;

@Entity
@Table(name = "date",schema = "king")
public class Date implements Serializable {
    private static final long serialVersionUID = 1L;
    private String login_name;
    private String date;
    private String thing;
    @Id
    public String getLogin_name() {
        return login_name;
    }
    public void setLogin_name(String login_name) {
        this.login_name = login_name;
    }
    @Id
    public String getDate() {
        return date;
    }
    public void setDate(String date) {
        this.date = date;
    }
    @Id
    public String getThing() {
        return thing;
    }
    public void setThing(String thing) {
        this.thing = thing;
    }
}
