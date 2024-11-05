package tw.idv.jay.web.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import tw.idv.jay.web.user.service.UserService;

@RestController
@RequestMapping("/LogOut")
public class SignOutController {

	@PostMapping
    public ResponseEntity<String> logOut(HttpSession session) {
        // 註銷 session
        session.invalidate();
        
        // 返回 JSON 格式的登出訊息
        return ResponseEntity.ok("{\"message\":\"logout\"}");
    }
}
