package tw.idv.jay.web.member.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import tw.idv.jay.core.pojo.Core;
import tw.idv.jay.web.member.entity.Member;
import tw.idv.jay.web.member.service.MemberService;

@Controller
@RequestMapping("member/manage")
public class ManageController {
	@Autowired
	private MemberService service;
	
	@GetMapping
	public String xxx(Model model) {
		List<Member> memberList = service.findAll();
		model.addAttribute("memberList", memberList);
		return "/WEB-INF/member/manage.jsp";
	}
	
	@DeleteMapping("{id}")
	@ResponseBody
	public Core remove(@PathVariable Integer id) {
//		final Integer id = json2Pojo(request, Member.class).getId();
		final Core core = new Core();
		if (id == null) {
			core.setMessage("無id");
			core.setSuccessful(false);
		} else {
			core.setSuccessful(service.remove(id));
		}
		return core;
		
	}
	
	@PutMapping
	@ResponseBody
	public Core save(@RequestBody Member member) {		
//		final Member member = json2Pojo(request, Member.class);
		final Core core = new Core();
		if (member == null) {
			core.setMessage("無會員資訊");
			core.setSuccessful(false);
		} else {
			core.setSuccessful(service.save(member));
		}
		return core;
	}
}
