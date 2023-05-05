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

import dao.SalaDAO;
import dao.TesisDAO;
import entity.Alumno;
import entity.Respuesta;
import entity.Tesis;
import fabricas.Fabrica;

@WebServlet("/registraTesis")
public class TesisServlet extends HttpServlet {

	private static final long serialVersionUID = 1L;
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
			
			String vtitulo = req.getParameter("titulo");
			String vtema = req.getParameter("tema");
			String valumno = req.getParameter("alumno");
			
			Alumno objAlumno = new Alumno();
			objAlumno.setIdAlumno(Integer.parseInt(valumno));

			Tesis objTesis = new Tesis();
			objTesis.setTitulo(vtitulo);
			objTesis.setTema(vtema);
			objTesis.setFechaCreacion(new Timestamp(System.currentTimeMillis()));
			objTesis.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
			objTesis.setEstado(1);
	
			objTesis.setAlumno(objAlumno);
			
			
			Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
			TesisDAO TesisDAO = fabrica.getTesisDAO();
		
			int insertados = TesisDAO.insertaTesis(objTesis);
			
			
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
