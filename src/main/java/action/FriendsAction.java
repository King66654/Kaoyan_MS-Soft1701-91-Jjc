package action;
import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import com.opensymphony.xwork2.ActionSupport;
import model.File_test;
import model.Friends;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import util.HbnUtils;

import java.sql.Connection;
import java.sql.Statement;
import java.util.List;
import java.util.Map;
public class FriendsAction extends ActionSupport implements SessionAware{
    private Friends friends;
    private String[] studentSelectName = new String[]{};
    public String[] getStudentSelectName() {
        return studentSelectName;
    }
    public void setStudentSelectName(String[] studentSelectName) {
        this.studentSelectName = studentSelectName;
    }
    private String old_name;
    public String getOld_name() {
        return old_name;
    }
    public void setOld_name(String old_name) {
        this.old_name = old_name;
    }
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public Friends getFriends() {
        return friends;
    }
    public void setFriends(Friends friends) {
        this.friends = friends;
    }
    private String mohu_name;
    public String getMohu_name() {
        return mohu_name;
    }
    public void setMohu_name(String mohu_name) {
        this.mohu_name = mohu_name;
    }
    public Session session_h;
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    public void update_info(){
        String sql="select * from friend where login_name='"+session.get("login_name")+"'";
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        List<Friends> friendsList=session_h.createSQLQuery(sql).addEntity(Friends.class).list();
        session_h.getTransaction().commit();
        session.put("friend_info",friendsList);
    }
    public String delete(){
        String name=friends.getName();
        try{
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            IAccountservice as = (IAccountservice)ac.getBean("accountService5");
            Friends friends_temp=(Friends) as.saveAccount();
            friends_temp.setLogin_name((String)session.get("login_name"));
            friends_temp.setName(name);
            session_h.delete(friends_temp);
            session_h.getTransaction().commit();
            update_info();
            return "del_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "del_failure";
        }
    }
    public String select_delete_friends() throws Exception{
        String[] test=getStudentSelectName();
        Connection con = DAOUtils.getConnection();
        Statement stmt=null;
        String[] sql=new String[test.length];
        for (int i=0;i<sql.length;i++){
            stmt = con.createStatement();
            sql[i]="delete from friend where login_name='"+session.get("login_name")+"' and friend_name='"+test[i]+"';";
            stmt.executeUpdate(sql[i]);
        }
        update_info();
        stmt.close();
        return "select_success";
    }
    public void imply_update(){
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        IAccountservice as = (IAccountservice)ac.getBean("accountService5");
        Friends friends_temp=(Friends) as.saveAccount();
        friends_temp.setLogin_name((String)session.get("login_name"));
        friends_temp.setName(friends.getName());
        friends_temp.setTel(friends.getTel());
        friends_temp.setSex(friends.getSex());
        friends_temp.setMail(friends.getMail());
        friends_temp.setAddress(friends.getAddress());
        session_h.save(friends_temp);
        session_h.getTransaction().commit();
    }
    public String update(){
        try {
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            IAccountservice as = (IAccountservice)ac.getBean("accountService5");
            Friends friends_temp=(Friends) as.saveAccount();
            friends_temp.setLogin_name((String)session.get("login_name"));
            friends_temp.setName(getOld_name());
            session_h.delete(friends_temp);
            session_h.getTransaction().commit();
            imply_update();
            update_info();
            return "upd_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "upd_failure";
        }
    }
    public String add(){
        String name=friends.getName();
        String tel=friends.getTel();
        String sex=friends.getSex();
        System.out.println(sex);
        String mail=friends.getMail();
        String address=friends.getAddress();
        try {
            session_h = HbnUtils.getSession();
            session_h.beginTransaction();
            IAccountservice as = (IAccountservice)ac.getBean("accountService5");
            Friends friends_temp=(Friends) as.saveAccount();
            friends_temp.setLogin_name((String)session.get("login_name"));
            friends_temp.setName(name);
            friends_temp.setTel(tel);
            friends_temp.setSex(sex);
            friends_temp.setMail(mail);
            friends_temp.setAddress(address);
            session_h.save(friends_temp);
            session_h.getTransaction().commit();
            update_info();
            return "add_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "add_failure";
        }
    }
    public String mohuQuery() throws Exception{
        String mohu=getMohu_name();
        String sql="select * from friend where friend_name like '%"+mohu+"%';";
        session_h= HbnUtils.getSession();
        session_h.beginTransaction();
        List<Friends> friendsList=session_h.createSQLQuery(sql).addEntity(Friends.class).list();
        this.session.put("friend_info",friendsList);
        session_h.getTransaction().commit();
        return "mohu_success";
    }
}
