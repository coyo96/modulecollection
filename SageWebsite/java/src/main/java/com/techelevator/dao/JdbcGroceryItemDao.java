package com.techelevator.dao;

import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Component;

@Component
public class JdbcGroceryItemDao implements GroceryItemDao{

    private final JdbcTemplate jdbcTemplate;

    public JdbcGroceryItemDao(JdbcTemplate jdbcTemplate) {
        this.jdbcTemplate = jdbcTemplate;
    }

}
