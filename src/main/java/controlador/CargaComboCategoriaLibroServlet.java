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

import dao.CategoriaLibroDAO;
import entity.Categoria;
import fabricas.Fabrica;

@WebServlet("/cargaCategoria")
public class CargaComboCategoriaLibroServlet extends HttpServlet{

	private static final long serialVersionUID = 1L;
	
	@Override
	protected void service(HttpServletRequest req, HttpServletResponse resp) throws ServletException, IOException {
				Fabrica fabrica = Fabrica.getFabrica(Fabrica.MYSQL);
				CategoriaLibroDAO dao = fabrica.getCategoriaLibroDAO();
			
				List<Categoria> lista = dao.listaCategoria();
			
				Gson gson = new Gson();
				String json = gson.toJson(lista);

				resp.setContentType("application/json;charset=UTF-8");
				
				PrintWriter out = resp.getWriter();
				out.println(json);
	}

}
