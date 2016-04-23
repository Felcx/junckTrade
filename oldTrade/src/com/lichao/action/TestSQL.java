package com.lichao.action;

import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lichao.bean.User;
import com.lichao.persistence.PersistenceUser;

public class TestSQL {
	public static void main(String[] args) { 

        /* 1. Create a new user */ 
        Integer id = new Integer(1); 
        User user = new User();
        user.setName("Felcx");
        user.setPwd("123456");

        /* 2. Load the Spring bean configuration and create a bean factory */ 
        ApplicationContext ctx = new ClassPathXmlApplicationContext("applicationContext.xml"); 

        /* 3. Create instance of PersistenceLayer */ 
        PersistenceUser persistenceLayer = (PersistenceUser) ctx.getBean("persistenceUser");

        /* 4. Save the new user to the database */         
        persistenceLayer.addUser(user); 
        System.out.println("用户已保存");
        /* 5. Confirm that our user was saved */ 
//        User userLoadedFromDB = persistenceLayer.findUserById(id);
//
//        /* 6. Update the user */         
//        persistenceLayer.updateUser(userLoadedFromDB); 
//
//        /* 7. Confirm that the update worked */ 
//        User userLoadedFromDBAgain = persistenceLayer              
//              .findUserById(id);         
//
//        /* 8. Delete the user */         
//         persistenceLayer.deleteUser(user); 
    } 
}
