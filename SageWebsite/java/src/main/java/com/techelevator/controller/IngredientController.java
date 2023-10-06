package com.techelevator.controller;

import com.techelevator.dao.IngredientDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.model.Ingredient;
import com.techelevator.service.RecipeService;
import org.springframework.web.bind.annotation.CrossOrigin;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

import java.util.List;

@RestController
@CrossOrigin
public class IngredientController {

    private IngredientDao ingredientDao;

    private RecipeService recipeService;

    public IngredientController(IngredientDao ingredientDao, RecipeService recipeService) {
        this.ingredientDao = ingredientDao;
        this.recipeService = recipeService;
    }


}
