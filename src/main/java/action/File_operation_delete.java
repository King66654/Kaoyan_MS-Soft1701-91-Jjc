package action;
import bean.DAOUtils;
import cn.edu.ldu.service.IAccountservice;
import model.Date;
import model.File_test;
import org.apache.struts2.interceptor.SessionAware;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

public class File_operation_delete implements SessionAware {
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    private String fileName;
    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }
    public static ClassPathXmlApplicationContext ac = new ClassPathXmlApplicationContext("bean.xml");
    public static boolean deleteFile(String pathname){
        boolean result = false;
        File file = new File(pathname);
        if (file.exists()) {
            file.delete();
            result = true;
        }
        return result;
    }
    public void update_file_info(){
        List<File_test> file_list = new ArrayList<File_test>();
        Connection con = null;
        Statement stmt = null;
        try{
            con=DAOUtils.getConnection();
            stmt=con.createStatement();
            String sql="select * from file where login_name='"+session.get("login_name")+"'";
            ResultSet rs = stmt.executeQuery(sql);
            while (rs.next()) {
                IAccountservice as = (IAccountservice)ac.getBean("accountService7");
                File_test temp=(File_test) as.saveAccount();
                temp.setFilename(rs.getString("file_name"));
                temp.setTitle(rs.getString("file_title"));
                temp.setType(rs.getString("file_type"));
                temp.setSize(rs.getString("file_size"));
                file_list.add(temp);
            }
            this.session.put("file_info",file_list);
            rs.close();
            stmt.close();
        }catch (Exception e){
        }
    }
    public String execute(){
        String filename=getFileName();
        String path="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+session.get("login_name")+"\\";
        try {
            Connection conn=DAOUtils.getConnection();
            Statement stmt = conn.createStatement();
            String sql="delete from file where login_name='"+session.get("login_name")+"' and file_name='"+getFileName()+"'";
            int test=stmt.executeUpdate(sql);
            if (test!=0){
                update_file_info();
                boolean check=deleteFile(path+filename);
                if (check){
                    return "success";
                }else{
                    String test_check="ROLLBACK";
                    stmt.execute(test_check);
                    return "failure";
                }
            }else{
                return "failure";
            }
        }catch (Exception e){
            return "failure";
        }
    }
}
