package controlador;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Timestamp;
import java.util.List;
import java.util.logging.Logger;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.gson.Gson;

import dao.LibroDAO;
import entity.Categoria;
import entity.Libro;
import entity.Respuesta;
import fabricas.Fabrica;

@WebServlet("/crudLibro")
public class CrudLibroControlador extends HttpServlet{
	private static final long serialVersionUID = 1L;

	private static Logger log = Logger.getLogger(CrudLibroControlador.class.getName());

	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> service");
		String vmetodo = req.getParameter("metodo");
		switch (vmetodo) {
		case "lista":
			lista(req, resp);
			break;
		case "inserta":
			inserta(req, resp);
			break;
		case "actualiza":
			actualiza(req, resp);
			break;
		case "eLogica":
			eliminacionLogica(req, resp);
			break;
		case "eFisica":
			eliminacionFisica(req, resp);
			break;

		default:
			break;
		}
	}

	protected void lista(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> lista");
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO dao = fabrica.getLibroDAO();

		String filtro = req.getParameter("filtro");
		List<Libro> lista = dao.listaLibro(filtro + "%");

		Gson gson = new Gson();
		String json = gson.toJson(lista);

		resp.setContentType("application/json;charset=UTF-8");

		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void inserta(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> inserta");
		String titulo = req.getParameter("titulo");
		String anio = req.getParameter("anio");
		String serie = req.getParameter("serie");
		String categoria = req.getParameter("categoria");

		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(categoria));
		
		Libro objLibro = new Libro();
		objLibro.setTitulo(titulo);
		objLibro.setAnio(Integer.parseInt(anio));
		objLibro.setSerie(serie);
		objLibro.setCategoria(objCategoria);
		objLibro.setEstado(1);
		objLibro.setFechaRegistro(new Timestamp(System.currentTimeMillis()));
		
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO dao = fabrica.getLibroDAO();
	
		int insertados = dao.insertaLibro(objLibro);
		List<Libro> lista = dao.listaLibro("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Registro exitoso");
		}else {
			objRespuesta.setMensaje("Error en el registro");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void actualiza(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> actualiza");
		String idLibro = req.getParameter("idLibro");
		String titulo = req.getParameter("titulo");
		String anio = req.getParameter("anio");
		String serie = req.getParameter("serie");
		String categoria = req.getParameter("categoria");
		String estado = req.getParameter("estado");
		
		Categoria objCategoria = new Categoria();
		objCategoria.setIdCategoria(Integer.parseInt(categoria));
		
		Libro objLibro = new Libro();
		objLibro.setIdLibro(Integer.parseInt(idLibro));
		objLibro.setTitulo(titulo);
		objLibro.setAnio(Integer.parseInt(anio));
		objLibro.setSerie(serie);
		objLibro.setEstado(Integer.parseInt(estado));
		objLibro.setCategoria(objCategoria);
		
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO dao = fabrica.getLibroDAO();
	
		int insertados = dao.actualizaLibro(objLibro);
		List<Libro> lista = dao.listaLibro("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (insertados > 0) {
			objRespuesta.setMensaje("Actualización exitosa");
		}else {
			objRespuesta.setMensaje("Error al actualizar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		
		resp.setContentType("application/json;charset=UTF-8");
		
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void eliminacionLogica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> eliminacionLogica");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO dao = fabrica.getLibroDAO();
	
		String idLibro = req.getParameter("idLibro");
		
		Libro objLibro = dao.buscaLibro(Integer.parseInt(idLibro));
		int estadoNuevo = objLibro.getEstado() == 0 ? 1 : 0;
		objLibro.setEstado(estadoNuevo);
		
		dao.actualizaLibro(objLibro);
		List<Libro> lista = dao.listaLibro("%");
		
		Respuesta objRespuesta = new Respuesta();
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

	protected void eliminacionFisica(HttpServletRequest req, HttpServletResponse resp)
			throws ServletException, IOException {

		log.info(">> CrudLibroServlet >> eliminacionFisica");
		Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
		LibroDAO dao = fabrica.getLibroDAO();
	
		String idLibro = req.getParameter("idLibro");
		
		int eliminados = dao.eliminaLibro(Integer.parseInt(idLibro));
		List<Libro> lista = dao.listaLibro("%");
		
		Respuesta objRespuesta = new Respuesta();
		if (eliminados > 0) {
			objRespuesta.setMensaje("Eliminación exitosa");
		}else {
			objRespuesta.setMensaje("Error al eliminar");
		}
		objRespuesta.setDatos(lista);
		
		Gson gson = new Gson();
		String json = gson.toJson(objRespuesta);
		resp.setContentType("application/json;charset=UTF-8");
		PrintWriter out = resp.getWriter();
		out.println(json);
	}

}
