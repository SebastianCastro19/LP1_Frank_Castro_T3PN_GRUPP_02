package dao;

import java.util.List;

import entity.Alumno;

public interface AlumnoDAO {

	int insertaAlumno(Alumno objAlumno);
	public abstract List<Alumno> listaAlumno(String filtro);
	
}

