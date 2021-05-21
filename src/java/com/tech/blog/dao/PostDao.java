package com.tech.blog.dao;

import com.tech.blog.entites.Category;
import com.tech.blog.entites.Posts;
import java.sql.*;
import java.util.*;

public class PostDao {
   Connection con=null;
   static int count=1;
   public PostDao(Connection con)
   {
       this.con=con;
   }
   
   public boolean savePost(Posts p1)
   {
       boolean flag=false;
       try
       {
          String query="insert into posts(PTITLE,CID,PCONTENT,USERID) values(?,?,?,?)";   
          PreparedStatement ps1 =this.con.prepareStatement(query);
          ps1.setString(1,p1.getPtitle());
          ps1.setInt(2,p1.getCatId());
          ps1.setString(3,p1.getpContent());
          ps1.setInt(4,p1.getUserId());          
          ps1.executeUpdate();
          count++;
          return true;
       }
       catch(Exception e)
       {
           e.printStackTrace();
       }
           
    
       return flag;
   }
   
   public ArrayList<Category> getAllCategories()
   {
       ArrayList<Category> a1=new ArrayList<>();
       try
       {
           String query="Select * from categories";
           Statement st1=this.con.createStatement();
           ResultSet rs=st1.executeQuery(query);
           while(rs.next())
           {
               int cid=rs.getInt("CID");
               String name=rs.getString("NAME");
               String description=rs.getString("DESCRIPTION");
               Category c1=new Category(cid,name,description);
               a1.add(c1);
           }
       }catch(Exception e)
       {
           e.printStackTrace();
       }
       System.out.println(a1.size());
       return a1;
   }
   
   //get All the Posts
   public List<Posts> getAllPosts()
   {
      List<Posts> l1=new ArrayList<>();
      //Fetch All Posts 
      try
      {
          PreparedStatement ps1=this.con.prepareStatement("select * from posts order by PID desc");
          ResultSet rs=ps1.executeQuery();
          while(rs.next())
          {
              int pid=rs.getInt("PID");
              String pTitle=rs.getString("PTITLE");
              int cid=rs.getInt("CID");
              String pContent=rs.getString("PCONTENT");
              int userId=rs.getInt("USERID");
              Posts p1 =new Posts(pid, pTitle, pContent, cid, userId);
              l1.add(p1);
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
      
      return l1;
   }
   
   public List<Posts> getPostByCatId(int cid)
   {
       List<Posts> l1=new ArrayList<>();
       //Fetch All Posts by Id...
        try
      {
          PreparedStatement ps1=this.con.prepareStatement("select * from posts where CID=?");
          ps1.setInt(1,cid);
          ResultSet rs=ps1.executeQuery();
          while(rs.next())
          {
              int pid=rs.getInt("PID");
              String pTitle=rs.getString("PTITLE");
              String pContent=rs.getString("PCONTENT");
              int userId=rs.getInt("USERID");
              Posts p1 =new Posts(pid, pTitle, pContent, cid, userId);
              l1.add(p1);
          }
      }
      catch(Exception e)
      {
          e.printStackTrace();
      }
       return l1;
   }   
   
   public Posts getPostByPostId(int pid)
   {
       Posts p1=null;
       try
       {
               String query="select * from posts where PID=?";
               PreparedStatement ps1 =this.con.prepareStatement(query);
               ps1.setInt(1,pid);
               ResultSet rs1= ps1.executeQuery();
               if(rs1.next())
               {
                   
                 int ppid=rs1.getInt("PID");
                 String pTitle=rs1.getString("PTITLE");
                 int cid=rs1.getInt("CID");
                 String pContent=rs1.getString("PCONTENT");
                 int userId=rs1.getInt("USERID");
                 p1 =new Posts(ppid, pTitle, pContent, cid, userId);
                   
               }
       }
       catch(Exception e)
       {           
           e.printStackTrace();
       }
       
       return p1;
   }
     
}
