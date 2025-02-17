package com.project.DAO.helper;
import java.sql.*;
import java.util.concurrent.ExecutionException;
public class connectionProvider {
	
	private static Connection con;
	public static Connection getConnection() {
		try
		{
			if(con==null) {
				Class.forName("com.mysql.cj.jdbc.Driver");
				con=DriverManager.getConnection( "jdbc:mysql://localhost:3306/hostpital?useSSL=false&serverTimezone=UTC","root","satyampawar24");
				
				
			}
			
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return con;
		
	}

}
