package com.myCodeBook.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.List;

import com.myCodeBook.entities.Category;
import com.myCodeBook.entities.Post;

public class PostDao {

	Connection con;

	public PostDao(Connection con) {
		super();
		this.con = con;
	}
	
	
	public ArrayList<Category> getAllCategories(){
		
		ArrayList<Category> list  = new ArrayList<Category>();
		
		
		try {
		
			String query =  "select * from Categories";
			Statement s =  this.con.createStatement();
			ResultSet rs  =  s.executeQuery(query);
			while(rs.next()) {
				int cid =  rs.getInt("cid");
				String name =  rs.getString("name");
				String description = rs.getString("description");
				Category cat =  new Category(cid,name,description);
				list.add(cat);
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	
	public boolean savePost(Post p) {
		boolean flag = false;
		
		try {
			
			String q  =  "insert into posts(pTitle,pContent,pCode,pPic,catId,userId) values (?,?,?,?,?,?)";
			PreparedStatement ps = con.prepareStatement(q);
			ps.setString(1, p.getpTitle());
			ps.setString(2, p.getpContent());
			ps.setString(3, p.getpCode());
			System.out.println("picc _>" + p.getpPic());
			ps.setString(4, p.getpPic());
			ps.setInt(5, p.getCatId());
			ps.setInt(6, p.getUserId());
			ps.executeUpdate();
			flag=true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		return flag;
	}


	public List<Post> getAllPost(){
		
		List<Post> list  =  new ArrayList<>();
		  
		try {
			
			PreparedStatement ps  =  con.prepareStatement("select * from posts order by pId desc");
		    ResultSet set  = ps.executeQuery();
		    while(set.next()) {
		    	int pId =  set.getInt("pId");
		    	String pTitle  =  set.getString("pTitle");
		    	String pContent =  set.getString("pContent");
		    	String pCode =  set.getString("pCode");
		    	String pPic =  set.getString("pPic");
		    	Timestamp pDate = set.getTimestamp("pDate");
		    	int catId = set.getInt("catId");
		    	int userId = set.getInt("userId");
		    	Post post  = new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId);
		    	list.add(post);
		    }
			
			
		}catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return list;
		
	}
	
	
	public List<Post> getPostByCatId(int catId){
		List<Post> list  =  new ArrayList<>();
		
try {
			
	PreparedStatement ps  =  con.prepareStatement("select * from posts where catId=?");
	ps.setInt(1,catId);
    ResultSet set  = ps.executeQuery();
    while(set.next()) {
    	int pId =  set.getInt("pId");
    	String pTitle  =  set.getString("pTitle");
    	String pContent =  set.getString("pContent");
    	String pCode =  set.getString("pCode");
    	String pPic =  set.getString("pPic");
    	Timestamp pDate = set.getTimestamp("pDate");
    	int userId = set.getInt("userId");
    	Post post  = new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId);
    	list.add(post);
		}
	}
        catch(Exception e) {
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public Post getPostByPostId(int postId) {
		
		String query =  "select * from posts where pId=?";
		
		Post p =null;
		try {
			
			
			PreparedStatement ps = this.con.prepareStatement(query);
			 ps.setInt(1, postId);
			ResultSet set =  ps.executeQuery();
			if(set.next()) {
				
				int pId =  set.getInt("pId");
		    	String pTitle  =  set.getString("pTitle");
		    	String pContent =  set.getString("pContent");
		    	String pCode =  set.getString("pCode");
		    	String pPic =  set.getString("pPic");
		    	Timestamp pDate = set.getTimestamp("pDate");
		    	int catId = set.getInt("catId");
		    	int userId = set.getInt("userId");
		    	 p  = new Post(pId,pTitle,pContent,pCode,pPic,pDate,catId,userId);
			}
			
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return p;
	}
	
	
public int getTotalBlogs() {
		
		String q   =  "SELECT pId FROM posts";
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
	


