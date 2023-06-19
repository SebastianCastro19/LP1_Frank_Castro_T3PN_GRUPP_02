package dao;

import java.sql.Date;
import java.util.List;
import entity.Autor;

public interface AutorDAO {

	public abstract int insertaAutor(Autor obj);
	public abstract List<Autor> listaAutor(String filtro);
	public abstract int actualizaAutor(Autor obj);
	public abstract int eliminaAutor(int idAutor);
	public abstract Autor buscaAutor(int idAutor);
	public abstract List<Autor> listaCompleja(String nombres,String apellidos,String telefono, int idGrado, int estado, Date fecInicio, Date fecFin);
	
}
