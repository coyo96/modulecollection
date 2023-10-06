package com.techelevator.dao;

import com.techelevator.exception.DaoException;
import com.techelevator.model.Meal;
import org.springframework.dao.DataAccessException;
import org.springframework.dao.DataIntegrityViolationException;
import org.springframework.jdbc.CannotGetJdbcConnectionException;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.security.core.parameters.P;
import org.springframework.stereotype.Component;

import java.security.Principal;
import java.util.ArrayList;
import java.util.List;

@Component
public class JdbcMealDao implements MealDao {

    private final JdbcTemplate jdbcTemplate;

    public JdbcMealDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

    @Override
    public List<Meal> getListOfMeals(int userId) {
        List<Meal> meals = new ArrayList<>();
        String sql =
                "SELECT * FROM meals " +
                "JOIN users_meals ON meals.meal_id = users_meals.meal_id " +
                "JOIN users ON users_meals.user_id = users.user_id " +
                "WHERE users.user_id = ?;";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, userId);
        while (results.next()) {
            Meal meal = mapRowToMeal(results);
            meals.add(meal);
        }
        return meals;
    }

    @Override
    public Meal getMealById(int mealId) {
        Meal meal = null;
        String sql = "SELECT * FROM meals where meal_id = ?;";
        try {
            SqlRowSet results = jdbcTemplate.queryForRowSet(sql, mealId);
            if (results.next()) {
                meal = mapRowToMeal(results);
            }
        } catch (CannotGetJdbcConnectionException e) {
            throw new DaoException("Unable to connect to server or database", e);
        } catch (DataIntegrityViolationException e) {
            throw new DaoException("Data integrity violation", e);
        }
        return meal;
    }

    @Override
    public int createMeal(Meal meal, int userId) {
        return 0;
    }

    @Override
    public int editMeal(int mealId, Meal meal, Principal principal) {
        return 0;
    }
    @Override
    public void deleteMeal(int mealId, Principal principal) {

    }

    private Meal mapRowToMeal(SqlRowSet rs) {
        Meal meal = new Meal();
        meal.setMealId(rs.getInt("meal_id"));
        meal.setMealName(rs.getString("meal_name"));
        meal.setMealDescription(rs.getString("meal_description"));
        meal.setMealDate(rs.getDate("meal_date"));
        return meal;
    }

}
