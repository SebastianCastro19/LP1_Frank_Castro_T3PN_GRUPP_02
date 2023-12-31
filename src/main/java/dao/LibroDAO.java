package dao;

import java.util.List;

import entity.Libro;

public interface LibroDAO {

	public abstract int insertaLibro(Libro obj);
	public abstract List<Libro> listaLibro(String filtro);
	public abstract int actualizaLibro(Libro obj);
	public abstract int eliminaLibro(int idLibro);
	public abstract Libro buscaLibro(int idLibro);
}

