package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.Date;
import model.File_test;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao7")
public class AccountDaoImpl7 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new File_test();
    }
}