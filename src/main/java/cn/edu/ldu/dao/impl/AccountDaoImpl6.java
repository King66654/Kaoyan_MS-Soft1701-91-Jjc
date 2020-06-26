package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.Date;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao6")
public class AccountDaoImpl6 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new Date();
    }
}