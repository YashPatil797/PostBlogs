package com.tech.blog.dao;

import com.tech.blog.entites.Users;
import java.sql.*;

public class UserDao {
    private Connection con;
    public UserDao(Connection con)
    {
        this.con=con;
    }
    
    public boolean saveUser(Users u1)
    {
        boolean flag=false;
        try
        {
            String query="insert into Users(name,email,password,gender) values(?,?,?,?)";
            PreparedStatement ps1=this.con.prepareStatement(query);
            ps1.setString(1,u1.getName());
            ps1.setString(2,u1.getEmail());
            ps1.setString(3,u1.getPassword());
            ps1.setString(4,u1.getGender());
            ps1.executeUpdate();
            return true;
        }
        catch(Exception e)
        {
              e.printStackTrace();      
        }
       
        return flag;
    }
    public Users getUserByEmailAndPassword(String email,String pass)
    {
        Users u1=null;
         try
         {
             String query="select * from users where EMAIL=? and PASSWORD=?";
             PreparedStatement ps1=con.prepareStatement(query);
             ps1.setString(1,email);
             ps1.setString(2,pass);
             ResultSet rs=ps1.executeQuery();
             if(rs.next())
             {
                 u1=new Users();
                 u1.setId(rs.getInt("ID"));
                 u1.setEmail(rs.getString("EMAIL"));
                 u1.setGender(rs.getString("GENDER"));
                 u1.setPassword(rs.getString("PASSWORD"));
                 u1.setName(rs.getString("NAME"));
                 
             }
         }
         catch(Exception e)
         {
            e.printStackTrace();   
         }
        
        return u1;
    }
}
