package com.techelevator.dao;

import com.techelevator.model.Step;

import java.util.List;

public interface StepDao {

    List<Step> getListOfSteps();

    List<Step> getListOfStepsByRecipeId(int recipe_id);

    List<Step> getStepsByTagId(int tag_id);

    Integer createStep(Step step);

    Integer createStepForRecipe(Step step, int recipe_id);

    int deleteStepByStepId(int step_id);

}
