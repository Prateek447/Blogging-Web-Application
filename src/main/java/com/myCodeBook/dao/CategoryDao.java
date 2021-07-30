package com.myCodeBook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.myCodeBook.entities.Category;

public class CategoryDao {
	
	private Connection con;

	public CategoryDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean addCategory(Category cat) {
		boolean flag =false;
		try {
			String query =  "insert into categories(name,description) values(?,?) ";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setString(1, cat.getName());
			ps.setString(2, cat.getDescription());
			ps.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
	public boolean removeCategory(Category cat) {
		boolean flag =false;
		try {
			String query =  "delete from categories where name = ?";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setString(1, cat.getName());
			ps.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
		
	}
	
public int getTotalCategories() {
		
		String q   =  "SELECT cid FROM categories";
		int u = 0;
		try {
			PreparedStatement ps =  this.con.prepareStatement(q);
			ResultSet rs =  ps.executeQuery();
			while(rs.next()) {
				u++;
			}
		}catch(Exception e) {
			e.printStackTrace();
		}
		return u;
	}


}
