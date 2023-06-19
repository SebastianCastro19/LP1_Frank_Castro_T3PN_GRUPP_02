package dao.impl;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Logger;

import dao.ProveedorDAO;
import entity.Pais;
import entity.Proveedor;
import util.MySqlDBConexion;

public  class MySqlProveedorDAO implements ProveedorDAO {

	private static Logger log = Logger.getLogger(MySqlProveedorDAO.class.getName());

	public int insertaProveedor(Proveedor obj) {
		int salida = -1;

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = MySqlDBConexion.getConexion();

			String sql = " insert into proveedor values(null,?,?,?,?,?,?,?,?)";
					
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6, obj.getEstado());
			pstm.setTimestamp(7, obj.getFechaRegistro());
			pstm.setInt(8, obj.getPais().getIdPais());

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
	public List<Proveedor> listaProveedor(String filtro) {
		List<Proveedor> lista = new ArrayList<Proveedor>();
			Connection conn = null;
			PreparedStatement pstm = null;
			ResultSet rs = null;
			try {
				conn = MySqlDBConexion.getConexion();

				String sql = "SELECT p.*, p.razonsocial FROM proveedor p " + "inner join pais pa on p.idPais = pa.idPais "
						+ "where p.razonsocial like ?";
				pstm = conn.prepareStatement(sql);
				pstm.setString(1, filtro);

				log.info(">>>> " + pstm);

				rs = pstm.executeQuery();
				Proveedor objProveedor = null;
				Pais objPais = null;
				while (rs.next()) {
					objProveedor = new Proveedor();
					objProveedor.setIdProveedor(rs.getInt(1));
					objProveedor.setRazonsocial(rs.getString(2));
					objProveedor.setRuc(rs.getString(3));
					objProveedor.setDireccion(rs.getString(4));
					objProveedor.setCelular(rs.getString(5));
					objProveedor.setContacto(rs.getString(6));
					objProveedor.setEstado(rs.getInt(7));
					objProveedor.setFechaRegistro(rs.getTimestamp(8));

					objPais = new Pais();
					objPais.setIdPais(rs.getInt(9));
					objPais.setNombre(rs.getString(10));
					objProveedor.setPais(objPais);

					lista.add(objProveedor);
				}
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

			return lista;
		}
	

	@Override
	public int actualizaProveedor(Proveedor obj) {
		int salida = -1;

		Connection conn = null;
		PreparedStatement pstm = null;

		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "update proveedor set Razonsocial=?, Ruc=?, Direccion=?, Celular=?, Contacto=?, Estado=?, IdPais=? where idProveedor=?";

			pstm = conn.prepareStatement(sql);
			pstm.setString(1, obj.getRazonsocial());
			pstm.setString(2, obj.getRuc());
			pstm.setString(3, obj.getDireccion());
			pstm.setString(4, obj.getCelular());
			pstm.setString(5, obj.getContacto());
			pstm.setInt(6, obj.getEstado());
			pstm.setInt(7, obj.getPais().getIdPais());
			pstm.setInt(8, obj.getIdProveedor());

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
	public int eliminaProveedor(int idProveedor) {
		int salida = -1;
		Connection conn = null;
		PreparedStatement pstm = null;
		try {
			conn = MySqlDBConexion.getConexion();
			String sql = "delete from proveedor where idProveedor = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idProveedor);

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
	public Proveedor buscaProveedor(int idProveedor) {
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		Proveedor objProveedor = null;
		try {
			conn = MySqlDBConexion.getConexion();

			String sql = "SELECT p.* FROM proveedor as p " + "inner join pais as pa on p.idPais = pa.idPais "
					+ "where p.idProveedor = ?";
			pstm = conn.prepareStatement(sql);
			pstm.setInt(1, idProveedor);

			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();

			Pais objPais = null;
			while (rs.next()) {
				objProveedor = new Proveedor();
				objProveedor.setIdProveedor(rs.getInt(1));
				objProveedor.setRazonsocial(rs.getString(2));
				objProveedor.setRuc(rs.getString(3));
				objProveedor.setDireccion(rs.getString(4));
				objProveedor.setCelular(rs.getString(5));
				objProveedor.setContacto(rs.getString(6));
				objProveedor.setEstado(rs.getInt(7));
				objProveedor.setFechaRegistro(rs.getTimestamp(8));

				objPais = new Pais();
				objPais.setIdPais(rs.getInt(9));
				objProveedor.setPais(objPais);

			}
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

		return objProveedor;
	}

	@Override
	public List<Proveedor> listaProveedorComplejo(String razonsocial, String ruc, int estado, int idPais){
		List<Proveedor> lista = new ArrayList<Proveedor>();
		Connection conn = null;
		PreparedStatement pstm = null;
		ResultSet rs = null;
		try {
			conn = MySqlDBConexion.getConexion();
			
			String sql = "select prov.*, pa.nombre from proveedor prov inner join pais pa on prov.idPais = pa.idPais "
					+ "where 1=1 "
					+ "and prov.razonsocial like ? "
					+ "and (? ='' or prov.ruc = ? ) "
					+ "and prov.estado = ? "
					+ "and (? = '-1' or prov.idPais = ?) ";
			pstm = conn.prepareStatement(sql);
			pstm.setString(1, razonsocial);
			pstm.setString(2, ruc);
			pstm.setString(3, ruc);
			pstm.setInt(4, estado);
			pstm.setInt(5, idPais);
			pstm.setInt(6, idPais);
			
			log.info(">>>> " + pstm);

			rs = pstm.executeQuery();
			Proveedor objProveedor = null;
			Pais objPais = null;
			while(rs.next()) {
				objProveedor = new Proveedor();
				objProveedor.setIdProveedor(rs.getInt(1));
				objProveedor.setRazonsocial(rs.getString(2));
				objProveedor.setRuc(rs.getString(3));
				objProveedor.setFechaRegistro(rs.getTimestamp(8));
				objProveedor.setEstado(rs.getInt(7));
				
				objPais = new Pais();
				objPais.setIdPais(rs.getInt(9));
				objPais.setNombre(rs.getString(10));
				objProveedor.setPais(objPais);
				
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
}