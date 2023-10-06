package com.techelevator.model;

public class Ingredient {

    private int ingredient_id;

    private String ingredient;

    public Ingredient() { }                                     //Required for mapRowToIngredient in jdbcIngredientDao to work

    public Ingredient(int ingredient_id, String ingredient) {
        this.ingredient_id = ingredient_id;
        this.ingredient = ingredient;
    }

    public int getIngredient_id() {
        return ingredient_id;
    }

    public void setIngredient_id(int ingredient_id) {
        this.ingredient_id = ingredient_id;
    }

    public String getIngredient() {
        return ingredient;
    }

    public void setIngredient(String ingredient) {
        this.ingredient = ingredient;
    }

}
