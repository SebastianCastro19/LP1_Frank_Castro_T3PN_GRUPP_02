package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.AlumnoDAO;
import entity.Alumno;
import fabricas.Fabrica;

@WebServlet("/listaAlumnoComplejo")
public class ListaAlumnoComplejo extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. Traer todas las categorias de la base de datos
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AlumnoDAO dao = fabrica.getAlumnoDAO();
	
		String vnombre = req.getParameter("nombres");
		String vapellido = req.getParameter("apellidos");
		String vtelefono = req.getParameter("telefono");
		String vdni = req.getParameter("dni");
		String vcorreo = req.getParameter("correo");
		String vpais = req.getParameter("pais");	
		String vestado = req.getParameter("estado");
		String vfechaInicio = req.getParameter("fechaInicio");
		String vfechaFin = req.getParameter("fechaFin");
		
		//Si la fecha de Inicio es vacio
		if (vfechaInicio.equals("")) { vfechaInicio = "1900-01-01"; }
		
		//Si la fecha de Fin es vacio
		if (vfechaFin.equals("")) { vfechaFin = "2999-12-31"; }
		
		
		List<Alumno> lista = dao.listaCompleja(vnombre + "%",
												vapellido + "%",
												vtelefono,
												vdni,
												vcorreo,
												Integer.parseInt(vpais),
												Integer.parseInt(vestado),
												Date.valueOf(vfechaInicio),
												Date.valueOf(vfechaFin));	
		
		//2. Convertir las categorías en formato JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		//3. Notificar al cliente el tipo de archivo
		resp.setContentType("application/json;charset=UTF-8");
		
		//4. Enviar la respuesta al cliente
		PrintWriter out = resp.getWriter();
		out.println(json);
	}
}

