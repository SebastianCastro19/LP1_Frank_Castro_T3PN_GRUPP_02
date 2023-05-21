package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.EditorialDAO;
import entity.Editorial;
import util.MySqlDBConexion;

public class MySqlEditorialDAO implements EditorialDAO {
	
private static Logger log = Logger.getLogger(MySqlEditorialDAO.class.getName());
	
	public int insertaEditorial (Editorial  obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into editorial values(null,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonSocial());
			pstm.setString(2, obj.getDireccion());
			pstm.setString(3, obj.getRuc());
			pstm.setTimestamp(4, obj.getFechaCreacion());
			pstm.setTimestamp(5, obj.getFechaRegistro());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7,obj.getPais().getIdPais());
			
			
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
