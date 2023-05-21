package entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Revista {

	private int idRevista;
	private String nombre;
	private String frecuencia;
	private Timestamp fechaCreacion;
	private Timestamp fechaRegistro;
	private int estado;
	private Modalidad modalidad;

}
