package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Ingredient;
import com.techelevator.model.Tag;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.dao.EmptyResultDataAccessException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Component;

import javax.xml.crypto.Data;
import java.util.ArrayList;
import java.util.List;
@Component
public class JdbcTagDao implements TagDao {
    private final JdbcTemplate jdbcTemplate;
    @Autowired
    public JdbcTagDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Tag> getTagsByRecipeId(int recipe_id){
        List<Tag> tags = new ArrayList<>();
        String sql = "select * from tags join recipes_tags on recipes_tags.tag_id = tags.tag_id " +
                "join recipes on recipes_tags.recipe_id = recipes.recipe_id where recipes.recipe_id = ? ;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, recipe_id);
        while (results.next()) {
            Tag tag = mapRowToTag(results);
            tags.add(tag);
        }
        return tags;
    }

    @Override
    public List<Tag> getAllTags() {
        List<Tag> tags = new ArrayList<>();
        String sql = "SELECT * FROM tags;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql);
        while (results.next()) {
            Tag tag = mapRowToTag(results);
            tags.add(tag);
        }
        return tags;
    }

    @Override
    public Tag getTagByTagId(int tagId) {
        Tag tag = null;
        String sql = "SELECT * FROM tags WHERE tag_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, tagId);
            if (results.next()) {
                tag = mapRowToTag(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return tag;
    }

    @Override
    public int getTagIdByTag(String tag) {
        String sql = "select tag_id from tags where tag = ?";
        int tagId;
        try {
            tagId = jdbcTemplate.queryForObject(sql, Integer.class, tag);
        } catch (EmptyResultDataAccessException e) {
            throw new DataAccessException(e.toString()) {};
        }
        return tagId;
    }


    private Tag getTagByTagName(String tagname) {                   //helper method local
        Tag tag = null;
        String sql = "SELECT * FROM tags WHERE tag = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, tagname);
            if (results.next()) {
                tag = mapRowToTag(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return tag;
    }

    // Create a new tag
    @Override
    public Integer createTag(Tag tag) {
        String sql = "INSERT INTO tags (tag) " +
                "VALUES (?) " +
                "RETURNING tag_id;";
        Integer tagId;
        try {
            tagId = jdbcTemplate.queryForObject(sql, Integer.class, tag.getTag());
        } catch (DataAccessException e){
            throw new DataAccessException(e.toString()) {};
        }
        return tagId;
    }

    @Override
    public Integer createRecipesTagsRowForNewRecipe(Tag tag, int recipe_id) {

        String sql = "INSERT INTO recipes_tags (tag_id, recipe_id) " +
                "VALUES (?,?);";

        int existingTagId = getTagIdByTag(tag.getTag());

        jdbcTemplate.update(sql, existingTagId, recipe_id);

        return existingTagId;
    }

    // Update a tag
    @Override
    public boolean updateTag(Integer tagId, Tag tag) {
        String sql =
                "UPDATE tags " +
                "SET tag = ? " +
                "WHERE tag_id = ? " +
                "RETURNING tag_id;";
        try {
            jdbcTemplate.queryForObject(sql, Integer.class, tag.getTag(), tagId);
        } catch (DataAccessException e){
            throw new DataAccessException("Tag " + tag.getTag() + " not created.") {};
        }
        return true;
    }

    @Override
    public boolean deleteTag(Integer tagId) {
        String sql = "DELETE FROM tags " +
                     "WHERE tag_id = ? " +
                     "RETURNING tag_id";
        try {
            jdbcTemplate.queryForObject(sql, Integer.class, tagId);
        } catch (DataAccessException e) {
            throw new DaoException(e.getMessage()){};
        }
        return true;
    }

    private Tag mapRowToTag(SqlRowSet rs) {
        Tag tag = new Tag();
        tag.setTagId(rs.getInt("tag_id"));
        tag.setTag(rs.getString("tag"));
        return tag;
    }

}

