package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Date;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.ProveedorDAO;
import entity.Proveedor;
import entity.Respuesta;
import entity.Tipo;
import fabricas.Fabrica;
import entity.Pais;

@WebServlet("/registraProveedor")
public class ProveedorServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vnombre = req.getParameter("nombre");
			String vdni = req.getParameter("dni");
			String vtipo = req.getParameter("tipo");
			String vrazonsocial = req.getParameter("razonsocial");
			String vruc = req.getParameter("ruc");
			String vdireccion = req.getParameter("direccion");
			String vpais = req.getParameter("pais");
			String vcelular = req.getParameter("celular");
			String vcontacto = req.getParameter("contacto");

			Tipo objTipo = new Tipo();
			objTipo.setIdTipo(Integer.parseInt(vtipo));
			Pais objPais = new Pais();
			objPais.setIdPais(Integer.parseInt(vpais));
			
			Proveedor objProveedor = new Proveedor();
			objProveedor.setNombre(vnombre);
			objProveedor.setDni(vdni);
			objProveedor.setFechaRegistro(new Date(System.currentTimeMillis()));
			objProveedor.setTipo(objTipo);
			objProveedor.setRazonsocial(vrazonsocial);
			objProveedor.setRuc(vruc);
			objProveedor.setDireccion(vdireccion);
			objProveedor.setPais(objPais);
			objProveedor.setCelular(vcelular);
			objProveedor.setContacto(vcontacto);
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			ProveedorDAO dao = fabrica.getProveedor();
		
			int insertados = dao.insertaProveedor(objProveedor);
			
			
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
