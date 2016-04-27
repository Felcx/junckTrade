package com.lichao.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lichao.bean.User;
import com.lichao.persistence.PersistenceUser;

public class TestSQL  extends BaseAction{
	public static void main(String[] args) { 

        /* 1. Create a new user */ 
        Integer id = new Integer(1); 
        User user = new User();
        user.setName("Felcx");
        user.setPwd("123456");

        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); 

        PersistenceUser persistenceLayer = (PersistenceUser) ctx.getBean("persistenceUser");

//        persistenceLayer.addUser(user); 
//        mLoger.debug("用户已保存");
//        User userLoadedFromDB = persistenceLayer.findUserById(id);
//        
//        
//        userLoadedFromDB.setBankCard("123343143214");
//        
//        persistenceLayer.updateUser(userLoadedFromDB); 
//       // mLoger.debug(userLoadedFromDB.toString());
//
//        User userLoadedFromDBAgain = persistenceLayer              
//              .findUserById(id);         
//
//        /* 8. Delete the user */         
//         persistenceLayer.deleteUser(user); 
//         mLoger.debug("用户已删除");
         
    } 
}
