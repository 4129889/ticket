package tw.idv.jay.web.user.controller;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import jakarta.servlet.http.HttpSession;
import tw.idv.jay.web.user.service.UserService;

@RestController
@RequestMapping("/SignIn")
public class SignInController {

    @Autowired
    private UserService userService;

    @PostMapping
    public ResponseEntity<HashMap<String, String>> signIn(@RequestParam String account, 
                                                          @RequestParam String password,
                                                          HttpSession session) {
        HashMap<String, String> data = new HashMap<>();

        // 加密接收到的密碼 -> 使用 MD5 加密
        try {
            // 創建 MD5 實體
            MessageDigest md = MessageDigest.getInstance("MD5");

            // 轉換原始密碼
            byte[] bytes = md.digest(password.getBytes());

            // 將 byte[] 轉為 16 進制 String
            StringBuilder sb = new StringBuilder();
            for (byte b : bytes) {
                sb.append(String.format("%02x", b));
            }

            // MD5 加密後的 Password
            password = sb.toString();

        } catch (NoSuchAlgorithmException e) {
            e.printStackTrace();
        }

        System.out.println("account: " + account);
        System.out.println("password: " + password);

        // 檢查帳號是否存在
        if (userService.getUserByAccount(account) == null) {
            data.put("status", "accFailed");
            return ResponseEntity.ok(data);
        }

        // 檢查密碼是否正確
        if (!userService.getUserByAccount(account).getUserPassword().equals(password)) {
            data.put("status", "pswFailed");
            return ResponseEntity.ok(data);
        }

        System.out.println("帳號密碼比對成功！");
        System.out.println("歡迎: " + account + "登入！");

        // 設定 session
        session.setAttribute("account", account);
        String userID = userService.getUserByAccount(account).getUserID().toString();
        session.setAttribute("userID", userID);

        data.put("status", "success");
        data.put("userID", userID);
        data.put("account", account);

        // 檢查來源網頁
        String location = (String) session.getAttribute("location");
        session.removeAttribute("location");
        String redirectPath = location != null ? location : "/springboot-exercise/member/home.html";
        data.put("location", redirectPath);

        return ResponseEntity.ok(data);
    }
}
