package dao;

import java.util.List;

import entity.Autor;

public interface AutorDAO {

	public abstract int insertaAutor(Autor obj);
	public abstract List<Autor> listaAutor(String filtro);
	public abstract int actualizaAutor(Autor obj);
	public abstract int eliminaAutor(int idAutor);
	public abstract Autor buscaAutor(int idAutor);
	
}
