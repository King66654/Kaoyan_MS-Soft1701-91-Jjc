package action;

import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import com.opensymphony.xwork2.ActionSupport;
import model.College;
import model.Date;
import org.apache.struts2.interceptor.SessionAware;
import org.hibernate.Session;
import org.springframework.context.support.ClassPathXmlApplicationContext;
import util.HbnUtils;

import java.sql.Connection;
import java.sql.Statement;
import java.util.*;

public class DateAction extends ActionSupport implements SessionAware {
    private Date date;
    public Date getDate() {
        return date;
    }
    public void setDate(Date date) {
        this.date = date;
    }
    private String[] selectDateName=new String[]{};
    public String[] getSelectDateName() {
        return selectDateName;
    }
    public void setSelectDateName(String[] selectDateName) {
        this.selectDateName = selectDateName;
    }
    private String old_date;
    private String old_thing;
    private String year;
    private String month;
    public String getYear() {
        return year;
    }
    public void setYear(String year) {
        this.year = year;
    }
    public String getMonth() {
        return month;
    }
    public void setMonth(String month) {
        this.month = month;
    }
    public String getOld_date() {
        return old_date;
    }
    public void setOld_date(String old_date) {
        this.old_date = old_date;
    }
    public String getOld_thing() {
        return old_thing;
    }
    public void setOld_thing(String old_thing) {
        this.old_thing = old_thing;
    }
    private Map<String, Object> session;
    public Session session_h;
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public void update_date_info(){
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        String hql="from Date where login_name='"+session.get("login_name")+"'";
        List<Date> dates=session_h.createQuery(hql).list();
        session_h.getTransaction().commit();
        session.put("date_info",dates);
    }
    public String delete(){
        try{
            IAccountservice as = (IAccountservice)ac.getBean("accountService6");
            Date date_temp=(Date) as.saveAccount();
            date_temp.setLogin_name((String) session.get("login_name"));
            date_temp.setThing(date.getThing());
            date_temp.setDate(date.getDate());
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            session_h.delete(date_temp);
            session_h.getTransaction().commit();
            update_date_info();
            return "del_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "del_failure";
        }
    }
    public String add(){
        try {
            IAccountservice as = (IAccountservice)ac.getBean("accountService6");
            Date date_temp=(Date) as.saveAccount();
            String date=(String) this.date.getDate();
            String thing=(String) this.date.getThing();
            session_h = HbnUtils.getSession();
            session_h.beginTransaction();
            date_temp.setLogin_name((String) session.get("login_name"));
            date_temp.setThing(thing);
            date_temp.setDate(date);
            session_h.save(date_temp);
            session_h.getTransaction().commit();
            update_date_info();
            return "add_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "add_failure";
        }
    }
    public void imply_update(String thing,String date){
        IAccountservice as = (IAccountservice)ac.getBean("accountService6");
        Date test=(Date) as.saveAccount();
        test.setLogin_name((String)session.get("login_name"));
        test.setThing(thing);
        test.setDate(date);
        session_h=HbnUtils.getSession();
        session_h.beginTransaction();
        session_h.save(test);
        session_h.getTransaction().commit();
    }
    public String update(){
        try{
            String date=(String) this.date.getDate();
            String old_date=this.old_date;
            old_date=old_date.replace('/','-');
            date=date.replace('/','-');
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            IAccountservice as = (IAccountservice)ac.getBean("accountService6");
            Date date_temp=(Date) as.saveAccount();
            date_temp.setLogin_name((String) session.get("login_name"));
            date_temp.setThing(old_thing);
            date_temp.setDate(old_date);
            session_h.delete(date_temp);
            session_h.getTransaction().commit();
            imply_update(this.date.getThing(),date);
            update_date_info();
            return "upd_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "upd_failure";
        }
    }
    public String mohuQuery(){
        String time_test="";
        if (getYear().equals("") && getMonth().equals("")){
            time_test="20%";
        }else if(!getYear().equals("") && !getMonth().equals("")){
            time_test="20"+getYear()+"-"+getMonth()+"%";
        }else if (!getYear().equals("") && getMonth().equals("")){
            time_test="20"+getYear()+"%";
        }
        try {
            session_h=HbnUtils.getSession();
            session_h.beginTransaction();
            String hql="from Date where login_name='"+session.get("login_name")+"' and date like :sdate";
            List<Date> dateList=session_h.createQuery(hql).setParameter("sdate",time_test).list();
            session_h.getTransaction().commit();
            this.session.put("date_info",dateList);
            return "mohu_success";
        }catch (Exception e){
            e.printStackTrace();
            session_h.getTransaction().rollback();
            return "mohu_failure";
        }
    }
    public String select_delete() throws Exception{
        Connection conn=DAOUtils.getConnection();
        Statement stmt=conn.createStatement();
        String[] test=getSelectDateName();
        for (int i=0;i<test.length;i++){
            String[] array=test[i].split("@");
            String sql="delete from date where login_name='"+session.get("login_name")+"' and date='"+array[0]+"' and thing='"+array[1]+"';";
            stmt.executeUpdate(sql);
        }
        update_date_info();
        return "select_success";
    }
}