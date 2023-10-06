package com.techelevator.controller;

import com.techelevator.dao.UserDao;
import com.techelevator.dao.UserRecipeDao;
import com.techelevator.model.UserRecipe;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@CrossOrigin
public class UserController {

    private UserDao userDao;

    private UserRecipeDao userRecipeDao;

    public UserController(UserDao userDao, UserRecipeDao userRecipeDao) {
        this.userDao = userDao;
        this.userRecipeDao = userRecipeDao;
    }

}
