package cn.edu.ldu.service.impl;

import cn.edu.ldu.dao.IAccountdao;
import cn.edu.ldu.service.IAccountservice;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "accountService6")
@Scope("singleton")//修改为多例。默认单例！
public class AccountServiceImpl6 implements IAccountservice {
    @Resource(name = "accountDao6")//直接按照id去找！
    private IAccountdao accountDao;
    public AccountServiceImpl6(){
        System.out.println("对象已创建！");
    }
    @Override
    public Object saveAccount(){
        return accountDao.saveAccount();
    }
}
