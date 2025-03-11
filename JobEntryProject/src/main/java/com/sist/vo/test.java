package com.sist.vo;
import java.sql.*;

public class test {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String driver="oracle.jdbc.driver.OracleDriver";
		String url="jdbc:oracle:thin:@211.238.142.124:1521:XE";
		String id="hr_3";
		String pw="happy";

		try
		{
			Class.forName(driver);
			Connection conn=DriverManager.getConnection(url,id,pw);
			
			String sql="SELECT * FROM JOB";
			PreparedStatement ps=conn.prepareStatement(sql);
			
			ResultSet rs=ps.executeQuery();
			
			while(rs.next()) {
				int jno=rs.getInt("jno");
				String name=rs.getString("name");
				int jno2=rs.getInt("jno2");
				System.out.println(jno+"/"+name+"/"+jno2);
			}
			conn.close();
		}catch (Exception ex) {
			// TODO: handle exception
			ex.printStackTrace();
		}
	}

}
