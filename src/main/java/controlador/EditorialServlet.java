package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.EditorialDAO;
import entity.Editorial;
import entity.Pais;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/registraEditorial")
public class EditorialServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vrazonSocial = req.getParameter("razonSocial");
			String vdireccion = req.getParameter("direccion");
			String vruc = req.getParameter("ruc");
			String vpais = req.getParameter("pais");
			
			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));

			Editorial objEditorial = new Editorial();
			objEditorial.setRazonSocial(vrazonSocial);
			objEditorial.setDireccion(vdireccion);
			objEditorial.setRuc(vruc);
			objEditorial.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
			objEditorial.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			
			objEditorial.setEstado(1);
			objEditorial.setPais(objPais);
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			EditorialDAO EditorialDAO = fabrica.getEditorialDAO();
		
			int insertados = EditorialDAO.insertaEditorial(objEditorial);
			
			
			Respuesta objRespuesta = new Respuesta();
			if (insertados > 0) {
				objRespuesta.setMensaje("Registro exitoso");
			}else {
				objRespuesta.setMensaje("Error en el registro");
			}
			
			Gson gson = new Gson();
			String json = gson.toJson(objRespuesta);
			
			resp.setContentType("application/json;charset=UTF-8");
			
			PrintWriter out = resp.getWriter();
			out.println(json);
	}
}
