package action;
import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import com.opensymphony.xwork2.ActionSupport;
import model.College;
import model.User;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import util.HbnUtils;
import model.Manage_college;
import java.sql.Connection;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class CollegeAction extends ActionSupport implements SessionAware {
    private College college;
    public College getCollege() {
        return college;
    }
    public void setCollege(College college) {
        this.college = college;
    }
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    private String[] collegeSelectName = new String[]{};
    public String[] getCollegeSelectName() {
        return collegeSelectName;
    }
    public void setCollegeSelectName(String[] collegeSelectName) {
        this.collegeSelectName = collegeSelectName;
    }
    public Session session_h;
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    public void update_info() throws Exception{
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String sql="select * from college where login_name='"+session.get("login_name")+"'";
        List<College> collegeList=session_h.createSQLQuery(sql).addEntity(College.class).list();
        session_h.getTransaction().commit();
        session.put("college_info",collegeList);
    }
    public String delete(){
        String name=college.getCollege_name();
        try {
            session_h = HbnUtils.getSession();
            session_h.beginTransaction();
            IAccountservice as = (IAccountservice)ac.getBean("accountService3");
            College college_temp=(College) as.saveAccount();
            college_temp.setLogin_name((String)session.get("login_name"));
            college_temp.setCollege_name(name);
            session_h.delete(college_temp);
            session_h.getTransaction().commit();
            update_info();
            return "del_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "del_failure";
        }
    }
    public boolean search_school(String name) throws Exception{
        List<Manage_college> collegeList=(ArrayList<Manage_college>)session.get("manage_college_info");
        for (Manage_college temp:collegeList){
            if (temp.getCollege().equals(name)){
                return true;
            }
        }
        return false;
    }
    public String add(){
        try {
            boolean six=search_school(college.getCollege_name());
            if(six){
                session_h= HbnUtils.getSession();
                session_h.beginTransaction();
                IAccountservice as = (IAccountservice)ac.getBean("accountService3");
                College college_temp=(College) as.saveAccount();
                college_temp.setLogin_name((String)session.get("login_name"));
                college_temp.setCollege_name(this.college.getCollege_name());
                college_temp.setPlace(this.college.getPlace());
                college_temp.setLevel(this.college.getLevel());
                college_temp.setAcademy(this.college.getAcademy());
                college_temp.setMin_score(this.college.getMin_score());
                college_temp.setMax_score(this.college.getMax_score());
                session_h.save(college_temp);
                session_h.getTransaction().commit();
                update_info();
                return "add_success";
            }else {
                return "add_exists";
            }
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "add_failure";
        }
    }
    public String mohu_query() throws Exception{
        String place=college.getPlace();
        String level=college.getLevel();
        String sql="";
        if (place.equals("") && !level.equals("")){
            sql="select * from college where login_name='"+session.get("login_name")+"' and level='"+level+"'";
        }else if (!place.equals("") && level.equals("")){
            sql="select * from college where login_name='"+session.get("login_name")+"' and place='"+place+"'";
        }else if (place.equals("") && level.equals("")){
            sql="select * from college where login_name='"+session.get("login_name")+"'";
        }else{
            sql="select * from college where login_name='"+session.get("login_name")+"' and place='"+place+"' and level='"+level+"'";
        }
        try {
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            List<College> collegeList=session_h.createSQLQuery(sql).addEntity(College.class).list();
            session_h.getTransaction().commit();
            session.put("college_info",collegeList);
            return "mohu_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "mohu_failure";
        }
    }
    public String select_delete() throws Exception{
        String[] test=getCollegeSelectName();
        Connection con = DAOUtils.getConnection();
        Statement stmt=con.createStatement();
        String[] sql=new String[test.length];
        for (int i=0;i<sql.length;i++){
            sql[i]="delete from college where login_name='"+session.get("login_name")+"' and college='"+test[i]+"';";
            stmt.executeUpdate(sql[i]);
        }
        update_info();
        stmt.close();
        return "select_success";
    }
}
