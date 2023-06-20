package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.AlumnoDAO;
import entity.Alumno;
import entity.Pais;
import util.FechaUtil;
import util.MySqlDBConexion;

public class MySqlAlumnoDAO implements AlumnoDAO {

	private static Logger log = Logger.getLogger(MySqlAlumnoDAO.class.getName());
	
	public int insertaAlumno(Alumno objAlumno) {
		int salida = -1;
		
		Connection conn =  null ;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "insert into alumno values(null,?,?,?,?,?,?,?,?,?)";
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
	public List<Alumno> listaPorFecha(Date fecInicio, Date fecFin) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "SELECT a.*, p.nombre FROM alumno a "
					+ "inner join pais p on a.idPais = p.idPais "
					+ "where fechaNacimiento between ? and ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setDate(1, fecInicio);
			pstm.setDate(2, fecFin);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Alumno objAlumno = null;
			Pais objPais = null;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setEstado(rs.getInt(8));
				objAlumno.setFechaRegistro(rs.getTimestamp(9));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objAlumno.setPais(objPais);
				
				lista.add(objAlumno);
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
	
	
	@Override
	public List<Alumno> listaAlumno(String filtro) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select cl.*, ca.nombre from alumno cl inner join pais ca on "
					+ " cl.idPais = ca.idPais "
					+ " where cl.nombres like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);


			rs = pstm.executeQuery();
			Alumno objAlumno = null;
			Pais objPais = null;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setFechaRegistro(rs.getTimestamp(8));
				objAlumno.setEstado(rs.getInt(9));
				objAlumno.setFormateadoFechaNacimiento(FechaUtil.getFechaddMMyyyy(rs.getDate(7)));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objAlumno.setPais(objPais);
				
				lista.add(objAlumno);
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
	

	@Override
	public int actualizarAlumno(Alumno obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update alumno set nombres=?, apellidos=?, telefono=?, dni=?, correo=?, fechaNacimiento=?, estado=?, idPais=? where idAlumno=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getNombres());
			pstm.setString(2, obj.getApellidos());
			pstm.setString(3, obj.getTelefono());
			pstm.setString(4, obj.getDni());
			pstm.setString(5, obj.getCorreo());
			pstm.setDate(6, obj.getFechaNacimiento());
			pstm.setInt(7, obj.getEstado());
			pstm.setInt(8, obj.getPais().getIdPais());
			pstm.setInt(9, obj.getIdAlumno());
			
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
	public int eliminarAlumno(int idAlumno) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from alumno where idAlumno = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAlumno);
			
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
	public Alumno buscaAlumno(int idAlumno) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Alumno objAlumno = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select al.*, pa.nombre from alumno al inner join pais pa on "
					+ " al.idPais = pa.idPais "
					+ " where al.idAlumno = ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idAlumno);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Pais objPais = null;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaNacimiento(rs.getDate(7));
				objAlumno.setFechaRegistro(rs.getTimestamp(8));
				objAlumno.setEstado(rs.getInt(9));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objAlumno.setPais(objPais);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objAlumno;
	}
	@Override
	public List<Alumno> listaCompleja(String nombres,String apellidos,String telefono,String dni,String correo, int idPais, int estado, Date fechaInicio, Date fechaFin) {
		List<Alumno> lista = new ArrayList<Alumno>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "Select e.*, g.nombre From alumno "
					+ "e inner join pais g on e.idPais = g.idPais "
					+ "where 1=1 "
					+ "and e.nombres like ? "
					+ "and e.apellidos like ? "
					+ "and (? = '' or e.telefono = ?)"
					+ "and e.dni like ? "
					+ "and e.correo like ? "
					+ "and e.estado = ? "
					+ "and ( ? = -1 or e.idPais = ? )"
		    		+ "and e.fechaNacimiento > ? "
					+ "and e.fechaNacimiento < ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,"%" + nombres + "%");
			pstm.setString(2,"%" + apellidos + "%");
			pstm.setString(3, telefono);
			pstm.setString(4, telefono);
			pstm.setString(5,"%" + dni + "%");
			pstm.setString(6,"%" + correo + "%");
			pstm.setInt(7, estado);
			pstm.setInt(8, idPais);
			pstm.setInt(9, idPais);
			pstm.setDate(10, fechaInicio);
			pstm.setDate(11, fechaFin);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Alumno objAlumno = null;
			Pais objPais = null;
			while(rs.next()) {
				objAlumno = new Alumno();
				objAlumno.setIdAlumno(rs.getInt(1));
				objAlumno.setNombres(rs.getString(2));
				objAlumno.setApellidos(rs.getString(3));
				objAlumno.setTelefono(rs.getString(4));
				objAlumno.setDni(rs.getString(5));
				objAlumno.setCorreo(rs.getString(6));
				objAlumno.setFechaRegistro(rs.getTimestamp(7));
				objAlumno.setEstado(rs.getInt(9));
				objAlumno.setFechaNacimiento(rs.getDate(8));
				
				objAlumno.setFormateadoFechaNacimiento(FechaUtil.getFechaFormateadaYYYYMMdd(rs.getDate(8)));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(10));
				objPais.setNombre(rs.getString(11));
				objAlumno.setPais(objPais);
				
				lista.add(objAlumno);
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
