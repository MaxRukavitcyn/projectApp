package com.max.hand.app.service;

public interface SecurityService {

    String findLoggedInUsername();

    void autoLogin(String username, String password);
}
