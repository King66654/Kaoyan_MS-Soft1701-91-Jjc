package action;
import bean.DAOUtils;
import com.opensymphony.xwork2.ActionSupport;
import model.File_test;
import org.apache.struts2.interceptor.SessionAware;
import java.io.File;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
public class File_operation_upload extends ActionSupport implements SessionAware {
    private static final long serialVersionUID = 1L;
    private List<File> file_exa;
    private List<String> file_title;
    private List<String> file_exaFileName;
    private List<String> file_exaContentType;
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }
    public List<File> getFile_exa() {
        return file_exa;
    }
    public void setFile_exa(List<File> file_exa) {
        this.file_exa = file_exa;
    }
    public List<String> getFile_title() {
        return file_title;
    }
    public void setFile_title(List<String> file_title) {
        this.file_title = file_title;
    }
    public List<String> getFile_exaFileName() {
        return file_exaFileName;
    }
    public void setFile_exaFileName(List<String> file_exaFileName) {
        this.file_exaFileName = file_exaFileName;
    }
    public List<String> getFile_exaContentType() {
        return file_exaContentType;
    }
    public void setFile_exaContentType(List<String> file_exaContentType) {
        this.file_exaContentType = file_exaContentType;
    }
    public void insert_file_list(String login_name, String file_name, String file_title, String type, String size)throws Exception{
        Connection con = DAOUtils.getConnection();
        Statement stmt = con.createStatement();
        String sql="insert into file values('"+login_name+"','"+file_name+"','"+file_title+"','"+type+"','"+size+"');";
        stmt.executeUpdate(sql);
        stmt.close();
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
                File_test temp=new File_test();
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
    public String upload(){
        try{
            String path="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+(String) session.get("login_name");
            File dir = new File(path);
            if(!dir.exists()){
                dir.mkdirs();
            }
            for (int i=0;i<file_exa.size();i++){
                File destFile=new File(path,getFile_exaFileName().get(i));
                FileUtils.copyFile(getFile_exa().get(i),destFile);
                DecimalFormat df = new DecimalFormat("#0.00");
                float num_kb=getFile_exa().get(i).length()/1024;
                float num_mb=0;
                String result="";
                if ((int)num_kb > 1024){
                    num_mb=num_kb/1024;
                    result=df.format(num_mb);
                    result=result+"MB";
                }else {
                    result=df.format(num_kb);
                    result=result+"KB";
                }
                insert_file_list((String )session.get("login_name"),getFile_exaFileName().get(i),getFile_title().get(i),getFile_exaFileName().get(i).substring(getFile_exaFileName().get(i).lastIndexOf("."),getFile_exaFileName().get(i).length()),(String) result);
                update_file_info();
            }
            return "upload_success";
        }catch (Exception e) {
            e.printStackTrace();
            return "upload_failure";
        }
    }
}
