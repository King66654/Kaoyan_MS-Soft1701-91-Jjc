package action;

import bean.DAOUtils;
import model.User;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.Map;

public class SafeAction  implements SessionAware {
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    private User user;
    private String old_pwd;
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public String getOld_pwd() {
        return old_pwd;
    }
    public void setOld_pwd(String old_pwd) {
        this.old_pwd = old_pwd;
    }
    public boolean check(String pwd) throws SQLException {
        Connection conn= DAOUtils.getConnection();
        int flag=0;
        Statement stmt=conn.createStatement();
        String sql="select password from user where login_name='"+session.get("login_name")+"'";
        ResultSet rs=stmt.executeQuery(sql);
        while (rs.next()){
            if (pwd.equals(rs.getString("password"))){
                flag=1;
                break;
            }
        }
        if (flag==1){
            return true;
        }else{
            return false;
        }
    }
    public String execute(){
        try {
            boolean check_best=check(getOld_pwd());
            if (check_best){
                Connection conn=DAOUtils.getConnection();
                Statement stmt=conn.createStatement();
                String sql1="update college set login_name='"+user.getLogin_name()+"' where login_name='"+session.get("login_name")+"'";
                String sql2="update date set login_name='"+user.getLogin_name()+"' where login_name='"+session.get("login_name")+"'";
                String sql3="update file set login_name='"+user.getLogin_name()+"' where login_name='"+session.get("login_name")+"'";
                String sql4="update friend set login_name='"+user.getLogin_name()+"' where login_name='"+session.get("login_name")+"'";
                String sql5="update user set login_name='"+user.getLogin_name()+"',password='"+user.getPassword()+"' where login_name='"+session.get("login_name")+"'";
                stmt.executeUpdate(sql1);
                stmt.executeUpdate(sql2);
                stmt.executeUpdate(sql3);
                stmt.executeUpdate(sql4);
                stmt.executeUpdate(sql5);
                String old_name="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+session.get("login_name");
                File file1 = new File(old_name);
                String new_name="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+user.getLogin_name();
                file1.renameTo(new File(new_name));
                session.put("exit",true);
                return "success";
            }else{
                session.put("safe_check",false);
                return "failure";
            }
        }catch (Exception e){
            session.put("safe_check",false);
            return "failure";
        }
    }
}