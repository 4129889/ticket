package tw.idv.jay.web.member.dao.impl;

import org.hibernate.Session;
import org.hibernate.query.MutationQuery;

import jakarta.persistence.PersistenceContext;
import tw.idv.jay.web.member.dao.MemberOperation;
import tw.idv.jay.web.member.entity.Member;

public class MemberRepositoryImpl implements MemberOperation{
	@PersistenceContext
	private Session session;
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
	}

}
