package DBPKG;

import java.sql.*;
/*import java.sql.Connection;
import java.sql.DriverManager;*/

public class JDBConnection {
	
	public static Connection getConnection() throws Exception {
		Class.forName("oracle.jdbc.OracleDriver");
		Connection con = DriverManager.getConnection("jdbc:oracle:thin:@//localhost:1521/xe", "system", "1234");
		return con;
		
		
	}
	
}
