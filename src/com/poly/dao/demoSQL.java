package com.poly.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

public class demoSQL {
	 public static void main(String[] args) {
         try {
            String dbURL = "jdbc:sqlserver://localhost;databaseName=demoASMJV4;user=sa;password=123";
            Connection conn = DriverManager.getConnection(dbURL);
            // crate statement
             Statement stmt = conn.createStatement();
            // get data from table 'student'
             ResultSet rs = stmt.executeQuery("select * from [user]");
//             ResultSet rs = stmt.executeQuery("select * from [demoASMJV4].[dbo].[user]");
            // show data
            while (rs.next()) {
                System.out.println(rs.getObject(1) + "  " + rs.getObject(2) 
                        + "  " + rs.getObject(3)+ "  " + rs.getObject(4)+ "  " + rs.getObject(5));
            }
            // close connection
            conn.close();
        } catch (Exception ex) {
            ex.printStackTrace();
        }
     
     
     
     }

}
