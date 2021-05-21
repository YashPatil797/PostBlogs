
package com.tech.blog.helper;
import java.sql.*;

public class ConnectionProvider {
    private static Connection con;
    public static Connection getConnection()
    {
        try
        {
            if(con==null)
            {
                Class.forName("oracle.jdbc.OracleDriver");
                con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:orcl","hr","hr");
            }            
        }
        catch(Exception e)
        {
            e.printStackTrace();
        }
        return con;
    }
}
