package com.chappie.dao;

import java.util.List;

import org.apache.commons.codec.digest.DigestUtils;

import com.chappie.mapper.UserMapper;
import com.chappie.model.User;

public class UserDAO extends AbstractDAO<User> {

	public User findByUserNameAndPassWord(String username, String password) {

		StringBuilder sql = new StringBuilder("SELECT * FROM user where ");
		if (username.contains("@"))
			sql.append(" Email = ? ");
		else
			sql.append(" SDT = ? ");
		sql.append(" and MatKhau = ?");

		String hashedPassword;
		if (password.length() < 30) {
			// Mã hóa MD5 sử dụng Apache Commons Codec
			hashedPassword = DigestUtils.md5Hex(password);
		} else
			hashedPassword = password;

		List<User> users = query(sql.toString(), new UserMapper(), username, hashedPassword);
		return users.isEmpty() ? null : users.get(0);
	}

	public List<User> findAll() {
		String sql = "select * from user ORDER BY id asc";
		return query(sql, new UserMapper());
	}

	public boolean exists(String email, String sdt) {

		String sql = "SELECT COUNT(*) FROM user WHERE email = ? OR SDT = ?";

		int i = count(sql.toString(), email, sdt);
		return i > 0; // true nếu tồn tại user
	}

	public void save(User user) {
		String sql = "INSERT INTO user (Ho, Ten, Email, SDT, MatKhau, DiaChi) VALUES (?,?,?,?,?,?)";
//																					VALUES ('Trần','Yến','a@gmail,com','123123','123',null,'Hà nội')";

		// Mã hóa MD5 sử dụng Apache Commons Codec
		String hashedPassword = DigestUtils.md5Hex(user.getMatKhau());
		insert(sql, user.getHo(), user.getTen(), user.getEmail(), user.getSdt(), hashedPassword, user.getDiaChi());
	}

	public static void main(String[] args) {
		UserDAO d = new UserDAO();
		String hashedPassword = DigestUtils.md5Hex("123456789");
		User user = new User("Trần", "Yến", "aa@gmail.com", "1123123", hashedPassword, "Hà Nội");
		System.out.println(hashedPassword);
		System.out.println(user.getTen());
		d.save(user);
		System.out.println("KQ: " + d.findByUserNameAndPassWord("abc@gmail.com", "444555").getTen());
	}

	public User findByPhoneNumber(String phone) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user where SDT=?");
		List<User> users = query(sql.toString(), new UserMapper(), phone);
		return users.isEmpty() ? null : users.get(0);
	}

	public User findByEmail(String email) {
		StringBuilder sql = new StringBuilder("SELECT * FROM user where email=?");
		List<User> users = query(sql.toString(), new UserMapper(), email);
		return users.isEmpty() ? null : users.get(0);
	}

}
