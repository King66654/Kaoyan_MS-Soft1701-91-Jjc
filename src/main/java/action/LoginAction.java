package action;

import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import com.opensymphony.xwork2.ActionSupport;
import model.*;
import model.Date;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import util.HbnUtils;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.*;

public class LoginAction extends ActionSupport implements SessionAware {
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    private User user;
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public Session session_h;
    public void create_date_info(){
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String hql="from Date where login_name='"+session.get("login_name")+"'";
        List<Date> dates=session_h.createQuery(hql).list();
        session_h.getTransaction().commit();
        session.put("date_info",dates);
    }
    public void create_file_info() throws Exception{
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql="select * from file where login_name='"+user.getLogin_name()+"';";
        ResultSet rt = stmt.executeQuery(sql);
        List<File_test> info_list = new ArrayList<File_test>();
        while (rt.next()){
            IAccountservice as = (IAccountservice)ac.getBean("accountService7");
            File_test test=(File_test) as.saveAccount();
            test.setFilename(rt.getString("file_name"));
            test.setTitle(rt.getString("file_title"));
            test.setType(rt.getString("file_type"));
            test.setSize(rt.getString("file_size"));
            info_list.add(test);
        }
        session.put("file_info",info_list);
    }
    public void create_college_info(){
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String sql="select * from college where login_name='"+session.get("login_name")+"'";
        List<College> collegeList=session_h.createSQLQuery(sql).addEntity(College.class).list();
        String sql_school="select * from manage_college";
        List<Manage_college> manage_collegeList=session_h.createSQLQuery(sql_school).addEntity(Manage_college.class).list();
        session_h.getTransaction().commit();
        session.put("college_info",collegeList);
        session.put("manage_college_info",manage_collegeList);
    }
    public void create_friend_info() {
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String sql="select * from friend where login_name='"+user.getLogin_name()+"';";
        List<Friends> friendsList=session_h.createSQLQuery(sql).addEntity(Friends.class).list();
        session_h.getTransaction().commit();
        session.put("friend_info",friendsList);
    }
    public String execute(){
        int flag=0;
        try{
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            String sql="select * from user;";
            List<User_DB> user_dbs=session_h.createSQLQuery(sql).addEntity(User_DB.class).list();
            for (User_DB user_db:user_dbs){
                String login_name=user.getLogin_name();
                String password=user.getPassword();
                if(login_name.equals(user.getLogin_name())&&password.equals(user.getPassword())){
                    flag=1;
                    List<String> info_list=new ArrayList<String>();
                    info_list.add(login_name);
                    info_list.add(password);
                    info_list.add(user_db.getName());
                    info_list.add(user_db.getSex());
                    info_list.add(user_db.getRace());
                    info_list.add(user_db.getBirth());
                    info_list.add(user_db.getMail());
                    info_list.add(user_db.getAddress_p());
                    info_list.add(user_db.getAddress_c());
                    info_list.add(user_db.getAddress_d());
                    info_list.add(user_db.getAddress_detail());
                    info_list.add(user_db.getTel());
                    session.put("login_info",info_list);
                    break;
                }
            }
            session_h.getTransaction().commit();
        }catch (Exception e){
            e.printStackTrace();
        }
        if (flag == 1){
            session.put("login_name",user.getLogin_name());
            session.put("login_pwd",user.getPassword());
            session.put("access_user","pass");
            session.put("exit",false);
            create_date_info();
            try {
                create_file_info();
            }catch (Exception e){
                e.printStackTrace();
            }
            create_college_info();
            create_friend_info();
            return "success";
        }else{
            return "failure";
        }
    }
}
