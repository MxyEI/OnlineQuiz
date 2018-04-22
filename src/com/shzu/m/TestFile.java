package com.shzu.m;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.DataInputStream;
import java.io.DataOutputStream;
import java.io.EOFException;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.sql.Connection;
import java.sql.*;
import java.sql.SQLException;



public class TestFile {
	public static String xmltou="<?xml version="+"1.0" +" encoding="+"UTF-8"+"?>";
	private static String dbURL="jdbc:mysql://localhost/quiz";
	private static String dbUser="root";
	private static String dbPassword="mxy";
	
	static final String dataFile="/Users/mac/Desktop/data.xml";  
	static DataOutputStream out = null;
	static DataInputStream in = null;
	public static void main(String[] args) throws IOException{
		
			//从数据库写入到xml文件
		try {
			out = new DataOutputStream(new BufferedOutputStream(new FileOutputStream(dataFile)));
			 Connection con=null;
				try{
					try {
						   Class.forName("com.mysql.jdbc.Driver");
						}
						catch(ClassNotFoundException ex) {
						   System.out.println("Error: unable to load driver class!");
						   System.exit(1);
						}			
				     con = DriverManager.getConnection(dbURL,dbUser,dbPassword);
				     Statement stmt=con.createStatement();
				     String sql="select * from sqlquiz";
						ResultSet rs=stmt.executeQuery(sql);
						while(rs.next()){
							out.writeUTF(xmltou);
						out.writeUTF(rs.getString(2));
				   }
						
						
				}
				  catch(SQLException sqe){ System.out.println("Error: While Creating connection to database");sqe.printStackTrace();}
			
			} finally {

			out.close();
		}
		try {
			int type, oil, loss;
			String name, other;
			in = new DataInputStream(new BufferedInputStream(new FileInputStream(dataFile)));
			
		} finally {

			in.close();
		}
		
		new TestFile();
	}
	
	
}
