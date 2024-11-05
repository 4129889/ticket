package tw.idv.jay.web.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import tw.idv.jay.web.user.model.User;

public interface UserRepository extends JpaRepository<User, Long> {
    User findByUserAccount(String userAccount);
}

