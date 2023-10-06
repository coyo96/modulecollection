package com.techelevator.model;

public class GroceryItem {

    private Ingredient ingredient;

    private boolean is_completed;           //default to false initially...

    public GroceryItem() { }

    public GroceryItem(Ingredient ingredient, boolean is_completed) {
        this.ingredient = ingredient;
        this.is_completed = is_completed;
    }

    public Ingredient getIngredient() {
        return ingredient;
    }

    public void setIngredient(Ingredient ingredient) {
        this.ingredient = ingredient;
    }

    public boolean isIs_completed() {
        return is_completed;
    }

    public void setIs_completed(boolean is_completed) {
        this.is_completed = is_completed;
    }
}
