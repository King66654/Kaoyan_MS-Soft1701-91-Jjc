package util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

public class HbnUtils {
    private static SessionFactory sessionFactory;

    public static Session getSession(){//定义成类方法，可通过类名直接调用！
        //Session session=sf.openSession(); 每一次会创建一个新的session，实际上在一个线程内部，一个session足以！多了会资源浪费！
        //Session session=sf.getCurrentSession(); 获得当前线程的session！但要与当前线程绑定，注册运行环境！会自动关闭！查询只能在当前事务执行！
        return getSessionFactory().getCurrentSession();//本方法，已满单例模式了！
    }

    public static SessionFactory getSessionFactory() {//使其满足单例模式！
        if (sessionFactory == null || sessionFactory.isClosed()){
            sessionFactory = new Configuration().configure().buildSessionFactory();
        }
        return sessionFactory;
    }
}