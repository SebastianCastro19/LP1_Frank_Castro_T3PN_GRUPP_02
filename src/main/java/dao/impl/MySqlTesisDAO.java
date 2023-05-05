package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.logging.Logger;

import dao.TesisDAO;
import entity.Tesis;
import util.MySqlDBConexion;

public class MySqlTesisDAO implements TesisDAO {

	private static Logger log = Logger.getLogger(MySqlTesisDAO.class.getName());
	
	public int insertaTesis(Tesis objTesis) {
		int salida = -1;
		
		Connection conn =  null ;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "insert into tesis values(null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, objTesis.getTitulo());
			pstm.setString(2, objTesis.getTema());
			pstm.setTimestamp(3, objTesis.getFechaCreacion());
			pstm.setTimestamp(4, objTesis.getFechaRegistro());
			pstm.setInt(5, objTesis.getEstado());
			pstm.setInt(6,objTesis.getAlumno().getIdAlumno());
			
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
