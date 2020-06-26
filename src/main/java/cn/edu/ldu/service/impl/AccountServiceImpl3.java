package cn.edu.ldu.service.impl;

import cn.edu.ldu.dao.IAccountdao;
import cn.edu.ldu.service.IAccountservice;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "accountService3")
@Scope("singleton")//修改为多例。默认单例！
public class AccountServiceImpl3 implements IAccountservice {
    @Resource(name = "accountDao3")//直接按照id去找！
    private IAccountdao accountDao;
    public AccountServiceImpl3(){
        System.out.println("对象已创建！");
    }
    @Override
    public Object saveAccount(){
        return accountDao.saveAccount();
    }
}
