package cn.edu.ldu.dao.impl;

import cn.edu.ldu.dao.IAccountdao;
import model.Friends;
import org.springframework.stereotype.Repository;

@Repository(value = "accountDao5")
public class AccountDaoImpl5 implements IAccountdao {
    @Override
    public Object saveAccount(){
        return new Friends();
    }
}
