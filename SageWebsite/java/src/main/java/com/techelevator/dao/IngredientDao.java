package com.techelevator.dao;

import com.techelevator.model.Ingredient;

import java.util.List;

public interface IngredientDao {

    List<Ingredient> getListOfIngredients();

    List<Ingredient> getListOfIngredientsByRecipeId(int recipe_id);

    Integer createIngredient(Ingredient ingredient);

    Integer createIngredientForRecipe(Ingredient ingredient, int recipe_id);

    int deleteIngredientByIngredientId(int ingredient_id);

    List<Ingredient> getListOfIngredientByTagId(int tag_id);

}
