package tw.idv.jay.web.member.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import tw.idv.jay.web.member.dao.MemberRepository;
import tw.idv.jay.web.member.entity.Member;
import tw.idv.jay.web.member.service.MemberService;

@Service
@Transactional
public class MemberServiceImpl4 implements MemberService {
	@Autowired
	private MemberRepository repository;

	@Override
	public Member register(Member member) {
		if (member.getUsername() == null) {
			member.setMessage("使用者名稱未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (member.getPassword() == null) {
			member.setMessage("密碼未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (member.getNickname() == null) {
			member.setMessage("暱稱未輸入");
			member.setSuccessful(false);
			return member;
		}
		if (repository.findByUsername(member.getUsername()) != null) {
			member.setMessage("帳號重複");
			member.setSuccessful(false);
			return member;
		}

		member.setRoleId(2);
		member = repository.save(member);
		if (member.getId() == null){
			member.setMessage("註冊錯誤，請聯絡管理員!");
			member.setSuccessful(false);
			return member;
		}

		member.setMessage("註冊成功");
		member.setSuccessful(true);
		return member;		
	}

	@Override
	public Member login(Member member) {
		final String username = member.getUsername();
		final String password = member.getPassword();

		if (username == null) {
			member.setMessage("使用者名稱未輸入");
			member.setSuccessful(false);
			return member;
		}

		if (password == null) {
			member.setMessage("密碼未輸入");
			member.setSuccessful(false);
			return member;
		}

		member = repository.selectForLogin(username, password);
		if (member == null) {
			member = new Member();
			member.setMessage("使用者名稱或密碼錯誤");
			member.setSuccessful(false);
			return member;
		}

		member.setMessage("登入成功");
		member.setSuccessful(true);
		return member;
	}

	@Override
	public Member edit(Member member) {
		final Member oMember = repository.findByUsername(member.getUsername());
		member.setPass(oMember.getPass());
		member.setRoleId(oMember.getRoleId());
		member.setUpdater(member.getUsername());
		
		
		final int resultCount = repository.update(member);
		member.setSuccessful(resultCount > 0);
		member.setMessage(resultCount > 0 ? "修改成功" : "修改失敗");
		return member;
	}

	@Override
	public List<Member> findAll() {
		return repository.findAll();
	}

	@Override
	public boolean remove(Integer id) {
		repository.deleteById(id);
		return true;
	}

	@Override
	public boolean save(Member member) {
		return repository.update(member) > 0;
	}
}
