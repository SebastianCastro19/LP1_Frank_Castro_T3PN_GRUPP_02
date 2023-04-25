package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;
import dao.LibroDAO;
import dao.PaisDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SalaDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.TipoDAO;
import dao.UsuarioDAO;
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlGradoDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlPaisDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MySqlUsuarioDAO;
import dao.impl.MySqlTipoDAO;

public class FabricaMysql extends Fabrica {
<<<<<<< HEAD

	
=======
>>>>>>> branch 'master' of https://github.com/jorgejacinto9701/lp1_20231_martes_web_grupo_02
	public UsuarioDAO getUsuarioDAO() {			return new MySqlUsuarioDAO(); 	}
	public AlumnoDAO getAlumnoDAO() {			return new MySqlAlumnoDAO(); 	}
	public AutorDAO getAutorDAO() {				return new MySqlAutorDAO(); 	}
	public PaisDAO getPaisDAO() {				return new MySqlPaisDAO(); 	}
	public TesisDAO getTesisDAO() {				return new MySqlTesisDAO(); 	}
	public SalaDAO getSalaDAO() {				return new MySqlSalaDAO(); 	}
	public RevistaDAO getRevistaDAO() {			return new MySqlRevistaDAO(); 	}
	public LibroDAO getLibroDAO() {				return new MySqlLibroDAO(); 	}
	public EditorialDAO getEditorialDAO() {		return new MySqlEditorialDAO(); 	}
	public PrestamoDAO getPrestamoDAO() {		return new MySqlPrestamoDAO(); 	}
	public SeparacionDAO getSeparacionDAO() {	return new MySqlSeparacionDAO(); 	}
	public GradoDAO getGradoDAO() {return new MySqlGradoDAO();}
	public DevolucionDAO getDevolucionDAO() {	return new MySqlDevolucionDAO(); 	}
	public TipoDAO getTipo() { 		            return new MySqlTipoDAO();	}
	public ProveedorDAO getProveedor() {return new MySqlProveedorDAO();}

	
}
