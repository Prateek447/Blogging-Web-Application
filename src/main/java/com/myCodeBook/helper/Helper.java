package com.myCodeBook.helper;

import java.io.File;
import java.io.FileOutputStream;
import java.io.InputStream;

public class Helper {
	
	public static boolean deleteFile(String path) {
		boolean flag= false;
		
		try {
			
			File file = new File(path);
			flag = file.delete();
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return flag;
	}

	
	public static boolean saveFile(InputStream is, String path) {
		
		boolean flag  = false;
		
		try {
			
			byte b[] =  new byte[is.available()];
			is.read(b);
			
			FileOutputStream fo  = new FileOutputStream(path);
			
			fo.write(b);
			System.out.println("File Save Successfully");
			fo.flush();
			fo.close();
			flag = true;
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
		
		return flag;
	}
}
