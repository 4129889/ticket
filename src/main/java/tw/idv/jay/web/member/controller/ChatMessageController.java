package tw.idv.jay.web.member.controller;

import org.springframework.messaging.handler.annotation.MessageMapping;
import org.springframework.messaging.handler.annotation.SendTo;
import org.springframework.messaging.simp.SimpMessageHeaderAccessor;
import org.springframework.stereotype.Controller;

import tw.idv.jay.web.member.entity.ChatMessage;
import tw.idv.jay.web.member.entity.Member;

@Controller
public class ChatMessageController {
	@MessageMapping("talk")
	@SendTo("/member/chat")
	public ChatMessage talk(SimpMessageHeaderAccessor headerAccessor, ChatMessage chatMessage) {
		Member member = (Member) headerAccessor.getSessionAttributes().get("member");
		chatMessage.setNickname(member.getNickname());
		return chatMessage;
	}
}
