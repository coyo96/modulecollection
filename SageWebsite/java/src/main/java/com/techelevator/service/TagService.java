package com.techelevator.service;

import com.techelevator.dao.TagDao;
import com.techelevator.model.Tag;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class TagService {
    private final TagDao tagDao;
    public TagService(TagDao tagDao){
        this.tagDao = tagDao;
    }
    public Tag getTagByTagId(int tagId) {

        return tagDao.getTagByTagId(tagId);
    }
    public List<Tag> getAllTags() {
        return tagDao.getAllTags();
    }
    public Integer createTag(Tag tag) {
        return tagDao.createTag(tag);
    }
    public boolean updateTag(Integer tagId, Tag tag) {
        return tagDao.updateTag(tagId, tag);
    }
    public boolean deleteTag(Integer tagId) {
        return tagDao.deleteTag(tagId);
    }
}
