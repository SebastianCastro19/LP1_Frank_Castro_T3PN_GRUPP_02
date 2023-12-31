package entity;

import java.sql.Date;
import java.sql.Timestamp;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Autor {
  
    //Declaracion de atributos de la tabla Autor
	private int idAutor;
	private String nombres;
	private String apellidos;
	private Date fechaNacimiento;
	private String telefono;
	private Timestamp fechaRegistro;
	private int estado;
	private Grado grado;
	//Declaracion de atributo para formato de fechaNacimiento
	private String formateadoFecNac;
	
}
