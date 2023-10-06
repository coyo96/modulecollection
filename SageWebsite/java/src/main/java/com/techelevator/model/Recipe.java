package com.techelevator.model;

import com.fasterxml.jackson.annotation.JsonProperty;

import javax.validation.constraints.NotBlank;
import java.util.List;

public class Recipe {
    private int recipeId;
    private int creatorId;
    @NotBlank
    private String recipeName;
    private String description;
    private double servingSize;
    private String keywords;
    private List<Ingredient> ingredients;
    private List<Step> steps;
    private String imgUrl;
    private boolean isPublished;
    private boolean isFeatured = false;
    private boolean favorite;
    private List<Tag> tags;

    public Recipe() { }                                     //Required for mapRowToRecipe in jdbcRecipeDao to work

    public Recipe(int recipeId, int creatorId, String recipeName, String description, Double servingSize, String keywords, List<Ingredient> ingredients, List<Step> steps, String imgUrl, boolean isPublished, boolean isFeatured, List<Tag> tags, boolean favorite) {
        this.recipeId = recipeId;
        this.creatorId = creatorId;
        this.recipeName = recipeName;
        this.description = description;
        this.servingSize = servingSize;
        this.keywords = keywords;
        this.ingredients = ingredients;
        this.steps = steps;
        this.imgUrl = imgUrl;
        this.isPublished = isPublished;
        this.isFeatured = false;
        this.tags = tags;
        this.favorite = favorite;
    }

    public int getRecipeId() {
        return recipeId;
    }

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public double getServingSize() {
        return servingSize;
    }

    public void setServingSize(Double servingSize) {
        this.servingSize = servingSize;
    }

    public List<Ingredient> getIngredients() {
        return ingredients;
    }

    public void setIngredients(List<Ingredient> ingredients) {
        this.ingredients = ingredients;
    }

    public List<Step> getSteps() {
        return steps;
    }

    public void setSteps(List<Step> steps) {
        this.steps = steps;
    }

    public String getImgUrl() {
        return imgUrl;
    }

    public void setImgUrl(String imgUrl) {
        this.imgUrl = imgUrl;
    }

    public int getCreatorId() {
        return creatorId;
    }

    public void setCreatorId(int creatorId) {
        this.creatorId = creatorId;
    }

    public String getKeywords() {
        return keywords;
    }

    public void setKeywords(String keywords) {
        this.keywords = keywords;
    }

    public boolean isPublished() {
        return isPublished;
    }

    public void setPublished(boolean isPublished) {
        this.isPublished = isPublished;
    }

    public boolean isFeatured() {
        return isFeatured;
    }

    public void setFeatured(boolean featured) {
        isFeatured = featured;
    }

    public boolean isFavorite() {
        return favorite;
    }

    public void setFavorite(boolean favorite) {
        this.favorite = favorite;
    }

    public List<Tag> getTags() {
        return tags;
    }

    public void setTags(List<Tag> tags) {
        this.tags = tags;
    }
}
