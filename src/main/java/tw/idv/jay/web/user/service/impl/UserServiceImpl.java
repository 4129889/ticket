package tw.idv.jay.web.user.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import tw.idv.jay.web.user.model.User;
import tw.idv.jay.web.user.repository.UserRepository;
import tw.idv.jay.web.user.service.UserService;

@Service
public class UserServiceImpl implements UserService {

    @Autowired
    private UserRepository userRepository;

    @Override
    public User getUserByAccount(String account) {
        return userRepository.findByUserAccount(account);
    }
}
