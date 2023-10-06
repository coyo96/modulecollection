package com.techelevator.model;

import java.util.Date;
import java.util.List;

public class Meal {
    private int mealId;
    private String mealName;
    private String mealDescription;
    private Date mealDate;
    private List<Recipe> mealRecipes;

    public Meal() {
    }

    public Meal(int mealId, String mealName, String mealDescription, Date mealDate, List<Recipe> mealRecipes) {
        this.mealId = mealId;
        this.mealName = mealName;
        this.mealDescription = mealDescription;
        this.mealDate = mealDate;
        this.mealRecipes = mealRecipes;
    }

    public int getMealId() {
        return mealId;
    }

    public void setMealId(int mealId) {
        this.mealId = mealId;
    }

    public String getMealName() {
        return mealName;
    }

    public void setMealName(String mealName) {
        this.mealName = mealName;
    }

    public String getMealDescription() {
        return mealDescription;
    }

    public void setMealDescription(String mealDescription) {
        this.mealDescription = mealDescription;
    }

    public Date getMealDate() {
        return mealDate;
    }

    public void setMealDate(Date mealDate) {
        this.mealDate = mealDate;
    }

    public List<Recipe> getMealRecipes() {
        return mealRecipes;
    }

    public void setMealRecipes(List<Recipe> mealRecipes) {
        this.mealRecipes = mealRecipes;
    }
}
