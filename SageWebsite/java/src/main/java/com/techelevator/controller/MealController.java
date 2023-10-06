package com.techelevator.controller;

import com.techelevator.dao.MealDao;
import com.techelevator.model.Meal;
import com.techelevator.service.MealService;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;

import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class MealController {
    private final MealService mealService;

    public MealController(MealService mealService) {
        this.mealService = mealService;
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/meals")
    public List<Meal> getMeals(Principal principal){
        return mealService.getListOfMeals(principal);
    }

    @PreAuthorize("isAuthenticated()")
    @GetMapping("/meals/{mealId}")
    public Meal getMealById(@PathVariable int mealId){
        return mealService.getMealById(mealId);
    }

    @PreAuthorize("isAuthenticated()")
    @PostMapping("/meals")
    public int createMeal(Principal principal, @RequestBody Meal meal) {
        return mealService.createMeal(meal, principal);
    }

    @PreAuthorize("isAuthenticated()")
    @PutMapping("/meals/{mealId}")
    public int editMeal(@PathVariable int mealId, @RequestBody Meal meal, Principal principal) {
        return mealService.editMeal(mealId, meal, principal);
    }

    @PreAuthorize("isAuthenticated()")
    @DeleteMapping("/meals/{mealId}")
    public void deleteMeal(@PathVariable int mealId, Principal principal) {
        mealService.deleteMeal(mealId, principal);
    }

}
