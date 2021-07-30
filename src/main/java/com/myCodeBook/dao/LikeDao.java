package com.myCodeBook.dao;

import java.sql.*;

public class LikeDao {
	
	Connection con;

	public LikeDao(Connection con) {
		super();
		this.con = con;
	}
	
	public boolean insertLike(int uId, int pId) {
		boolean flag = false;
		try {
			String q  =  "insert into likes (uId,pId)values(?,?)";
			PreparedStatement ps  = this.con.prepareStatement(q);
			ps.setInt(1, uId);
			ps.setInt(2, pId);
			ps.executeUpdate();
			flag=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}
	
	public int countLikeOnPost(int pId) {
		
		int count = 0;
		
		String q   =  "select count(*) from likes where pId=?";
		
		try {
			PreparedStatement ps = this.con.prepareStatement(q);
			ps.setInt(1, pId);
			ResultSet rs =  ps.executeQuery();
			
			if(rs.next()) {
				count =  rs.getInt(1);
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return count;
		
	}
	
	public boolean isLikeByUser(int uId, int pId) {
		
		boolean flag  = false;
		
		
		try {
			
			PreparedStatement ps  =  this.con.prepareStatement("select * from likes where uId = ? and pId = ?");
			ps.setInt(1, uId);
			ps.setInt(2, pId);
			ResultSet rs  =  ps.executeQuery();
			if(rs.next()) {
				flag=true;
			}
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		return false;
		
		
	}

	
	public boolean deleteLike(int uId, int pId) {
		
		boolean flag =  false;
		
		try {
			PreparedStatement ps  =  this.con.prepareStatement("delete from likes where uId=? and pId=?");
			ps.setInt(1, uId);
			ps.setInt(2, pId);
			ps.executeUpdate();
			flag=true;
			
		} catch (Exception e) {
			
			e.printStackTrace();
		}
		return flag;
		
	}
}
