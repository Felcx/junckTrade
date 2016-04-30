package com.lichao.persistence;

import com.lichao.bean.AdminDAO;
import com.lichao.bean.Admin;
import com.lichao.bean.AdminDAO;
 
public class PersistenceAdmin {
	private AdminDAO userDAO; 
    public AdminDAO getUserDAO() { 
        return userDAO; 
    } 

    public void setUserDAO(AdminDAO userDAO) { 
        this.userDAO = userDAO; 
    } 
 
    public void addUser(Admin user) { 
        userDAO.save(user); 
    } 

    public Admin findUserById(Integer id) { 
        return
        userDAO.findById(id); 
    } 
 
    public void updateUser(Admin user) { 
        userDAO.merge(user); 
    } 

    public void deleteUser(Admin user) { 
        userDAO.delete(user); 
    } 
}
