package dao.impl;

import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.LibroDAO;
import entity.Categoria;
import entity.Libro;
import util.MySqlDBConexion;

public class MySqlLibroDAO implements LibroDAO {

	private static Logger log = Logger.getLogger(MySqlLibroDAO.class.getName());
	@Override
	public int insertaLibro(Libro obj) {
		int salida = -1;

		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "insert into libro values(null,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getTitulo());
			pstm.setInt(2, obj.getAnio());
			pstm.setString(3, obj.getSerie());
			pstm.setTimestamp(4, obj.getFechaRegistro());
			pstm.setInt(5, obj.getEstado());
			pstm.setInt(6, obj.getCategoria().getIdCategoria());

			log.info(">>>> " + pstm);

			salida = pstm.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null)
					pstm.close();
				if (conn != null)
					conn.close();
			} catch (Exception e2) {
			}
		}

		return salida;
	}

	@Override
	public List<Libro> listaLibro(String filtro) {
		List<Libro> lista = new ArrayList<Libro>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select l.*, cl.descripcion from libro l inner join categoria_libro cl on l.idCategoria = cl.idCategoria where l.titulo like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Libro objLibro = null;
			Categoria objCategoria = null;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));
				objLibro.setFechaRegistro(rs.getTimestamp(5));
				objLibro.setEstado(rs.getInt(6));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(7));
				objCategoria.setDescripcion(rs.getString(8));
				objLibro.setCategoria(objCategoria);
				
				lista.add(objLibro);
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
	public int actualizaLibro(Libro obj) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "update libro set titulo=?, anio=?, serie=?, estado=?, idCategoria=? where idLibro=?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getTitulo());
			pstm.setInt(2, obj.getAnio());
			pstm.setString(3, obj.getSerie());
			pstm.setInt(4, obj.getEstado());
			pstm.setInt(5, obj.getCategoria().getIdCategoria());
			pstm.setInt(6, obj.getIdLibro());

			
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
	public int eliminaLibro(int idLibro) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from libro where idLibro = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
			
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
	public Libro buscaLibro(int idLibro) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Libro objLibro = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select l.*, cl.descripcion from libro l inner join categoria_libro cl on l.idCategoria = cl.idCategoria where l.idLibro = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idLibro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Categoria objCategoria = null;
			while(rs.next()) {
				objLibro = new Libro();
				objLibro.setIdLibro(rs.getInt(1));
				objLibro.setTitulo(rs.getString(2));
				objLibro.setAnio(rs.getInt(3));
				objLibro.setSerie(rs.getString(4));
				objLibro.setFechaRegistro(rs.getTimestamp(5));
				objLibro.setEstado(rs.getInt(6));
				
				objCategoria = new Categoria();
				objCategoria.setIdCategoria(rs.getInt(7));
				objCategoria.setDescripcion(rs.getString(8));
				objLibro.setCategoria(objCategoria);
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				if (pstm != null) pstm.close();
				if (conn != null) conn.close();
			} catch (Exception e2) {}
		}
		return objLibro;
	}

}
