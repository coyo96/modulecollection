package com.techelevator.service;

import com.techelevator.model.Ingredient;
import com.techelevator.model.Recipe;
import com.techelevator.model.Step;
import org.springframework.stereotype.Service;
import org.springframework.web.client.RestTemplate;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

@Service
public class RecipeImportService {


    private static final Pattern[] namePatterns = new Pattern[]{
            Pattern.compile("\"@type\":\\s*\"Recipe\",.*?\"name\":\"(.*?)\""),
            Pattern.compile("\"brand\":\\s*\"Allrecipes\".*?\"name\":\\s*\"(.+?)\"")
    };

    private static Pattern[] servingsPatterns = new Pattern[] {
            Pattern.compile("\"recipeYield\":.*?\"(.*?)\"")
    };

    private static Pattern[] ingredientsPatterns = new Pattern[] {
            Pattern.compile("\"recipeIngredient\":\\[([^\\\\]+?)]"),
            Pattern.compile("recipeIngredient\":\\s*\\[\"(.*?)\"\\s*]")
    };

    private static Pattern[] instructionsPatterns = new Pattern[] {
            Pattern.compile("\"recipeInstructions\":\\[(\\{\"@type.*HowToStep\",.+?})]"),
            Pattern.compile("\"HowToStep\",\"text\":\\s+?\"(.+?)\"")
    };



    private static Pattern[] stepsPatterns = new Pattern[] {
            Pattern.compile("\"HowToStep\",\"text\":\\s*?\"(.+?)\"")

    };

    private static final Pattern[] descriptionPatterns = new Pattern[] {
            Pattern.compile("\"@type\":\\s*\"Recipe\".*?\"description\":\"(.+?)\""),
            Pattern.compile("\"Recipe\".*?\"description\":.+?\"(.+?)\",")
    };

    private static final Pattern[] urlPatterns = new Pattern[] {
            Pattern.compile("\"ImageObject\",\"url\":\"(.+?)\""),
            Pattern.compile("\"@type\":\\s*?\"Recipe\".*\"image\":[^\"]*?\"(.+?)\""),
            Pattern.compile("\"ImageObject\".*?\"url\":.+?\"(.+?)\",")

    };


    private static final Pattern servingsPattern = Pattern.compile("\"recipeYield\":.*?\"(.*?)\"");


    private RestTemplate restTemplate = new RestTemplate();

    public Recipe importFromUrl(String url) {
        String data = restTemplate.getForObject(url, String.class);
        data = data.replaceAll("\n", "");

        String name = parseName(data);
        String description = parseDescription(data);
        String imgUrl = parseImgUrl(data);
        String servings = getServings(data);
        String[] ingredients = parseIngredients(data);
        List<String> instructions = parseInstructions(data);

        Recipe recipe = new Recipe();
        recipe.setRecipeName(name);
        recipe.setDescription(description);
        recipe.setImgUrl(imgUrl);

        try {
            recipe.setServingSize(Double.parseDouble(servings));
        } catch (NumberFormatException ex) {
            recipe.setServingSize(0.0);
        }

        List<Ingredient> ingredientsList = new ArrayList<>();
        for(String ingredient : ingredients) {
            Ingredient newIngredient = new Ingredient();
            newIngredient.setIngredient(ingredient);
            ingredientsList.add(newIngredient);

        }
        recipe.setIngredients(ingredientsList);

        List<Step> steps = new ArrayList<>();
        for (int i = 0; i < instructions.size(); i++) {
            Step newStep = new Step(0, i + 1, instructions.get(i));
            steps.add(newStep);
        }
        recipe.setSteps(steps);

        return recipe;
    }

    private String parseName(String data) {
        for (Pattern pattern : namePatterns) {
            Matcher match = pattern.matcher(data);
            if (match.find()) {
                return match.group(1);
            }
        }
        return null;
    }


    public String[] parseIngredients(String data) {
        for (Pattern pattern : ingredientsPatterns) {
            Matcher matcher = pattern.matcher(data);
            if (matcher.find()) {
                String ingredientsList = matcher.group(1);
                ingredientsList = ingredientsList.substring(1, ingredientsList.length() - 1);
                return ingredientsList.split("\",\"");
            }
        }
        return null;
    }

    private String getServings(String data) {
        Matcher match = servingsPattern.matcher(data);
        if (match.find()) {
            String servingsString = match.group(1);
            int spaceIndex = servingsString.indexOf(" ");
            if (spaceIndex != -1) {
                servingsString = servingsString.substring(0, spaceIndex);
            }
            return servingsString;
        }
        return null;
    }

    private List<String> parseInstructions(String data) {
        List<String> instructions = new ArrayList<>();
        for (Pattern pattern : stepsPatterns) {
            Matcher matcher = pattern.matcher(data);
            while (matcher.find()) {
                instructions.add(matcher.group(1));
            }
            return instructions;
        }
        return instructions;
    }

    private String parseImgUrl(String data) {
        for (Pattern pattern : urlPatterns) {
            Matcher match = pattern.matcher(data);
            if (match.find()) {
                return match.group(1);
            }
        }
        return null;
    }

    private String parseDescription(String data) {
        for (Pattern pattern : descriptionPatterns) {
            Matcher matcher = pattern.matcher(data);
            if (matcher.find()) {
                return matcher.group(1);
            }
        }
        return null;
    }
}
