package com.myCodeBook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.myCodeBook.entities.User;
import com.mysql.cj.protocol.Resultset;
import com.mysql.cj.xdevapi.Result;

public class UserDao {
	
	private Connection con;

	public UserDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean saveUser(User user) {
		
		boolean flag =false;
		try {
			String query =  "insert into user(name,email,password,gender,about) values(?,?,?,?,?) ";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getGender());
			ps.setString(5, user.getAbout());
			ps.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	
	public boolean removeUser(User user) {
		
		boolean flag =false;
		try {
			String query =  "delete from user where email = ?";
			PreparedStatement ps = this.con.prepareStatement(query);
			ps.setString(1, user.getEmail());
			ps.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}
	
	public User getUserByEmailAndPassword(String email, String password) {

		User user =  null;
		
		try {
			String query =  "select * from user where email = ? and password = ?";
			PreparedStatement ps  = this.con.prepareStatement(query);
			ps.setString(1, email);
		    ps.setString(2, password);	
		    ResultSet rs =  ps.executeQuery();
		    
		    if(rs.next()) {
		    	
		    	user  = new User();
		    	String name  =  rs.getString("name");
		    	user.setName(name);
		    	user.setId(rs.getInt("id"));
		    	user.setEmail(rs.getString("email"));
		    	user.setGender(rs.getString("gender"));
		    	user.setDateTime(rs.getTimestamp("rdate"));
		    	user.setAbout(rs.getString("about"));
		    	user.setProfile(rs.getString("profile"));
		    	user.setUserType(rs.getString("userType"));
		    	
		    }
		}
		catch(Exception e) {
			
		}
				
		
		return user;
	}

	
	public boolean updateUser(User user) {
		boolean flag = false;
		try {
			
			String query = "update user set name=? , email=? , password=? ,  about=? ,  profile=? where id=?";
			PreparedStatement ps  = con.prepareStatement(query);
			ps.setString(1, user.getName());
			ps.setString(2, user.getEmail());
			ps.setString(3, user.getPassword());
			ps.setString(4, user.getAbout());
			ps.setString(5,user.getProfile());
			ps.setInt(6, user.getId());
			ps.executeUpdate();
			flag=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}

	
	public User getUserByuserId(int userId) {
		
		User user  =  null;
		
		
		String q  =  "select * from user where id=?";
		
		try {
			PreparedStatement ps  =  this.con.prepareStatement(q);
			
			ps.setInt(1, userId);

			ResultSet rs =   ps.executeQuery();
			if(rs.next()) {
				
				user  = new User();
		    	String name  =  rs.getString("name");
		    	user.setName(name);
		    	user.setId(rs.getInt("id"));
		    	user.setEmail(rs.getString("email"));
		    	user.setGender(rs.getString("gender"));
		    	user.setDateTime(rs.getTimestamp("rdate"));
		    	user.setAbout(rs.getString("about"));
		    	user.setProfile(rs.getString("profile"));
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return user;
		
	}

	public int getTotalUsers() {
		
		String q   =  "SELECT id FROM user";
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
