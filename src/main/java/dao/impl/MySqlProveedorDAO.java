package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.ProveedorDAO;
import entity.Proveedor;
import util.MySqlDBConexion;

public class MySqlProveedorDAO implements ProveedorDAO {


	private static Logger log = Logger.getLogger(MySqlProveedorDAO.class.getName());
	
	public int insertaProveedor(Proveedor  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into proveedor values(null,?,?,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getDni());
			pstm.setDate(3, obj.getFechaRegistro());
			pstm.setInt(4, obj.getTipo().getIdTipo());
			pstm.setString(5, obj.getRazonsocial());
			pstm.setString(6, obj.getRuc());
			pstm.setString(7, obj.getDireccion());
			pstm.setString(8, obj.getCelular());
			pstm.setString(9, obj.getContacto());
			pstm.setInt(10,obj.getEstado());
			pstm.setInt(11, obj.getPais().getIdPais());
			
			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return salida;
	}
}
