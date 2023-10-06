package com.techelevator.controller;

import com.techelevator.dao.RecipeDao;
import com.techelevator.exception.DaoException;
import com.techelevator.model.Recipe;
import com.techelevator.service.RecipeService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.server.ResponseStatusException;

import javax.annotation.security.RolesAllowed;
import javax.validation.Path;
import javax.validation.Valid;
import java.security.Principal;
import java.util.List;

@RestController
@CrossOrigin
public class  RecipeController {
    private final RecipeDao recipeDao;
    private final RecipeService recipeService;
    @Autowired
    public RecipeController(RecipeDao recipeDao, RecipeService recipeService) {
        this.recipeDao = recipeDao;
        this.recipeService = recipeService;
    }
    @GetMapping("/recipes")
    public List<Recipe> getRecipes() {
        return recipeDao.getListOfRecipes();
    }
    @GetMapping("/recipes/{recipeId}")
    public Recipe getRecipeById(@PathVariable int recipeId) {
        return recipeService.getRecipe(recipeId);
    }
    @GetMapping("/recipes/{recipeId}/creator")
    public String getCreatorUsernameByRecipeId(@PathVariable int recipeId) {
        return recipeService.getCreatorUsernameByRecipeId(recipeId);
    }

    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/recipes")
    public Integer createRecipe(@RequestBody Recipe recipe, Principal principal) {
        return recipeService.createRecipe(recipe, principal);
    }

    @PreAuthorize("isAuthenticated()")
    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/recipes/{recipeId}")
    public void updateRecipe(@PathVariable int recipeId, @RequestBody Recipe recipe, Principal principal) {
        recipeService.updateRecipe(recipeId, recipe, principal);
    }

    @GetMapping("/recipes/tags/{tagId}")
    public List<Recipe> getRecipesByTagId(@PathVariable int tagId){
        return recipeService.getRecipesByTagId(tagId);
    }

    @GetMapping("/featured")
    public List<Recipe> getFeaturedRecipes() {
        return recipeDao.getFeaturedRecipesByRecipeId();
    }
    @PreAuthorize("isAuthenticated()")
    @RolesAllowed("admin")
    @RequestMapping(path = "/recipes/{recipeId}/featured", method = RequestMethod.PUT)
    public Recipe setFeatured(@Valid @RequestBody Recipe recipe, Principal principal, @RequestParam boolean isFeatured, @PathVariable int recipeId) {
        recipe.setRecipeId(recipeId);
        try {
            Recipe updatedRecipe = recipeDao.setFeaturedRecipe(recipe, isFeatured, principal);
            return updatedRecipe;

        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, " Recipe not found");
        }
    }

    @PreAuthorize("isAuthenticated()")
    @RequestMapping(path = "/recipes/{recipeId}/favorites",method = RequestMethod.PUT)
    public Recipe setFavoriteRecipe(@Valid @RequestBody Recipe recipe, Principal principal, @RequestParam boolean favorite, @PathVariable int recipeId) {
        recipe.setRecipeId(recipeId);
        try {
            Recipe updatedRecipe = recipeDao.setFavoriteRecipe(recipe, principal);
            return updatedRecipe;

        } catch (DaoException e) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND, " Recipe not found");
        }
    }
    @GetMapping("/import")
    public Recipe getImportedRecipe(@RequestParam String url) {
        return recipeService.importRecipe(url);
    }
    @GetMapping("/keywords")
    public List<Recipe> getRecipesByKeywords(@RequestParam String keywords){        //retrieving list of recipes by keywords
        return recipeDao.getRecipesByKeyWords(keywords);
    }
    @GetMapping("/ingredients")
    public List<Recipe> getRecipesByIngredient(@RequestParam String ingredient) {
        return recipeService.getRecipesByIngredient(ingredient);
    }

    @ResponseStatus(HttpStatus.NO_CONTENT)
    @RequestMapping(path ="/recipes/{id}", method = RequestMethod.DELETE)
    public void delete (@PathVariable int recipeId){
        recipeDao.deleteRecipeByRecipeId(recipeId);
    }



}
