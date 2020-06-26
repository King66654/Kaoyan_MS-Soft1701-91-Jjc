package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.College;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao3")
public class AccountDaoImpl3 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new College();
    }
}