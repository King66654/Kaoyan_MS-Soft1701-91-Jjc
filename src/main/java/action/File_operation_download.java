package action;

import org.apache.struts2.interceptor.SessionAware;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.Map;

public class File_operation_download implements SessionAware {
    private static final long serialVersionUID = 1L;
    private String fileName;
    private InputStream targetFile;
    private Map<String, Object> session;
    @Override
    public void setSession(Map<String, Object> session) {
        this.session = session;
    }

    public String getFileName() {
        return fileName;
    }
    public void setFileName(String fileName) {
        this.fileName = fileName;
    }

    public InputStream getTargetFile() {
        return targetFile;
    }

    public void setTargetFile(InputStream targetFile) {
        this.targetFile = targetFile;
    }

    public String execute() throws FileNotFoundException {
        String realPath="D:\\idea项目文件\\Big_work_by_ssh\\Final_by_work\\File_store\\"+session.get("login_name")+"\\";
        File file = new File(realPath,getFileName());
        targetFile = new FileInputStream(file);
        return "success";
    }
}