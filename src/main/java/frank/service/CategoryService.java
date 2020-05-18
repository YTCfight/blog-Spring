package frank.service;

import frank.mapper.CategoryMapper;
import frank.model.Category;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class CategoryService {

    @Autowired
    private CategoryMapper categoryMapper;

    public List<Category> queryCategoriesByUserId(Long id) {
        return categoryMapper.queryCategoriesByUserId(id);
    }

    public int insert(Category category) {
        return categoryMapper.insert(category);
    }

    public Category queryCategoryById(Long id) {
        return categoryMapper.selectByPrimaryKey(id);
    }

    public int delete(String name) {
        return categoryMapper.deleteByName(name);
    }
}
