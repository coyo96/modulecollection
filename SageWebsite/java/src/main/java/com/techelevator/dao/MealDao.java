package com.techelevator.dao;

import com.techelevator.model.Meal;

import java.security.Principal;
import java.util.List;

public interface MealDao {

    List<Meal> getListOfMeals(int userId);
    Meal getMealById(int mealId);
    int createMeal(Meal meal, int userId);
    int editMeal(int mealId, Meal meal, Principal principal);
    void deleteMeal(int mealId, Principal principal);
}
