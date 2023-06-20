package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ProveedorDAO;
import entity.Proveedor;
import fabricas.Fabrica;

@WebServlet("/listaProveedorComplejo")
public class ListaProveedorComplejoServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
	
		//1 Traer todas las paises de la base de datos
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		ProveedorDAO  dao = fabrica.getProveedorDAO();
	
		String vruc = req.getParameter("ruc");
		String vrazonsocial = req.getParameter("razonsocial");
		String vestado = req.getParameter("estado");
		String vpais = req.getParameter("pais");	

		
		List<Proveedor> lista = dao.listaProveedorComplejo(vrazonsocial + "%", vruc + "%",
				   Integer.parseInt(vestado), 
				   Integer.parseInt(vpais));	
		
		//2 Convertir las paises en formato JSON
		Gson gson = new Gson();
		String json = gson.toJson(lista);

		//3 Se notifica al chrome el tipo de archivo
		resp.setContentType("application/json;charset=UTF-8");
		
		//4 Se envía al chrome
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}