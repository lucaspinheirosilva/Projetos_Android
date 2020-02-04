package conexaoJDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {

	private static String url = "jdbc:mysql://localhost:3306/aprendendojsp?autoReconnect=true&useSSL=false&useTimezone=true&amp;serverTimezone=UTC​​";
	private static String password = "admin";
	private static String user = "root";
	private static Connection connection = null;

	static {
		conectar();
	}

	public SingleConnection() {
		conectar();
	}

	private static void conectar() {
		try {

			if (connection == null) {
				Class.forName("com.mysql.jdbc.Driver");
				connection = DriverManager.getConnection(url, user, password);
				connection.setAutoCommit(false);

			}

		} catch (Exception e) {
			e.printStackTrace();

		}
	}

	public static Connection getConnecion() {

		return connection;

	}

}
