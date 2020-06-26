package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.Manage_college;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao4")
public class AccountDaoImpl4 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new Manage_college();
    }
}
