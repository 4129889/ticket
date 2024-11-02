package tw.idv.jay.web.member.dao.impl;

import java.util.List;

import org.hibernate.Session;
import org.hibernate.query.MutationQuery;
import org.springframework.stereotype.Repository;

import jakarta.persistence.PersistenceContext;
import jakarta.persistence.criteria.CriteriaBuilder;
import jakarta.persistence.criteria.CriteriaQuery;
import jakarta.persistence.criteria.Root;
import tw.idv.jay.web.member.dao.MemberDao;
import tw.idv.jay.web.member.entity.Member;

@Repository
public class MemberDaoImpl4 implements MemberDao {
	@PersistenceContext
	private Session session;

	@Override
	public int insert(Member member) {
//		final String sql = "insert into MEMBER(USERNAME, PASSWORD, NICKNAME, ROLE_ID) " + "values(?, ?, ?, ?)";
//		try (
//			Connection conn = getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setString(1, member.getUsername());
//			pstmt.setString(2, member.getPassword());
//			pstmt.setString(3, member.getNickname());
//			pstmt.setInt(4, member.getRoleId());
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1;
		session.persist(member);
		return 1;
	}

	@Override
	public int deleteById(Integer id) {
		Member member = session.getReference(Member.class, id);
		session.remove(member);
		return 1;
//		final String sql = "delete from MEMBER where ID = ?";
//		try (
//			Connection conn = getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setInt(1, id);
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1;
	}

	@Override
	public int update(Member member) {
		final StringBuilder hql = new StringBuilder().append("UPDATE Member set ");
		final String password = member.getPassword();
		if (password != null && !password.isEmpty()) {
			hql.append("password = :password,");
		}
		hql.append("nickname = :nickname,").append("pass = :pass,").append("roleId = :roleId,")
				.append("updater = :updater,").append("image = :image, ").append("lastUpdatedDate = NOW() ")
				.append("WHERE username = :username");
//		Query<?> query = session.createQuery(hql.toString());
		MutationQuery query = session.createMutationQuery(hql.toString());
		if (password != null && !password.isEmpty()) {
			query.setParameter("password", password);
		}
		return query.setParameter("nickname", member.getNickname()).setParameter("pass", member.getPass())
				.setParameter("roleId", member.getRoleId()).setParameter("updater", member.getUpdater())
				.setParameter("image", member.getImage()).setParameter("username", member.getUsername())
				.executeUpdate();

//		final StringBuilder sql = new StringBuilder().append("update MEMBER set ");
//		int offset = 0;
//		final String password = member.getPassword();
//		if (password != null && !password.isEmpty()) {
//			sql.append("PASSWORD = ?,");
//			offset = 1;
//		}
//		sql.append("NICKNAME = ?,").append("PASS = ?,").append("ROLE_ID = ?,").append("UPDATER = ?,")
//				.append("LAST_UPDATED_DATE = NOW() ").append("where USERNAME = ?");
//		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql.toString())) {
//			if (password != null && !password.isEmpty()) {
//				pstmt.setString(1, member.getPassword());
//			}
//			pstmt.setString(1 + offset, member.getNickname());
//			pstmt.setBoolean(2 + offset, member.getPass());
//			pstmt.setInt(3 + offset, member.getRoleId());
//			pstmt.setString(4 + offset, member.getUpdater());
//			pstmt.setString(5 + offset, member.getUsername());
//			return pstmt.executeUpdate();
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return -1;
	}

	@Override
	public Member selectById(Integer id) {
		Member member = session.get(Member.class, id);
		return member;

//		final String sql = "select * from MEMBER where ID = ?";
//		try (
//			Connection conn = getConnection();
//			PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setInt(1, id);
//			try (
//				ResultSet rs = pstmt.executeQuery()) {
//				if (rs.next()) {
//					Member member = new Member();
//					member.setId(rs.getInt("ID"));
//					member.setUsername(rs.getString("USERNAME"));
//					member.setPassword(rs.getString("PASSWORD"));
//					member.setNickname(rs.getString("NICKNAME"));
//					member.setPass(rs.getBoolean("PASS"));
//					member.setRoleId(rs.getInt("ROLE_ID"));
//					member.setCreator(rs.getString("CREATOR"));
//					member.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
//					member.setUpdater(rs.getString("UPDATER"));
//					member.setLastUpdatedDate(rs.getTimestamp("LAST_UPDATED_DATE"));
//					return member;
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
	}

	@Override
	public List<Member> selectAll() {
		final String hql = "FROM Member ORDER BY id";
		return session.createQuery(hql, Member.class).getResultList();

//		final String sql = "select * from MEMBER order by ID";
//		try (Connection conn = getConnection();
//				PreparedStatement pstmt = conn.prepareStatement(sql);
//				ResultSet rs = pstmt.executeQuery()) {
//			List<Member> list = new ArrayList<>();
//			while (rs.next()) {
//				Member member = new Member();
//				member.setId(rs.getInt("ID"));
//				member.setUsername(rs.getString("USERNAME"));
//				member.setPassword(rs.getString("PASSWORD"));
//				member.setNickname(rs.getString("NICKNAME"));
//				member.setPass(rs.getBoolean("PASS"));
//				member.setRoleId(rs.getInt("ROLE_ID"));
////				member.setCreator(rs.getString("CREATOR"));
////				member.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
////				member.setUpdater(rs.getString("UPDATER"));
////				member.setLastUpdatedDate(rs.getTimestamp("LAST_UPDATED_DATE"));
//				list.add(member);
//			}
//			return list;
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
	}

	@Override
	public Member selectByUsername(String username) {

		CriteriaBuilder cB = session.getCriteriaBuilder();
		CriteriaQuery<Member> cQ = cB.createQuery(Member.class);
		Root<Member> root = cQ.from(Member.class);
		cQ.where(cB.equal(root.get("username"), username));
		return session.createQuery(cQ).uniqueResult();
//		final String sql = "select * from MEMBER where USERNAME = ?";
//		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setString(1, username);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				if (rs.next()) {
//					Member member = new Member();
//					member.setId(rs.getInt("ID"));
//					member.setUsername(rs.getString("USERNAME"));
//					member.setPassword(rs.getString("PASSWORD"));
//					member.setNickname(rs.getString("NICKNAME"));
//					member.setPass(rs.getBoolean("PASS"));
//					member.setRoleId(rs.getInt("ROLE_ID"));
//					member.setCreator(rs.getString("CREATOR"));
//					member.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
//					member.setUpdater(rs.getString("UPDATER"));
//					member.setLastUpdatedDate(rs.getTimestamp("LAST_UPDATED_DATE"));
//					return member;
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
	}

	@Override
	public Member selectForLogin(String username, String password) {
		final String sql = "select * from MEMBER where USERNAME = :username and PASSWORD = :password";
		return session.createNativeQuery(sql, Member.class).setParameter("username", username)
				.setParameter("password", password).uniqueResult();

//		final String sql = "select * from MEMBER where USERNAME = ? and PASSWORD = ?";
//		try (Connection conn = getConnection(); PreparedStatement pstmt = conn.prepareStatement(sql)) {
//			pstmt.setString(1, username);
//			pstmt.setString(2, password);
//			try (ResultSet rs = pstmt.executeQuery()) {
//				if (rs.next()) {
//					Member member = new Member();
//					member.setId(rs.getInt("ID"));
//					member.setUsername(rs.getString("USERNAME"));
//					member.setPassword(rs.getString("PASSWORD"));
//					member.setNickname(rs.getString("NICKNAME"));
//					member.setPass(rs.getBoolean("PASS"));
//					member.setRoleId(rs.getInt("ROLE_ID"));
//					member.setCreator(rs.getString("CREATOR"));
//					member.setCreatedDate(rs.getTimestamp("CREATED_DATE"));
//					member.setUpdater(rs.getString("UPDATER"));
//					member.setLastUpdatedDate(rs.getTimestamp("LAST_UPDATED_DATE"));
//					return member;
//				}
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		return null;
//	}
	}
}
