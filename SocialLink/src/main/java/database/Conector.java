package database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.ResultSetMetaData;
import java.sql.SQLException;
import java.sql.Statement;

public class Conector {

	private Connection cn;

	public void connect() throws SQLException {
		cn = DriverManager.getConnection("jdbc:mysql://34.125.241.9/SLDB", "sladmin", "32rnw9Skfj.");
	}

	public void connect(String url, String user, String password) throws SQLException {
		cn = DriverManager.getConnection(url, user, password);
	}

	public void disconnect() {
		try {
			if (cn != null)
				cn.close();
		} catch (SQLException e) {
			System.err.println("Error al desconectar de la base de datos: " + e.getMessage());
		}
	}
	
	public void execute(String statement) {
	    try (PreparedStatement pstmt = cn.prepareStatement(statement)) {
	        pstmt.executeUpdate();
	    } catch (SQLException e) {
	        System.err.println("Error en acceso a BD: " + e.getMessage());
	        System.err.println("La consulta ejecutada fue: " + statement);
	    }
	}
	
	public String[][] getData(String query) throws SQLException {
	    ResultSet rs = null;
	    String[][] result = null;

	    try {
	        Statement stmt = cn.createStatement(ResultSet.TYPE_SCROLL_SENSITIVE, ResultSet.CONCUR_READ_ONLY);
	        rs = stmt.executeQuery(query);

	        if (rs.next()) {
	            int rowCount = getRowCount(rs);
	            int columnCount = rs.getMetaData().getColumnCount();

	            result = new String[rowCount][columnCount];

	            populateResultArray(rs, result);
	        }
	    } catch (SQLException e) {
	        System.err.println("Error en la consulta: " + e.getMessage());
	    } finally {
	        if (rs != null) {
	            rs.close();
	        }
	    }

	    return result;
	}
	
	
	private int getRowCount(ResultSet rs) throws SQLException {
	    rs.last();
	    int rowCount = rs.getRow();
	    rs.beforeFirst();
	    return rowCount;
	}

	private void populateResultArray(ResultSet rs, String[][] result) throws SQLException {
	    ResultSetMetaData rsmd = rs.getMetaData();
	    int columnCount = rsmd.getColumnCount();
	    int row = 0;

	    while (rs.next()) {
	        for (int col = 0; col < columnCount; col++) {
	            String value = rs.getString(col + 1);
	            result[row][col] = (value != null) ? value : "";
	        }
	        row++;
	    }
	}

}
