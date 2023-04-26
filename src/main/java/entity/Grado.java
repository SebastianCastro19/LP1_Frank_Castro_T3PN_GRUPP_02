package entity;

//Importacion de los metodos get y set
import lombok.Getter;
import lombok.Setter;

//Metodos get y set dinamicos
@Getter
@Setter

//Creacion de la clase Grado
public class Grado {

	//Declaracion de atributos de acuerdo a la tabla grado de la base de datos
	private int idGrado;
	private String descripcion;

}
