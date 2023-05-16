package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.AlumnoDAO;
import entity.Alumno;
import util.MySqlDBConexion;

public class MySqlAlumnoDAO implements AlumnoDAO {

	private static Logger log = Logger.getLogger(MySqlAlumnoDAO.class.getName());
	
	public int insertaAlumno(Alumno objAlumno) {
		int salida = -1;
		
		Connection conn =  null ;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "insert into Alumno values(null,?,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, objAlumno.getNombres());
			pstm.setString(2, objAlumno.getApellidos());
			pstm.setString(3, objAlumno.getTelefono());
			pstm.setString(4, objAlumno.getDni());
			pstm.setString(5, objAlumno.getCorreo());
			pstm.setDate(6, objAlumno.getFechaNacimiento());
			pstm.setTimestamp(7, objAlumno.getFechaRegistro());
			pstm.setInt(8, objAlumno.getEstado());
			pstm.setInt(9,objAlumno.getPais().getIdPais());
			
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

	@Override
	public List<Alumno> listaAlumno(String filtro) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "select * from alumno";
			pstm = conn.prepareStatement(sql);
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Alumno obj = null;
			while(rs.next()) {
				obj = new Alumno();
				obj.setIdAlumno(rs.getInt(1));
				obj.setNombres(rs.getString(2));
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

