package conexaoJDBC;

import java.sql.Connection;
import java.sql.DriverManager;

public class SingleConnection {

	private static String url = "jdbc:mysql://localhost:3306/aprendendojsp?useTimezone=true&serverTimezone=UTC";
	private static String user = "root";
	private static String password = "admin";	
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
				//Class.forName("com.mysql.jdbc.Driver");
				Class.forName("com.mysql.cj.jdbc.Driver");
				connection = DriverManager.getConnection(url, user, password);
				connection.setAutoCommit(false);
				System.out.println("CONECTOU COM SUCESSO");

			}

		} catch (Exception e) {
			System.out.println("ERRO, NAO CONECTOU!!");
			e.printStackTrace();
			System.out.println("ERRO, NAO CONECTOU!!");

		}
	}

	public static Connection getConnecion() {

		return connection;

	}

}
