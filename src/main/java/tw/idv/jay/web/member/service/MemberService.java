package tw.idv.jay.web.member.service;

import java.util.List;

import tw.idv.jay.core.service.CoreService;
import tw.idv.jay.web.member.entity.Member;

public interface MemberService extends CoreService{

	Member register(Member member);

	Member login(Member member);
	
	Member edit(Member member);
	
	List<Member> findAll();
	
	boolean remove(Integer id);
	
	boolean save(Member member);
}