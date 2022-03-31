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

@WebServlet("/acreditacion")
public class acreditacion extends HttpServlet {
	private static final long serialVersionUID = 1L;
	
	private String campo1;
	private String campo2;
  
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		campo1=request.getParameter("login");
		campo2=request.getParameter("clave");
		String mensaje="";
		DAO d= new DAO("alumnos");//pedimos una conexion a la base de datos
		
		try {
			Usuario u=d.buscar(campo1, campo2); //busca y devuelve el usuario completo
			if(u==null) {//no ha encontrado el usuario, no se ha acreditado, no estaba en la tabla
				mensaje="tu login o tu clave estan mal";
				request.setAttribute("mensaje", mensaje);
				request.getRequestDispatcher("index.jsp").forward(request, response); 
				//System.out.println("usuario null");
			}else {
				HttpSession sesion= (HttpSession) request.getSession();
				//sesion.setAttribute("login", u.getLogin());
				//sesion.setAttribute("tipo", u.getTipo());
				
				u.setClave(null); 
				/*
				 * Esta línea anterior pone la clave del objeto usuario creado para que al cambiar de página la
				 * clave no pueda ser rastreada
				 */
				sesion.setAttribute("usuario", u);
				request.getRequestDispatcher("entrada.jsp").forward(request, response);	
			}
		} catch (SQLException e) {
			mensaje=e.getMessage();
			request.setAttribute("mensaje", mensaje);
			request.getRequestDispatcher("index.jsp").forward(request, response); 
		
		}
	}

}
