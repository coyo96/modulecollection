package com.techelevator.model;

import java.util.List;

public class UserRecipe {
    private List<Recipe> recipes;     //"my library of rec"
    private List<Ingredient> ingredients;      //for shopping list....keep string together-quantity+ing)
    private String profileUrl;
    public UserRecipe() { }

    public UserRecipe(List<Recipe> recipes, List<Ingredient> ingredients, String profileUrl) {
        this.recipes = recipes;
        this.ingredients = ingredients;
        this.profileUrl = profileUrl;
    }

    public List<Recipe> getCookBook() {
        return recipes;
    }

    public void setCookBook(List<Recipe> recipes) {
        this.recipes = recipes;
    }

    public List<Ingredient> getGroceryItems() {
        return ingredients;
    }

    public void setGroceryItems(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public String getProfileUrl() {
        return profileUrl;
    }

    public void setProfileUrl(String profileUrl) {
        this.profileUrl = profileUrl;
    }

}
