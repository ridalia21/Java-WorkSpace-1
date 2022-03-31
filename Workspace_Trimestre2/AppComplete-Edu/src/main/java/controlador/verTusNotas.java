package controlador;

import java.io.IOException;
import java.sql.SQLException;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import modelo.*;

@WebServlet("/verTusNotas")
public class verTusNotas extends HttpServlet {
	
	private static final long serialVersionUID = 1L;

	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String dni = null;
		HttpSession sesion = (HttpSession) request.getSession();
		DAO daoUniv = new DAO("alumnos");
		String mensaje = "";
		if (sesion != null) {
			Usuario u = (Usuario) sesion.getAttribute("usuario");
			dni = u.getDni();

			try {
				Universitario useUni = daoUniv.buscar(dni);
				if (useUni == null) {
					mensaje = "Tu todavía no tienes notas";
					request.setAttribute("error", mensaje);
					request.getRequestDispatcher("entrada.jsp").forward(request, response);
				} else {
					request.setAttribute("uniNota", useUni);
					request.getRequestDispatcher("ver.jsp").forward(request, response);
				}
			} catch (SQLException e) {
				System.out.println(e.getMessage());
			}
		}
	}

}
