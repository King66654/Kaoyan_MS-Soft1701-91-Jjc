package action;
import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import com.opensymphony.xwork2.ActionSupport;
import model.College;
import model.Manage_college;
import org.apache.struts2.StrutsStatics;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class Admin_school_operation extends ActionSupport implements SessionAware {
    private String mohu_name;
    public String getMohu_name() {
        return mohu_name;
    }
    public void setMohu_name(String mohu_name) {
        this.mohu_name = mohu_name;
    }
    private College college;
    public College getCollege() {
        return college;
    }
    public void setCollege(College college) {
        this.college = college;
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
    private String[] select_college;
    public String[] getSelect_college() {
        return select_college;
    }
    public void setSelect_college(String[] select_college) {
        this.select_college = select_college;
    }
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    public void update_info() throws Exception {
        Connection conn= DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql = "select * from manage_college";
        ResultSet rs=stmt.executeQuery(sql);
        List<Manage_college> school_list=new ArrayList<Manage_college>();
        while (rs.next()){
            IAccountservice as = (IAccountservice)ac.getBean("accountService4");
            Manage_college temp=(Manage_college)as.saveAccount();
            temp.setCollege(rs.getString("college"));
            temp.setPlace(rs.getString("place"));
            temp.setLevel(rs.getString("level"));
            temp.setAcademy(rs.getString("academy"));
            school_list.add(temp);
        }
        session.put("school_info",school_list);
    }
    public String delete() throws Exception{
        String name=college.getCollege_name();
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql1="delete from manage_college where college='"+college.getCollege_name()+"';";
        String sql2="delete from college where college='"+college.getCollege_name()+"';";
        stmt.executeUpdate(sql1);
        stmt.executeUpdate(sql2);
        update_info();
        stmt.close();
        return "del_success";
    }
    public void delete_test(String name_test) throws Exception{
        String name=name_test;
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql1="delete from manage_college where college='"+name+"';";
        String sql2="delete from college where college='"+name+"';";
        stmt.executeUpdate(sql1);
        stmt.executeUpdate(sql2);
        update_info();
        stmt.close();
    }
    public String select_delete() throws Exception{
        String[] name=getSelect_college();
        for (int i=0;i<name.length;i++){
            delete_test(name[i]);
        }
        return "select_success";
    }
    public String add(){
        Connection conn=null;
        Statement stmt=null;
        try {
            conn=DAOUtils.getConnection();
            stmt=conn.createStatement();
            String sql="insert into manage_college values('"+college.getCollege_name()+"','"+college.getPlace()+"','"+college.getLevel()+"','"+college.getAcademy()+"')";
            stmt.executeUpdate(sql);
            stmt.close();
            update_info();
            return "add_success";
        }catch (Exception e){
            return "add_failure";
        }
    }
    public String update(){
        Connection conn=null;
        Statement stmt=null;
        try{
            conn=DAOUtils.getConnection();
            stmt=conn.createStatement();
            String sql1="update manage_college set college='"+college.getCollege_name()+"',place='"+college.getPlace()+"',level='"+college.getLevel()+"',academy='"+college.getAcademy()+"' where college='"+getOld_name()+"';";
            String sql2="update college set college='"+college.getCollege_name()+"' where college='"+getOld_name()+"';";
            System.out.println(sql1);
            System.out.println(sql2);
            stmt.executeUpdate(sql1);
            stmt.executeUpdate(sql2);
            update_info();
            stmt.close();
            return "upd_success";
        }catch (Exception e){
            return "upd_failure";
        }
    }
    public String mohu_query() throws Exception {
        String name=getMohu_name();
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String sql="select * from manage_college where college like '%"+name+"%';";
        ResultSet rs=stmt.executeQuery(sql);
        List<Manage_college> school_list=new ArrayList<Manage_college>();
        while (rs.next()){
            IAccountservice as = (IAccountservice)ac.getBean("accountService4");
            Manage_college temp=(Manage_college)as.saveAccount();
            temp.setCollege(rs.getString("college"));
            temp.setPlace(rs.getString("place"));
            temp.setLevel(rs.getString("level"));
            temp.setAcademy(rs.getString("academy"));
            school_list.add(temp);
        }
        session.put("school_info",school_list);
        stmt.close();
        return "mohu_success";
    }
}
