package tw.idv.jay.web.member.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;
import tw.idv.jay.web.member.entity.Member;
import tw.idv.jay.web.member.service.MemberService;

@RestController
@RequestMapping("member/login")
public class LoginController {
	@Autowired
	private MemberService service;
			
	@GetMapping("{username}/{password}")
	public Member login(HttpServletRequest request, @PathVariable String username, @PathVariable String password) {

		Member member = new Member();
		if (username == null || password == null) {//進不來
			member.setMessage("無會員資訊");
			member.setSuccessful(false);
			return member;
		}
		member.setUsername(username);
		member.setPassword(password);
		member = service.login(member);
		if (member.isSuccessful()) {
			if (request.getSession(false) != null) {
				request.changeSessionId();
			}
			final HttpSession session = request.getSession();
			session.setAttribute("loggedin", true);
			session.setAttribute("member", member);
		}
		return member;
	}
}
