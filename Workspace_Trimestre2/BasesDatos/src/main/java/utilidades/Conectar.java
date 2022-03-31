package utilidades;

import java.sql.DriverManager;
import java.sql.SQLException;
import com.mysql.jdbc.Connection;

public class Conectar {
	private Connection conexion = null;
	private String base;

	public Conectar(String base) {
		this.base = base;
		String usuario = "root";
		String password = "";
		String url = "jdbc:mysql://localhost/" + base;
		try {
			conexion = (Connection) DriverManager.getConnection(url, usuario, password);
			if (conexion != null) {
				System.out.println("Conectado");
			}
		} catch (SQLException e) {
			System.out.println("No se pudo conectar a la base de datos");
			e.printStackTrace();
		}
	}

	public Connection getConexion() {
		return conexion;
	}

	public void desconectar() throws SQLException {
		this.conexion.close();
	}
}
