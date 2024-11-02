package tw.idv.jay.web.member.dao;

import tw.idv.jay.core.dao.CoreDao;
import tw.idv.jay.web.member.entity.Member;

public interface MemberDao extends CoreDao<Member, Integer> {
	
	Member selectByUsername(String username);
	
	Member selectForLogin(String username, String password);
	
}
