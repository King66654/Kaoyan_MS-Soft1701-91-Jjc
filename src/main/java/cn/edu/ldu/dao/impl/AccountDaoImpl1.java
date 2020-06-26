package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.User_DB;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao1")
public class AccountDaoImpl1 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new User_DB();
    }
}
