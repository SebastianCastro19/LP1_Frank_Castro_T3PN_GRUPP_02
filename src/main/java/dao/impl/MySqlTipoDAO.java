package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.TipoDAO;
import entity.Tipo;
import util.MySqlDBConexion;

public class MySqlTipoDAO implements TipoDAO{

	private static Logger log = Logger.getLogger(MySqlTipoDAO.class.getName());
	
	public List<Tipo> listaTipos() {
		List<Tipo> lista = new ArrayList<Tipo>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select * from tipo";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Tipo obj = null;
			while(rs.next()) {
				obj = new Tipo();
				obj.setIdTipo(rs.getInt(1));
				obj.setDescripcion(rs.getString(2));
				lista.add(obj);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		
		return lista;
	}
}