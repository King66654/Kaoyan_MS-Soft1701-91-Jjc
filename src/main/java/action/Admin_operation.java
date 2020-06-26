package action;
import bean.DAOUtils;
import com.opensymphony.xwork2.ActionSupport;
import model.User;
import cn.edu.ldu.service.IAccountservice;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Admin_operation  extends ActionSupport implements SessionAware {
    private String mohu_name;
    public String getMohu_name() {
        return mohu_name;
    }
    public void setMohu_name(String mohu_name) {
        this.mohu_name = mohu_name;
    }
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    private String old_name;
    public String getOld_name() {
        return old_name;
    }
    public void setOld_name(String old_name) {
        this.old_name = old_name;
    }
    private String[] select_user=new String[]{};
    public String[] getSelect_user() {
        return select_user;
    }
    public void setSelect_user(String[] select_user) {
        this.select_user = select_user;
    }
    private User user;
    public User getUser() {
        return user;
    }
    public void setUser(User user) {
        this.user = user;
    }
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    public void update_user_info() throws Exception{
        Connection conn= DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql = "select * from user";
        ResultSet rs=stmt.executeQuery(sql);
        List<User> user_list=new ArrayList<User>();
        while (rs.next()){
            IAccountservice as = (IAccountservice)ac.getBean("accountService2");
            User user=(User) as.saveAccount();
            user.setLogin_name(rs.getString("login_name"));
            user.setPassword(rs.getString("password"));
            user_list.add(user);
        }
        session.put("user_info",user_list);
    }
    public String update(){
        Connection conn=null;
        Statement stmt=null;
        try{
           conn=DAOUtils.getConnection();
           stmt=conn.createStatement();
            String sql1="update user set login_name='"+user.getLogin_name()+"',password='"+user.getPassword()+"' where login_name='"+getOld_name()+"'";
            String sql2="update college set login_name='"+user.getLogin_name()+"' where login_name='"+getOld_name()+"'";
            String sql3="update file set login_name='"+user.getLogin_name()+"' where login_name='"+getOld_name()+"'";
            String sql4="update friend set login_name='"+user.getLogin_name()+"' where login_name='"+getOld_name()+"'";
            String sql5="update date set login_name='"+user.getLogin_name()+"' where login_name='"+getOld_name()+"'";
            stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            stmt.executeUpdate(sql3);
            stmt.executeUpdate(sql4);
            stmt.executeUpdate(sql5);
            String old_name="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+getOld_name();
            File file1 = new File(old_name);
            String new_name="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+user.getLogin_name();
            file1.renameTo(new File(new_name));
            update_user_info();
            return "upd_success";
        }catch (Exception e){
            return "upd_failure";
        }
    }
    public void delAllFile(File directory){
        if (!directory.isDirectory()){
            directory.delete();
        } else{
            File [] files = directory.listFiles();
            // 空文件夹
            if (files.length == 0){
                directory.delete();
                return;
            }
            // 删除子文件夹和子文件
            for (File file : files){
                if (file.isDirectory()){
                    delAllFile(file);
                } else {
                    file.delete();
                }
            }
            // 删除文件夹本身
            directory.delete();
        }
    }
    public String delete(){
        String login_name=user.getLogin_name();
        Connection conn=null;
        Statement stmt=null;
        try{
            conn=DAOUtils.getConnection();
            stmt=conn.createStatement();
            String sq11="delete from user where login_name='"+login_name+"'";
            String sql2="delete from file where login_name='"+login_name+"'";
            String sql3="delete from friend where login_name='"+login_name+"'";
            String sql4="delete from college where login_name='"+login_name+"'";
            String sql5="delete from date where login_name='"+login_name+"'";
            stmt.executeUpdate(sq11);
            stmt.executeUpdate(sql2);
            stmt.executeUpdate(sql3);
            stmt.executeUpdate(sql4);
            stmt.executeUpdate(sql5);
            String path= "D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+login_name;
            File file_temp = new File(path);
            delAllFile(file_temp);
            update_user_info();
            return "del_success";
        }catch (Exception e){
            return "del_failure";
        }
    }
    public void deleteby_name(String name){
        String login_name=name;
        Connection conn=null;
        Statement stmt=null;
        try{
            conn=DAOUtils.getConnection();
            stmt=conn.createStatement();
            String sq11="delete from user where login_name='"+login_name+"'";
            String sql2="delete from file where login_name='"+login_name+"'";
            String sql3="delete from friend where login_name='"+login_name+"'";
            String sql4="delete from college where login_name='"+login_name+"'";
            String sql5="delete from date where login_name='"+login_name+"'";
            stmt.executeUpdate(sq11);
            stmt.executeUpdate(sql2);
            stmt.executeUpdate(sql3);
            stmt.executeUpdate(sql4);
            stmt.executeUpdate(sql5);
            String path= "D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+login_name;
            File file_temp = new File(path);
            delAllFile(file_temp);
            update_user_info();
        }catch (Exception e){
        }
    }
    public String select_delete(){
        String[] user_name=getSelect_user();
        for (int i=0;i<user_name.length;i++){
            deleteby_name(user_name[i]);
        }
        return "select_delete";
    }
    public String mohu_query() throws Exception{
        String name=getMohu_name();
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql = "select * from user where login_name like '%"+name+"%';";
        ResultSet rs=stmt.executeQuery(sql);
        List<User> user_list=new ArrayList<User>();
        while (rs.next()){
            IAccountservice as = (IAccountservice)ac.getBean("accountService2");
            User user=(User) as.saveAccount();
            user.setLogin_name(rs.getString("login_name"));
            user.setPassword(rs.getString("password"));
            user_list.add(user);
        }
        session.put("user_info",user_list);
        return "mohu_success";
    }
}
