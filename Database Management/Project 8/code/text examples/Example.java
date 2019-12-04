import java.sql.*;

/* Example.java

CSCI 403 example Java program

Author: C. Painter-Wakefield
Modified: 11/13/2019

This program does a couple of SELECT queries against tables in public, then
creates a table and attempts some modification queries on it.  Examples are
given of prepared queries using parameters, exception handling, and 
very basic input/output.

This is *not* an example of good Java database programming - just one big
function showing the different tools available to you.
*/

public class Example {
	public static void main(String[] args) throws ClassNotFoundException {
		Class.forName("org.postgresql.Driver");
		String connectString = "jdbc:postgresql://bartik.mines.edu/csci403";
		System.out.print("Username: ");
		String username = System.console().readLine();
		System.out.print("Password: ");
		String password = new String(System.console().readPassword());
		Connection db;

		try {
			db = DriverManager.getConnection(connectString, username, password);
		}
		catch (SQLException e) {
			System.out.println("Error connecting to database: " + e);
			return;
		}
		
		// uncomment next block to turn off autoCommit - it will then be necessary to 
		// add in db.commit() calls to apply changes to the database
/*
		try {
			db.setAutoCommit(false);
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
			return;
		}
*/
		// immediate SELECT
		String query1 = 
				"SELECT course_id, section, title, enrollment"
				+ " FROM mines_courses"
				+ " WHERE instructor = 'Painter-Wakefield, Christopher'";
		try {
			Statement stmt = db.createStatement();
			ResultSet results = stmt.executeQuery(query1);
			while (results.next()) {
				String courseId = results.getString("course_id");
				String section = results.getString("section");
				String title = results.getString("title");
				int enrollment = results.getInt("enrollment");
			
				System.out.println(courseId + " " + section + "\t" + enrollment + " " + title);
			}
			System.out.println();
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}

		
		// prepared SELECT
		String query2 =
				"SELECT course_id, section, title, enrollment"
				+ " FROM mines_courses"
				+ " WHERE instructor = ?";
		
		try {
			PreparedStatement ps = db.prepareStatement(query2);
		
			System.out.print("Please enter an instructor (lastname, firstname): ");
			String instr = System.console().readLine();
			ps.setString(1, instr);
			ResultSet results = ps.executeQuery();
			while (results.next()) {
				String courseId = results.getString("course_id");
				String section = results.getString("section");
				String title = results.getString("title");
				int enrollment = results.getInt("enrollment");
				
				System.out.println(courseId + " " + section + "\t" + enrollment + " " + title);
			}
			System.out.println();
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}

		// DDL query - note we use .execute() instead of .executeQuery()
                String ddlQuery = "CREATE TABLE foo (x text PRIMARY KEY)";
		try {
			Statement stmt = db.createStatement();
			stmt.execute(ddlQuery);
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}
			

		// some modification queries - note the different method used, "executeUpdate()",
		// which returns an int (# of rows affected) rather than a ResultSet
		String query3 = "INSERT INTO foo VALUES (?)";
		
		try {
			PreparedStatement ps = db.prepareStatement(query3);
			ps.setString(1, "testing 1 2 3");
			int rows = ps.executeUpdate();
			System.out.println("Rows inserted: " + rows);
			//db.commit();	// needed when autoCommit is set to false
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}

		// this time should cause an integrity constraint violation
		try {
			PreparedStatement ps = db.prepareStatement(query3);
			ps.setString(1, "testing 1 2 3");
			int rows = ps.executeUpdate();
			System.out.println("Rows inserted: " + rows);
			//db.commit();	// needed when autoCommit is set to false
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}

		// bad SELECT query with exception handling
		String query4 = "SELECT FROM foo WHERE blah = arg";
		try {
			Statement stmt = db.createStatement();
			ResultSet results = stmt.executeQuery(query4);
		}
		catch (SQLException e) {
			System.out.println("Database error: " + e);
		}
	}

}
