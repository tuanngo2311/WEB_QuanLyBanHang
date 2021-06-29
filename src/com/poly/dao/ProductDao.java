/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package com.poly.dao;

import com.poly.models.Category;
import com.poly.models.Product;
import com.poly.models.User;

import javafx.css.PseudoClass;
import sun.misc.Contended;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

/**
 *
 * @author Admin
 */
public class ProductDao extends ConnectDao {
	public ProductDao() {

	}

	public ArrayList<Product> fillAll() {
		ArrayList<Product> ds = new ArrayList<Product>();
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [products] ";
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id = dl.getInt(1);
				String name = dl.getString(2);
				int price = dl.getInt(3);
				String note = dl.getString(4);
				String image = dl.getString(5);
				int category_id = dl.getInt(6);

				Product product = new Product(id, name, price, note, image, category_id);
				ds.add(product);
			}
		} catch (Exception ex) {
			System.out.print("" + ex.toString());
		}
		return ds;
	}

	// Táº¡o hĂ m xoĂ¡ dá»¯ liá»‡u theo mĂ£
	// Tráº£ vá»� true náº¿u xoĂ¡ thĂ nh cĂ´ng
	public boolean deleteProduct(int id) {
		boolean result = false;
		try {
			String sql = "delete  from [products] where id=? ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setInt(1, id);
			if (ps.executeUpdate() > 0)
				;// náº¿u >0 thĂ¬ xĂ³a thĂ nh cĂ´ng
			result = true;
		} catch (Exception ex) {
			System.out.println("loi: " + ex.toString());
			ex.printStackTrace();
		}
		return result;

	}

	public boolean insertProduct(Product product) {
		boolean result = false;
		try {
			String sql = "insert into [products](name, price, note, image, category_id) values(?,?,?,?,?) ";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setInt(2, product.getPrice());
			ps.setString(3, product.getNote());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCategory_id());

			if (ps.executeUpdate() > 0)
				;
			result = true;

		} catch (Exception ex) {
			System.out.println("loi: " + ex.toString());
		}
		return result;
	}

	// Táº¡o hĂ m findById láº¥y id cáº¥n update
	// return vá»� product lĂ¢ Ä‘Æ°á»£c
	public Product findById(int id) {
		Product product = null;
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [products] where id='" + id + "'";
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id_product = Integer.parseInt(dl.getString(1));
				String name = dl.getString(2);
				int price = Integer.parseInt(dl.getString(3));
				String note = dl.getString(4);
				String image = dl.getString(5);
				int category_id = Integer.parseInt(dl.getString(6));
				product = new Product(id_product, name, price, note, image, category_id);
			}
		} catch (Exception ex) {
			System.out.print("loi..." + ex.toString());
			ex.printStackTrace();
		}
		return product;
	}

	public Product findByName(String name1) {
		Product product = null;
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [products] where [name]='" + name1 + "'";
			ResultSet dl = lenh.executeQuery(sql);

			while (dl.next()) {
				int id_product = Integer.parseInt(dl.getString(1));
				String name = dl.getString(2);
				int price = Integer.parseInt(dl.getString(3));
				String note = dl.getString(4);
				String image = dl.getString(5);
				int category_id = Integer.parseInt(dl.getString(6));
				product = new Product(id_product, name1, price, note, image, category_id);
			}
		} catch (Exception ex) {
			System.out.print("loi..." + ex.toString());
			ex.printStackTrace();
		}
		return product;
	}

	public boolean updateProduct(Product product) {
		boolean result = false;
		try {
			String sql = "UPDATE [Products] SET name = ?, price = ?, note = ?, image = ?, category_id = ? WHERE id = ?";
			PreparedStatement ps = conn.prepareStatement(sql);
			ps.setString(1, product.getName());
			ps.setInt(2, product.getPrice());
			ps.setString(3, product.getNote());
			ps.setString(4, product.getImage());
			ps.setInt(5, product.getCategory_id());
			ps.setInt(6, product.getId());
			if (ps.executeUpdate() > 0) {
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;

	}

	// show_product
	public String getCategoryByID(int id) {
		String name = "";
		try {
			Statement lenh = conn.createStatement();
			String sql = "select name from [categories] where id=" + id;

			ResultSet dl = lenh.executeQuery(sql);
			while (dl.next()) {
				name = dl.getString(1);
			}
		} catch (Exception ex) {
			System.out.print("" + ex.toString());
		}
		return name;
	}

	// update_product
	public ArrayList<Category> fillAllCategories() {
		ArrayList<Category> ds = new ArrayList<Category>();
		try {
			Statement lenh = conn.createStatement();
			String sql = "select * from [categories]";

			ResultSet dl = lenh.executeQuery(sql);
			while (dl.next()) {
				int id = dl.getInt(1);
				String name = dl.getString(2);
				String note = dl.getString(3);
				Category category = new Category(id, name, note);
				ds.add(category);
			}

		} catch (Exception ex) {
			System.out.print("loi.." + ex.toString());
			ex.printStackTrace();
		}
		return ds;
	}

	/// *Junit///

	public void insertNew() {
		Product pr = new Product();
		ProductDao prdao = new ProductDao();
		prdao.insertProduct(pr);

	}

	public void addNewProduct(String name, int price, String note, String image, int category_id) {
		System.out.println("test addNewProduct");
		Product pr = new Product();
		ProductDao prdao = new ProductDao();
		pr.setName(name);
		pr.setPrice(price);
		pr.setNote(note);
		pr.setImage(image);
		pr.setCategory_id(category_id);
		prdao.insertProduct(pr);
	}

	public void updateNewProduct(String name, int price, String note, String image, int category_id) {
		System.out.println("test addNewProduct");
		Product pr = new Product();
		ProductDao prdao = new ProductDao();
		pr.setName(name);
		pr.setPrice(price);
		pr.setNote(note);
		pr.setImage(image);
		pr.setCategory_id(category_id);
		prdao.updateProduct(pr);
	}
}
