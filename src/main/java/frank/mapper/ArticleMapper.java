package frank.mapper;

import frank.model.Article;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface ArticleMapper {
    int deleteById(Integer id);

    int insert(Article record);

    Article selectByPrimaryKey(Long id);

    List<Article> selectAll();

    int updateByPrimaryKey(Article record);

    List<Article> queryArticlesByUserId(Long id);

    int  updateByCondition(Article article);
}