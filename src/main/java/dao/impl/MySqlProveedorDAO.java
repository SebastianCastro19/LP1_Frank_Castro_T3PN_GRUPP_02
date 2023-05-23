package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.ProveedorDAO;
import entity.Categoria;
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
			
			String sql = "insert into proveedor values(null,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6,1);
			pstm.setDate(7, obj.getFechaRegistro());
			pstm.setInt(8, obj.getPais().getIdPais());
			
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
	public List<Proveedor> listaProveedor(String filtro) {
		List<Proveedor> lista = new ArrayList<Proveedor>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select cl.*, ca.nombre from cliente cl inner join categoria ca on "
					+ " cl.idCategoria = ca.idCategoria "
					+ " where cl.nombre like ? ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, filtro);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Proveedor objProveedor = null;
			//Categoria objCategoria = null;
			while(rs.next()) {
				objProveedor = new Proveedor();
				objProveedor.setRazonsocial(rs.getString(1));
				objProveedor.setRuc(rs.getString(2));
				objProveedor.setDireccion(rs.getString(3));
				objProveedor.setCelular(rs.getString(4));
				objProveedor.setContacto(rs.getString(5));
				

				
				lista.add(objProveedor);
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
	public int eliminaProveedor(String ruc) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "delete from proveedor where ruc = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1,ruc);
		
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
	public int actualizaProveedor(Proveedor obj) {
		int salida = -1;
		
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "insert into proveedor values(null,?,?,?,?,?,?,?,?)";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6,1);
			pstm.setDate(7, obj.getFechaRegistro());
			pstm.setInt(8, obj.getPais().getIdPais());
			//pstm.setString(1, obj.getNombre());
			//pstm.setString(2, obj.getDni());		
			//pstm.setInt(4, obj.getTipo().getIdTipo());	
			//pstm.setInt(10,obj.getEstado());				
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
