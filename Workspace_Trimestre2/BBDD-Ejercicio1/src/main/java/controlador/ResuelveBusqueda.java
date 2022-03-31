package controlador;

import java.io.IOException;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.sql.Connection;

import modelo.Especialidad;
import utilidades.ConectarViejaFormula;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/ResuelveBusqueda")
public class ResuelveBusqueda extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private int horas;

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String hs = request.getParameter("horas");
		String lvl = "";
		if (request.getParameter("rad") != null) {
			lvl = request.getParameter("rad");
		} 
		

		try {
			horas = Integer.parseInt(hs);
		} catch (Exception e) {
			System.out.println();
		}
		ConectarViejaFormula c = new ConectarViejaFormula("instituto");
		String query;
		Connection conexion = c.getConexion();
		try {
			if (hs.trim().isEmpty() && lvl.trim().isEmpty()) {
				query = "select * from especialidades";
			} else {
				if (hs.trim().isEmpty() && !lvl.trim().isEmpty()) {
					query = "SELECT * FROM `especialidades` WHERE nivel like \"" + lvl + "\"";
				} else if (!hs.trim().isEmpty() && lvl.trim().isEmpty()) {
					query = "select * from especialidades where horas >=" + horas + " order by horas desc";
				} else query = "select * from especialidades where horas >=" + horas + " and nivel like \"" + lvl + "\"";
			}
			 
			addInfoBBDD(request, response, c, conexion, query);
		} catch (Exception e) {
			System.out.println(e.getMessage());
			request.setAttribute("error", "Error en los datos");
			request.getRequestDispatcher("index.jsp").forward(request, response);
		}
		// Empezamos conexion
		// ConectarViejaFormula c = new ConectarViejaFormula("instituto");
		// Connection conexion = c.getConexion();
	}

	private void addInfoBBDD(HttpServletRequest request, HttpServletResponse response, ConectarViejaFormula c, 
			Connection conexion, String query) throws ServletException, IOException {
		
		ArrayList<Especialidad> listaR = new ArrayList<Especialidad>();
		try {
			Statement s = conexion.createStatement();
			ResultSet rs = s.executeQuery(query);
			while (rs.next()) {

				int ident = rs.getInt(1);
				String nb = rs.getString(2);
				int h = rs.getInt(3);
				String nv = rs.getString(4);

				Especialidad esp = new Especialidad(ident, nb, h, nv);
				listaR.add(esp);
			}
			c.desconectar();
			request.setAttribute("lista", listaR);
			request.getRequestDispatcher("vista1.jsp").forward(request, response);
		} catch (SQLException ex) {
			System.out.println(ex.getMessage());
		}
	}
}
