package com.max.hand.app.service;

import com.max.hand.app.model.User;

public interface UserService {

    void save(User user);

    User findByUsername(String username);
}
