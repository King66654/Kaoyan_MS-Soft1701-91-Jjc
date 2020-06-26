package action;

import bean.DAOUtils;
import com.opensymphony.xwork2.ActionSupport;
import model.User;
import model.User_DB;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import util.HbnUtils;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Date;
import java.sql.Connection;
import java.sql.Statement;
import java.text.SimpleDateFormat;
import java.util.List;
import java.util.Map;

public class RegisterAction extends ActionSupport implements SessionAware {
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
    public String res() {
        try{
            User_DB temp=new User_DB();
            temp.setLogin_name(user.getLogin_name());
            temp.setPassword(user.getPassword());
            temp.setName(user.getName());
            temp.setSex(user.getSex());
            temp.setRace(user.getRace());
            Date birth=user.getBirth();
            java.text.SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
            String date_test=format.format(birth);
            temp.setBirth(date_test);
            temp.setTel(user.getTel());
            temp.setMail(user.getMail()+user.getMail_after());
            temp.setAddress_p(user.getAddress_p());
            temp.setAddress_c(user.getAddress_c());
            temp.setAddress_d(user.getAddress_d());
            temp.setAddress_detail(user.getAddress_detail());

            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            session_h.getTransaction();
            session_h.save(temp);
            session_h.getTransaction().commit();
            return "res_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "res_failure";
        }
    }
    public void tongbu(List<String> test_list){
        List<String> test = test_list;
        session.put("login_info",test);
    }
    public String update() throws Exception{
        String login_name=user.getLogin_name();
        String pwd=user.getPassword();
        String name=user.getName();
        String sex=user.getSex();
        Date birth=user.getBirth();
        java.text.SimpleDateFormat format = new SimpleDateFormat("yyyy/MM/dd");
        String date_test=format.format(birth);
        String race=user.getRace();
        String tel=user.getTel();
        String loc_p=user.getAddress_p();
        String loc_c=user.getAddress_c();
        String loc_d=user.getAddress_d();
        String loc_detail=user.getAddress_detail();
        String mail=user.getMail()+user.getMail_after();
        Connection con = DAOUtils.getConnection();
        Statement stmt = con.createStatement();
        String pwd_sql="select password from user where login_name='"+user.getLogin_name()+"';";
        ResultSet best=stmt.executeQuery(pwd_sql);
        int flag=0;
        while (best.next()){
            String pwd_test=best.getString("password");
            if (pwd_test.equals(pwd)){
                flag=1;
                break;
            }
        }
        if (flag == 1){
            String sql="update user set password='"+session.get("login_pwd")+"',name='"+user.getName()+"',sex='"+user.getSex()+"',race='"+user.getRace()+"',birth='"+date_test+"',mail='"+(user.getMail()+user.getMail_after())+"',tel='"+user.getTel()+"',address_p='"+user.getAddress_p()+"',address_c='"+user.getAddress_c()+"',address_d='"+user.getAddress_d()+"',address_detail='"+user.getAddress_detail()+"' where login_name='"+user.getLogin_name()+"'";
            int check=stmt.executeUpdate(sql);
            if (check!=0){
                List<String> test_list = new ArrayList<String>();
                test_list.add(user.getLogin_name());
                test_list.add((String) session.get("login_pwd"));
                test_list.add(name);
                test_list.add(sex);
                test_list.add(race);
                test_list.add(date_test);
                test_list.add(mail);
                test_list.add(loc_p);
                test_list.add(loc_c);
                test_list.add(loc_d);
                test_list.add(loc_detail);
                test_list.add(tel);
                tongbu(test_list);
                stmt.close();
                session.put("info_false","info_success");
                return "upd_success";
            }else{
                stmt.close();
                return "upd_failure";
            }
        }else{
            session.put("info_false","info_false");
            stmt.close();
            return "upd_failure";
        }
    }
}
