package com.techelevator.dao;

import com.techelevator.model.Tag;
import java.util.List;

public interface TagDao {
    List<Tag> getTagsByRecipeId(int recipe_id);

    Tag getTagByTagId(int tagId);

    List<Tag> getAllTags();

    Integer createRecipesTagsRowForNewRecipe(Tag tag, int recipe_id);
    Integer createTag(Tag tag);

    boolean updateTag(Integer tagId, Tag tag);

    boolean deleteTag(Integer tagId);

    int getTagIdByTag(String tagName);
}
