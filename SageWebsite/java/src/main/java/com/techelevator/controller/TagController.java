package com.techelevator.controller;

import com.techelevator.model.Tag;
import com.techelevator.service.TagService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.web.bind.annotation.*;
import java.util.List;

@RestController
@CrossOrigin
public class TagController {
    private final TagService tagService;
    @Autowired
    public TagController(TagService tagService) {
        this.tagService = tagService;
    }
    @GetMapping("/tags")
    public List<Tag> getAllTags() {
        return tagService.getAllTags();
    }
    @GetMapping("/tags/{tagId}")
    public Tag getTagById(@PathVariable int tagId) {
        return tagService.getTagByTagId(tagId);
    }
    @ResponseStatus(HttpStatus.CREATED)
    @PostMapping("/tags")
    public Integer createTag(@RequestBody Tag tag) {
        return tagService.createTag(tag);
    }
    @ResponseStatus(HttpStatus.OK)
    @PutMapping("/tags/{tagId}")
    public boolean updateTag(@PathVariable Integer tagId, @RequestBody Tag tag) {
        return tagService.updateTag(tagId, tag);
    }
    @ResponseStatus(HttpStatus.OK)
    @DeleteMapping("/tags/{tagId}")
    public boolean deleteTag(@PathVariable Integer tagId) {
        return tagService.deleteTag(tagId);
    }
}
