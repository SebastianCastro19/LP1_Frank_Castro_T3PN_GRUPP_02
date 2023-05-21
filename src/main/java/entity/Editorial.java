package entity;

import java.sql.Timestamp;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Editorial {
  
	private int idEditorial;
	private String razonSocial;
	private String direccion;
	private String ruc;
	private Timestamp fechaCreacion;
	private Timestamp fechaRegistro;
	private int estado;
	private Pais pais;
	
   
}
