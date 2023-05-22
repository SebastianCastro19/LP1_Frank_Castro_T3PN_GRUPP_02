package fabricas;

import dao.AlumnoDAO;
import dao.AutorDAO;
import dao.CategoriaLibroDAO;
import dao.DevolucionDAO;
import dao.EditorialDAO;
import dao.GradoDAO;
import dao.LibroDAO;
import dao.ModalidadDAO;
import dao.PaisDAO;
import dao.PrestamoDAO;
import dao.ProveedorDAO;
import dao.RevistaDAO;
import dao.SalaDAO;
import dao.SedeDAO;
import dao.SeparacionDAO;
import dao.TesisDAO;
import dao.UsuarioDAO;
import dao.impl.MySqlAlumnoDAO;
import dao.impl.MySqlAutorDAO;
import dao.impl.MySqlCategoriaLibroDAO;
import dao.impl.MySqlDevolucionDAO;
import dao.impl.MySqlEditorialDAO;
import dao.impl.MySqlGradoDAO;
import dao.impl.MySqlLibroDAO;
import dao.impl.MySqlModalidadDAO;
import dao.impl.MySqlPaisDAO;
import dao.impl.MySqlPrestamoDAO;
import dao.impl.MySqlProveedorDAO;
import dao.impl.MySqlRevistaDAO;
import dao.impl.MySqlSalaDAO;
import dao.impl.MySqlSedeDAO;
import dao.impl.MySqlSeparacionDAO;
import dao.impl.MySqlTesisDAO;
import dao.impl.MySqlUsuarioDAO;

public class FabricaMysql extends Fabrica {
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
	//public TipoDAO getTipo() { 		            return new MySqlTipoDAO();	}
	public ProveedorDAO getProveedor() {return new MySqlProveedorDAO();}
	public SedeDAO getSedeDAO() {return new MySqlSedeDAO();}
	public ModalidadDAO getModalidadDAO() {	return new MySqlModalidadDAO(); 	}
	public CategoriaLibroDAO getCategoriaLibroDAO() {	return new MySqlCategoriaLibroDAO(); 	}

	
}
