package entity;

import java.sql.Date;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class Proveedor {
	private int idProveedor;
	private String nombre;
	private String dni;
	private Date fechaRegistro;
	private Tipo tipo;
	private String razonsocial;
	private String ruc;
	private String direccion;
	private String celular;
	private String contacto;
	private int estado;
	private Pais pais;	
}
