package com.chappie.dao;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

import com.chappie.mapper.RowMapper;
import com.chappie.model.Phone;

public class AbstractDAO<T> {

	public Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/mobile_store";
			String user = "root";
			String password = "dinhhtvq123";
			return DriverManager.getConnection(url, user, password);
		} catch (ClassNotFoundException | SQLException e) {
			return null;
		}
	}

	public List<T> query(String sql, RowMapper<T> rowMapper, Object... parameters) {
		List<T> list = new ArrayList<T>();
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			connection = getConnection();
			ps = connection.prepareStatement(sql);

			setParameter(ps, parameters);

			rs = ps.executeQuery();
			while (rs.next())
				list.add(rowMapper.mapRow(rs));
			return list;
		} catch (SQLException e) {
			return null;
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e2) {
				return null;
			}
		}
	}

	public void update(String sql, Object... parameters) {
		Connection connect = null;
		PreparedStatement ps = null;
		try {
			connect = getConnection();
			connect.setAutoCommit(false);
			ps = connect.prepareStatement(sql);
			setParameter(ps, parameters);
			ps.executeUpdate();
			connect.commit();
		} catch (SQLException e) {
			if (connect != null) {
				try {
					connect.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (ps != null)
					ps.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
	}

	public Long insert(String sql, Object... parameters) {
		Connection connection = null;
		PreparedStatement ps = null;
		ResultSet rs = null;
		try {
			Long id = null;
			connection = getConnection();
			connection.setAutoCommit(false);
			ps = connection.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
			setParameter(ps, parameters);
			ps.executeUpdate();

//	    get Ä‘Ãºng cÃ¡i id mÃ  há»‡ thá»‘ng táº¡o, vÃ¬ id nÃ³ tá»± tÄƒng, Ä‘á»ƒ tráº£ vá»� 
			rs = ps.getGeneratedKeys();
			if (rs.next()) {
				id = rs.getLong(1);
			}
			connection.commit();
			return id;

		} catch (SQLException e) {
			if (connection != null) {
				try {
					connection.rollback();
				} catch (SQLException e1) {
					e1.printStackTrace();
				}
			}
		} finally {
			try {
				if (connection != null)
					connection.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e2) {
				e2.printStackTrace();
			}
		}
		return null;
	}

	private void setParameter(PreparedStatement ps, Object... parameters) {
		try {

			for (int i = 0; i < parameters.length; i++) {
				Object parameter = parameters[i];
				int index = i + 1;

				if (parameter instanceof String)
					ps.setString(index, (String) parameter);
				else if (parameter instanceof Integer)
					ps.setInt(index, (Integer) parameter);
				else if (parameter instanceof Long)
					ps.setLong(index, (Long) parameter);
				else if (parameter instanceof Double)
					ps.setDouble(index, (Double) parameter);
				else if (parameter instanceof Date)
					ps.setDate(index, (Date) parameter);
			}

		} catch (SQLException e) {
			e.printStackTrace();
		}
	}

	public int count(String sql, Object... parameters) {
		Connection connect = null;
		PreparedStatement ps = null;
		ResultSet rs = null;

		try {
			int count = 0;
			connect = getConnection();
			ps = connect.prepareStatement(sql);
//	    set parameter ()
			setParameter(ps, parameters);

			rs = ps.executeQuery();
			while (rs.next())
				count = rs.getInt(1);
			return count;
		} catch (SQLException e) {
			return 0;
		} finally {
			try {
				if (connect != null)
					connect.close();
				if (ps != null)
					ps.close();
				if (rs != null)
					rs.close();
			} catch (SQLException e2) {
				return 0;
			}
		}
	}

	public static void main(String[] args) {
		AbstractDAO<Phone> dao = new AbstractDAO<Phone>();
//	List<PhoneModel> list = dao.query("select * from dienthoai", new PhoneMapper());
//	for (int i = 0; i < list.size(); i++) {
//	    System.out.println(list.get(i));
//	}

		System.out.println(dao.count("select * from dienthoai"));
	}

}
