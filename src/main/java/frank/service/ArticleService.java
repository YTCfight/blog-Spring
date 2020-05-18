package frank.service;

import frank.mapper.ArticleMapper;
import frank.model.Article;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
public class ArticleService {

    // mapper 需要加上 Mapper,MyBatis才能将 Mapper 注册中 Spring 容器中
    @Autowired
    private ArticleMapper articleMapper;

    public List<Article> queryArticles() {
        return articleMapper.selectAll();
    }

    public Article queryArticle(Long id) {
        return articleMapper.selectByPrimaryKey(id);
    }

    public List<Article> queryArticlesByUserId(Long id) {
        return articleMapper.queryArticlesByUserId(id);
    }

    public int insert(Article article) {
        return articleMapper.insert(article);
    }

    public int updateByCondition(Article article) {
        return articleMapper.updateByCondition(article);
    }


    public int delete(Integer id) {
        return articleMapper.deleteById(id);
    }
}
