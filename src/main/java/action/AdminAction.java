package action;
import model.*;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import util.HbnUtils;
import java.util.List;
import java.util.Map;

public class AdminAction implements SessionAware {
    private Admin admin;
    public Admin getAdmin() {
        return admin;
    }
    public void setAdmin(Admin admin) {
        this.admin = admin;
    }
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public Session session_h;
    public void create_info_user() throws Exception{
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String sql = "select * from user";
        List<User_DB> user_dbList=session_h.createSQLQuery(sql).addEntity(User_DB.class).list();
        session_h.getTransaction().commit();
        session.put("user_info",user_dbList);
    }
    public void create_school_user() throws Exception{
        session_h= HbnUtils.getSession();
        session_h.beginTransaction();
        String sql = "select * from manage_college";
        List<Manage_college> manage_collegeList=session_h.createSQLQuery(sql).addEntity(Manage_college.class).list();
        session_h.getTransaction().commit();
        session.put("school_info",manage_collegeList);
    }
    public String execute(){
        if (admin.getName().equals("root")&&admin.getPassword().equals("password")){
            try{
                create_school_user();
                create_info_user();
                session.put("access_dba","pass");
                return "success";
            }catch (Exception e){
                return "failure";
            }
        }else{
            return "failure";
        }
    }
}