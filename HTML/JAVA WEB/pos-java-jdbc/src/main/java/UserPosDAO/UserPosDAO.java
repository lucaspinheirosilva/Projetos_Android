package UserPosDAO;

import java.sql.Connection;

import conexaoJDBC.SingleConnection;

public class UserPosDAO {

	private Connection connection;

	public UserPosDAO() {
		connection = SingleConnection.getConnecion();

	}

}
