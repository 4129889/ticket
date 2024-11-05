package tw.idv.jay.web.user.service;

import tw.idv.jay.web.user.model.User;

public interface UserService {
    User getUserByAccount(String account);
}
