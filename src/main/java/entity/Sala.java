package entity;

import java.sql.Date;
import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Sala {

	private int idSala;
	private String numero;
	private String piso;
	private String numAlumnos;
	private String recursos;
	private Timestamp fechaRegistro;
	private int estado;
	private Sede sede;

}
