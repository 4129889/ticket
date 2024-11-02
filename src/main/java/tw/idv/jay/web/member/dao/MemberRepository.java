package tw.idv.jay.web.member.dao;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import tw.idv.jay.web.member.entity.Member;

public interface MemberRepository extends JpaRepository<Member, Integer>, MemberOperation {
	Member findByUsername(String username); 
	Member findByUsernameAndNicknameOrderByUsernameDesc(String username,String nickname);
	
	@Query(value = "select * from MEMBER where USERNAME = :username AND password = :password",
			nativeQuery = true)
	Member selectForLogin(String username, String password);
	List<Member> findByPassAndRoleIdOrderByUsernameAscNicknameDesc(Boolean pass, Integer roleId);
}
