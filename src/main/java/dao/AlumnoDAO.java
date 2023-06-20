package dao;

import java.sql.Date;
import java.util.List;

import entity.Alumno;
import entity.Autor;

public interface AlumnoDAO {

	public abstract List<Alumno> listaPorFecha(Date fecInicio, Date fecFin);
	public abstract int insertaAlumno(Alumno objAlumno);
	public abstract List<Alumno> listaAlumno(String filtro);
	public abstract int actualizarAlumno(Alumno obj);
	public abstract int eliminarAlumno(int idAlumno);
	public abstract Alumno buscaAlumno(int idAlumno); 
	public abstract List<Alumno> listaCompleja(String nombre,String apellido,String telefono,String dni,String correo, int idPais, int estado, Date fechaInicio, Date fechaFin);
}

