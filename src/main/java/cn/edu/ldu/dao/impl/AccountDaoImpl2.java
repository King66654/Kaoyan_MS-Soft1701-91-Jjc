package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.User;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao2")
public class AccountDaoImpl2 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new User();
    }
}
