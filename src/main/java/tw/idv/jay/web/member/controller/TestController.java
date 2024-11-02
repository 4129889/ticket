package tw.idv.jay.web.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import tw.idv.jay.web.member.dao.MemberRepository;
import tw.idv.jay.web.member.entity.Member;

@RestController
@RequestMapping("test")
public class TestController {
	@Autowired
	private MemberRepository repository;

	@GetMapping("t1")
	public List<Member> t1() {
		return repository.findAll();
	}

	@GetMapping("t2/{username}")
	public Member t2(@PathVariable String username) {
		return repository.findByUsername(username);
	}

	@GetMapping("t3/{username}/{nickname}")
	public Member t3(@PathVariable String username, @PathVariable String nickname) {
		return repository.findByUsernameAndNicknameOrderByUsernameDesc(username, nickname);
	}

	@GetMapping("t4/{pass}/{roleId}")
	public List<Member> t4(@PathVariable Boolean pass, @PathVariable Integer roleId) {
		return repository.findByPassAndRoleIdOrderByUsernameAscNicknameDesc(pass, roleId);
	}

}
