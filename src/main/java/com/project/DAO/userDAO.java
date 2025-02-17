package com.project.DAO;
import java.sql.*;


import com.project.DAO.helper.connectionProvider;
import com.project.servlets.User;

public class userDAO {

	private Connection con;
	public userDAO(Connection con) {
		this.con=con;
		
	}
	public boolean saveUser(User user) {
		boolean f=false;
		try {
			
		String q="insert into users_registration(name,email,password,gender)values(?,?,?,?)";
		PreparedStatement pstmt=this.con.prepareStatement(q);
		pstmt.setString(1,user.getName());
		pstmt.setString(2,user.getEmail());
		pstmt.setString(3,user.getPassword());
		pstmt.setString(4,user.getGender());
		
		pstmt.executeUpdate();	
		f=true;
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		return f;
	}
	//get user by email and password 
	public User  getEmailPassword(String email, String password)
	
	{
		
		User user=null;
		try
		{
			String q="select * from users_registration where email=? and password=?";
			PreparedStatement psmt=con.prepareStatement(q);
			psmt.setString(1,email);
			psmt.setString(2,password);
			ResultSet set=psmt.executeQuery();
			if(set.next());
			{
				user=new User();
			String name=set.getString("name");
			user.setName(name);
			user.setId(set.getInt("id"));
			user.setEmail(set.getString("email"));
			user.setPassword(set.getString("password"));
			user.setGender(set.getString("gender"));
			user.setRegistration_date(set.getTimestamp("registration_date"));
			user.setProfile(set.getString("profile"));
			
			
			}
			
			
		}	
		catch(Exception e)
		
		{
			e.printStackTrace();
			
		}
		return user;
		
		
	}
	
	public boolean updateUser(User user) {
	    boolean updated = false;
	    try {
	        String query = "UPDATE users_registration SET name=?, email=?, password=?, profile=? WHERE id=?";
	        PreparedStatement pstmt = con.prepareStatement(query);
	        pstmt.setString(1, user.getName());
	        pstmt.setString(2, user.getEmail());
	        pstmt.setString(3, user.getPassword());
	        pstmt.setString(4, user.getProfile());
	        pstmt.setInt(5, user.getId());

	        int rowsAffected = pstmt.executeUpdate();
	        if (rowsAffected > 0) {
	            updated = true;
	        }
	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	    return updated;
	}


    public User getUserByUserId(int userId) {
        User user = null;
        try {
            String q = "select * from users_registration where id=?";
            PreparedStatement ps = this.con.prepareStatement(q);
            ps.setInt(1, userId);
            ResultSet set = ps.executeQuery();
            if (set.next()) {
                user = new User();

//             data from db
                String name = set.getString("name");
//             set to user object
                user.setName(name);

                user.setId(set.getInt("id"));
                user.setEmail(set.getString("email"));
                user.setPassword(set.getString("password"));
                user.setGender(set.getString("gender"));              
                user.setRegistration_date(set.getTimestamp("registration_date"));
                user.setProfile(set.getString("profile"));
            }
        } catch (Exception e) {
            e.printStackTrace();
        }

        return user;
    }



	
}
