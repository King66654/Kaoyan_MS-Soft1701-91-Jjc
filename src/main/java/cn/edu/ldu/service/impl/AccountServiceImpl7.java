package cn.edu.ldu.service.impl;

import cn.edu.ldu.dao.IAccountdao;
import cn.edu.ldu.service.IAccountservice;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Service;

import javax.annotation.Resource;

@Service(value = "accountService7")
@Scope("singleton")//修改为多例。默认单例！
public class AccountServiceImpl7 implements IAccountservice {
    @Resource(name = "accountDao7")//直接按照id去找！
    private IAccountdao accountDao;
    public AccountServiceImpl7(){
        System.out.println("对象已创建！");
    }
    @Override
    public Object saveAccount(){
        return accountDao.saveAccount();
    }
}
