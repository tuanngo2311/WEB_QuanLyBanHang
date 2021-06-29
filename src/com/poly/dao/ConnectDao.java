/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;

/**
 *
 * @author Admin
 */
public class ConnectDao {
     Connection conn;

    public ConnectDao() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            
            conn =DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=demoASMJV4","sa","123");        

        } catch (Exception ex) {
            System.out.print("" + ex.toString());
//            ex.printStackTrace();
        }

    }
	
	
	
//    public static void main(String[] args) {
//    	try {
//    		Connection conn;
//    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
//            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=demoASMJV4;user=sa;password=songlong");
//            // crate statement
//             Statement stmt = conn.createStatement();
//            // get data from table 'student'
//             ResultSet rs = stmt.executeQuery("select * from [user] where username ='hoa' and password = 'hoa'  ");
//            // show data
//            while (rs.next()) {
//                System.out.println(rs.getObject(1) + "  " + rs.getObject(2) 
//                        + "  " + rs.getObject(3)+ "  " + rs.getObject(4)+ "  " + rs.getObject(5));
//            }
//            // close connection
//            conn.close();
//        } catch (Exception ex) {
//            ex.printStackTrace();
//        }
//
//	}
    
}
