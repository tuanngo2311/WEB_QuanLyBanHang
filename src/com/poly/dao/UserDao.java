/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import javax.management.Query;

import com.poly.models.User;

/**
 *
 * @author Admin
 */
public class UserDao extends ConnectDao {
	public UserDao() {

	}

	public ArrayList<User> fillAll() {
		ArrayList<User> ds = new ArrayList<User>();
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [user] ";// user
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id = dl.getInt(1);
				String username = dl.getString(2);
				String password = dl.getString(3);
				String fullname = dl.getString(4);
				String email = dl.getString(5);
				String phone = dl.getString(6);
				int role = dl.getInt(7);
				User user = new User(id, username, password, fullname, email, phone, role);// tạo user mới
				ds.add(user);// add dô ArrayList (cho user vừa tạo ra)
			}
		} catch (Exception ex) {
			System.out.print("" + ex.toString());
		}
		return ds;
	}

	public boolean deleteUser(int id) {

		boolean result = false;
		try {
			String sql = "delete from [user] where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0)
				;// nếu >0 thì xóa thành công
			result = true;
		} catch (Exception ex) {
			System.out.println("loi: " + ex.toString());
			ex.printStackTrace();
		}
		return result;
	}

	public boolean insertUser(User user) {
		boolean result = false;
		try {
			String sql = "insert into [user] (username, password, fullname, email, phone, role) values(?,?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullname());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.setInt(6, user.getRole());
			if (ps.executeUpdate() > 0)
				;// thực thi và về thành công
			result = true;

		} catch (Exception ex) {
			System.out.println("loi: " + ex.toString());
		}
		return result;
	}

	public User findById(int id) {
		User user = null;
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [user] where id=" + id;
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id_user = dl.getInt(1);// id_user cũng chính là nó(id cũ)
				String username = dl.getString(2);
				String password = dl.getString(3);
				String fullname = dl.getString(4);
				String email = dl.getString(5);
				String phone = dl.getString(6);
				int role = dl.getInt(7);
				user = new User(id_user, username, password, fullname, email, phone, role);
			}
		} catch (Exception ex) {
			System.out.print("loi..." + ex.toString());
		}
		return user;
	}

	public boolean updateUser(User user) {
		boolean result = false;
		try {
			String sql = "update [user] set username=?, password=?, fullname=?, email=?, phone=?, role=? where id=?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, user.getUsername());
			ps.setString(2, user.getPassword());
			ps.setString(3, user.getFullname());
			ps.setString(4, user.getEmail());
			ps.setString(5, user.getPhone());
			ps.setInt(6, user.getRole());
			ps.setInt(7, user.getId());
			if (ps.executeUpdate() > 0)
				;
			result = true;

		} catch (Exception ex) {
			System.out.println("loi: " + ex.toString());
		}

		return result;
	}

	// tại sao ko trả về true, false để kiểm tra?
	// t1:trả về user đó luôn, nếu user đó tồn tại trả về user đó, còn nếu user đó
	// ko tồn tại thì trả về null
	// nếu có use đó set có khac null ko, khác null thì có user đó, còn == null thì
	// sai
	// t2:tôi có user đó tôi trả về user đó rồi, lấy user đó cho lên sessson để xài
	// lại, lưu sessson để lấy ra check lại
	//
	public User checkLogin(String u, String p) {

		User user = null;
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [user] where username ='" + u + "' and password = '" + p + "'  ";
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id_user = dl.getInt(1);// id_user cũng chính là nó(id cũ)
				String username = dl.getString(2);
				String password = dl.getString(3);
				String fullname = dl.getString(4);
				String email = dl.getString(5);
				String phone = dl.getString(6);
				int role = dl.getInt(7);
				user = new User(id_user, username, password, fullname, email, phone, role);
			}
		} catch (Exception ex) {
			System.out.print("loi..." + ex.toString());
		}
		return user;
	}



	/// *Junit///
	public User findByName(String user) {
		User user2 = null;
		try {
			Statement lenh = conn.createStatement();

			String sql = "select * from [user] where [username] = '" + user + "'";

			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id_user = dl.getInt(1);// id_user cũng chính là nó(id cũ)
				String username = dl.getString(2);
				String password = dl.getString(3);
				String fullname = dl.getString(4);
				String email = dl.getString(5);
				String phone = dl.getString(6);
				int role = dl.getInt(7);
				user2 = new User(id_user, username, password, fullname, email, phone, role);
			}
		} catch (Exception ex) {
			System.out.print("loi..." + ex.toString());
		}
		return user2;
	}

	public static boolean checkkLogin(String user, String pass) {
        List<User> list = null;
//        Session session = HibernateUtil.getSessionFactory().getCurrentSession();
        try {
        	Connection conn;
    		Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            conn = DriverManager.getConnection("jdbc:sqlserver://localhost:1433;databaseName=demoASMJV4;user=sa;password=songlong");
            Statement stmt = conn.createStatement();
            ResultSet dl = stmt.executeQuery("select * from [user] where username ='" + user + "' and password = '" + pass + "'  ");
            
            while (dl.next()) {
				int id_user = dl.getInt(1);// id_user cũng chính là nó(id cũ)
				String username = dl.getString(2);
				String password = dl.getString(3);
				String fullname = dl.getString(4);
				String email = dl.getString(5);
				String phone = dl.getString(6);
				int role = dl.getInt(7);
//				user = new User(id_user, username, password, fullname, email, phone, role);
				return true;
			}
            conn.close();
        } catch (Exception e) {
            System.out.println(e);

        }
        return false;
    }

	public void insertNewUser(String username, String password, String fullname, String email, String phone, int role) {
		System.out.println("test addNewUser");
		User us = new User();
		UserDao usdao = new UserDao();
		us.setUsername(username);
		us.setPassword(password);
		us.setFullname(fullname);
		us.setEmail(email);
		us.setPhone(phone);
		us.setRole(role);
		usdao.insertUser(us);
	}

	public void updateNewUser(String username, String password, String fullname, String email, String phone, int role) {
		System.out.println("test addNewUser");
		User us = new User();
		UserDao usdao = new UserDao();
		us.setUsername(username);
		us.setPassword(password);
		us.setFullname(fullname);
		us.setEmail(email);
		us.setPhone(phone);
		us.setRole(role);
		usdao.updateUser(us);
	}

}
