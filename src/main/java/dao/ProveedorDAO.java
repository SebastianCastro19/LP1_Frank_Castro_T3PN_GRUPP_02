package dao;

import java.util.List;
import entity.Proveedor;

public interface ProveedorDAO {

	public abstract int insertaProveedor(Proveedor obj);
	public abstract List<Proveedor> listaProveedor(String filtro);
	public abstract int eliminaProveedor(String ruc);
	public abstract int actualizaProveedor(Proveedor obj);
}

