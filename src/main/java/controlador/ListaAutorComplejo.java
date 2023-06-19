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

import dao.AutorDAO;
import entity.Autor;
import fabricas.Fabrica;

@WebServlet("/listaAutorComplejo")
public class ListaAutorComplejo extends HttpServlet {
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
		
		//1. Traer todas las categorias de la base de datos
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		AutorDAO dao = fabrica.getAutorDAO();
	
		String vnombre = req.getParameter("nombre");
		String vapellidos = req.getParameter("apellido");
		String vfechaInicio = req.getParameter("fechaInicio");
		String vfechaFin = req.getParameter("fechaFin");
		String vtelefono = req.getParameter("telefono");
		String vestado = req.getParameter("estado");
		String vgrado = req.getParameter("grado");	
		
		//Si la fecha de inicio es vacía
		if(vfechaInicio.equals("")) {
			vfechaInicio = "1900-01-01";
		}
		
		//Si la fecha de fin es vacía
		if(vfechaFin.equals("")) {
			vfechaFin = "2900-12-31";
		}
		
		List<Autor> lista = dao.listaCompleja(vnombre + "%",
												vapellidos + "%",
												vtelefono,
												Integer.parseInt(vgrado),
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

