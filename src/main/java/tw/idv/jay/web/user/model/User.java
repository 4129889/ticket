package tw.idv.jay.web.user.model;

import jakarta.persistence.*;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Setter
@Getter
@NoArgsConstructor
@AllArgsConstructor
@Entity
@Table(name = "user") // 指定對應的資料表名稱
public class User {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Integer userID; // 對應 SQL 中的 userID

    @Column(name = "username", nullable = false, length = 10) // 對應 userName
    private String userName;

    @Column(name = "useraccount", nullable = false, length = 10) // 對應 userAccount
    private String userAccount;

    @Column(name = "userpassword", nullable = false, length = 255) // 對應 userPassword
    private String userPassword;

    @Column(name = "userbirth", nullable = false) // 對應 userBirth
    private java.sql.Date userBirth;

    @Column(name = "usercell", nullable = false, length = 10) // 對應 userCell
    private String userCell;

    @Column(name = "useremail", nullable = false, length = 50) // 對應 userEmail
    private String userEmail;

    @Column(name = "usernickname", length = 10) // 對應 userNickname
    private String userNickname;

    @Column(name = "buyauthority", columnDefinition = "TINYINT DEFAULT 0") // 對應 buyAuthority
    private Byte buyAuthority;

    @Column(name = "speakauthority", columnDefinition = "TINYINT DEFAULT 0") // 對應 speakAuthority
    private Byte speakAuthority;

    // 其他屬性和方法...
}
