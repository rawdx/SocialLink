package database;

public class Claves {
	
	private static String url = "jdbc:mysql://34.125.241.9/SLDB";
	private static String user = "sladmin";
    private static String password = "32rnw9Skfj.";
    private static String claveSql = "14564rec";
    
    public static String getUrl() {
		return url;
	}

	public static String getUser() {
		return user;
	}

	public static String getPassword() {
		return password;
	}

	public static String getClaveSql() {
		return claveSql;
	}
}
