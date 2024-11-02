package tw.idv.jay.web.member.controller;

import java.util.Objects;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.bind.annotation.SessionAttributes;

import tw.idv.jay.core.pojo.Core;
import tw.idv.jay.web.member.entity.Member;
import tw.idv.jay.web.member.service.MemberService;

@RestController
@RequestMapping("member/edit")
@SessionAttributes({ "member" })
public class EditController {
	@Autowired
	private MemberService service;

	@GetMapping
	public Member getInfo(@SessionAttribute Member member) {
		if (member == null) {
			member = new Member();
			member.setMessage("無會員資訊");
			member.setSuccessful(false);				
		} else {
			member.setSuccessful(true);
		}
		return member;
	}

	@GetMapping("{password}")
	public Core checkPassword(@PathVariable String password, @SessionAttribute Member member) {
		final Core core = new Core();
		if (member == null) {
			core.setMessage("無會員資訊");
			core.setSuccessful(false);
		} else {
			final String currentPassword = member.getPassword();
			if (Objects.equals(password, currentPassword)) {
				core.setSuccessful(true);
			} else {
				core.setMessage("舊密碼錯誤");
				core.setSuccessful(false);
			}
		}
		return core;
	}

	@PutMapping
	public Member edit(Model model,@SessionAttribute Member member, @RequestBody Member reqMember) {
		final String username = member.getUsername();
		reqMember.setUsername(username);

		member = service.edit(reqMember);
		if (member.isSuccessful()) {			
			model.addAttribute("member", member);
		}
		return member;

	}

}
