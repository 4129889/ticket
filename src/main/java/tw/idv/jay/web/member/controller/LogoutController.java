package tw.idv.jay.web.member.controller;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.bind.support.SessionStatus;

@RestController
@RequestMapping("member/logout")
public class LogoutController {

	@GetMapping
	private void Logout(SessionStatus sessionStatus) {
		sessionStatus.setComplete();

	}

}
