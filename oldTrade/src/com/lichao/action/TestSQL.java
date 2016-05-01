package com.lichao.action;

import java.sql.Timestamp;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lichao.bean.Admin;
import com.lichao.bean.User;
import com.lichao.persistence.PersistenceAdmin;
import com.lichao.persistence.PersistenceUser;
import com.lichao.utill.MD5Util;

public class TestSQL  extends BaseAction{
	
	
	
	public static void main(String[] args) { 
		userTest();
        //adminTest();
         
    } 
	
	private static void adminTest(){
		/* 1. Create a new user */ 
        Integer id = new Integer(1); 
        Admin user = new Admin();
        user.setName("admin");
        user.setPwd(MD5Util.MD5("1234567"));
        Timestamp time=new Timestamp(System.currentTimeMillis());
        user.setTimeCreate(time);
        user.setTimeCurrent(time);

        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); 

         PersistenceAdmin persistenceLayer = (PersistenceAdmin) ctx.getBean("persistenceAdmin");
         persistenceLayer.addUser(user); 
        mLoger.debug("用户已保存");
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
	
	private static void userTest(){
		 Integer id = new Integer(1); 
      User user = new User();
//      user.setName("admin");
//      user.setPwd(MD5Util.MD5("1234567"));

      ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); 

     PersistenceUser persistenceLayer = (PersistenceUser) ctx.getBean("persistenceUser");
     for(int i=0;i<25;i++){
      user.setName("User"+i);
      user.setPwd(MD5Util.MD5("123456"));
      Timestamp currentTime=new Timestamp(System.currentTimeMillis());
		user.setTimeCreate(currentTime);
		user.setTimeCurrent(currentTime);
		user.setPower(1);
		user.setRangeBuy(1);
		user.setRangeSell(1);
      persistenceLayer.addUser(user); 
      mLoger.debug("用户已保存");
     }
//      User userLoadedFromDB = persistenceLayer.findUserById(id);
//      
//      
//      userLoadedFromDB.setBankCard("123343143214");
//      
//      persistenceLayer.updateUser(userLoadedFromDB); 
//     // mLoger.debug(userLoadedFromDB.toString());
//
//      User userLoadedFromDBAgain = persistenceLayer              
//            .findUserById(id);         
//
//      /* 8. Delete the user */         
//       persistenceLayer.deleteUser(user); 
//       mLoger.debug("用户已删除");
	}
}
