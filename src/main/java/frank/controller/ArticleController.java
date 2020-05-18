package frank.controller;

import frank.model.Article;
import frank.model.Category;
import frank.model.Comment;
import frank.model.User;
import frank.service.ArticleService;
import frank.service.CategoryService;
import frank.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpSession;
import java.util.Date;
import java.util.List;

@Controller
public class ArticleController {

    @Autowired
    private ArticleService articleService;

    @Autowired
    private CommentService commentService;

    @Autowired
    private CategoryService categoryService;

    @RequestMapping("/")
    public String index(Model model) {
        // 用户登陆以后，user对象需要从 session 获取，并设置到页面需要的属性中
        List<Article> articles = articleService.queryArticles();
        model.addAttribute("articleList", articles);
        return "index";
    }

    @RequestMapping("/a/{id}")
    public String detail(@PathVariable("id") Long id, Model model) {
        Article article = articleService.queryArticle(id);
        List<Comment> comments = commentService.queryComments(id);
        article.setCommentList(comments);
        model.addAttribute("article", article);
        return "info";
    }

    @RequestMapping("/writer")
    public String writer(HttpSession session, Long activeCid, Model model) {
        User user = (User)session.getAttribute("user");
        List<Article> articles = articleService.queryArticlesByUserId(user.getId());
        model.addAttribute("articleList", articles);
        List<Category> categories = categoryService.queryCategoriesByUserId(user.getId());
        model.addAttribute("categoryList", categories);
        model.addAttribute("activeCid", activeCid == null ? categories.get(0).getId() : activeCid);
        return "writer";
    }

    /**
     * 跳转到新建文章/修改文章页面（同一个页面 editor）
     * @param type 新增为1， 修改为2
     * @param id 新增时为 categoryId，修改时为 articleId
     * @param model editor 页面需要 type 属性，都需要 category，新增时需要 activeCid，修改时需要 article
     * @return
     */
    @RequestMapping("/writer/forward/{type}/{id}/editor")
    public String editorAdd(@PathVariable("type") Integer type,
                            @PathVariable("id") Long id,
                                    Model model) {
        Category category;
        if (type == 1) {
            // 完成 editor 页面新增的属性设置
            category = categoryService.queryCategoryById(id);
            model.addAttribute("activeCid", id);
        } else {
            // 完成 editor页面修改的属性设置
            // 可以扩展一下，一次 sql 查询出 article 和 category 的数据：
            // Article 定义 Category 类型为一个属性， sql 中使用 association 标签作为
            // 查询结果集 1 对 1 关联关系
            Article article = articleService.queryArticle(id);
            model.addAttribute("article", article);
            category = categoryService.queryCategoryById(new Long(article.getCategoryId()));
        }
        model.addAttribute("type", type);
        model.addAttribute("category", category);
        return "editor";
    }

    /** 文章新增/修改操作
     * @param type 新增为1， 修改为2
     * @param id 新增时为 categoryId，修改时为 articleId
     * @return
     */
    @RequestMapping(value = "/writer/article/{type}/{id}", method = RequestMethod.POST)
    public String publish(@PathVariable("type") Integer type,
                          @PathVariable("id") Integer id,
                          Article article, HttpSession session) {
        article.setUpdatedAt(new Date());
        if (type == 1) {
            // 新增的时候插入文章数据
            article.setCategoryId(id);
            User user = (User)session.getAttribute("user");
            article.setUserId(user.getId());
            article.setCoverImage("https://picsum.photos/id/1/400/300");
            article.setCreatedAt(new Date());
            article.setStatus((byte)0);
            article.setViewCount(0L);
            article.setCommentCount(0);
            int num = articleService.insert(article);
            id = article.getId().intValue();
        } else {
            // 修改文章数据
            article.setId(new Long(id));
            int num = articleService.updateByCondition(article);
        }
        return String.format("redirect:/writer/forward/2/%s/editor", id);
    }

    @RequestMapping(value = "/writer/{id}/delete")
    public String deleteCategory(@PathVariable("id") Integer id) {
        int num = articleService.delete(id);
        return "redirect:/writer";
    }

}
