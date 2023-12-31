package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.RevistaDAO;
import entity.Revista;
import util.MySqlDBConexion;

public class MySqlRevistaDAO implements RevistaDAO {
	private static Logger log = Logger.getLogger(MySqlRevistaDAO.class.getName());
	
	public int insertaRevista(Revista obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into revista values(null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombre());
			pstm.setString(2, obj.getFrecuencia());
			pstm.setTimestamp(3, obj.getFechaCreacion());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getModalidad().getIdModalidad());
			
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