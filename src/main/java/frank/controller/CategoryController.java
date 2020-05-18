package frank.controller;

import frank.model.Category;
import frank.model.User;
import frank.service.CategoryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import javax.servlet.http.HttpSession;

@Controller
public class CategoryController {

    @Autowired
    private CategoryService categoryService;

    @RequestMapping(value = "/c/add", method = RequestMethod.POST)
    public String addCategory(HttpSession session, Category category) {
        User user = (User)session.getAttribute("user");
        category.setUserId(user.getId());
        int num = categoryService.insert(category);
        return "redirect:/writer";
    }

    @RequestMapping(value = "/c/delete", method = RequestMethod.POST)
    public String deleteCategory(String name) {
        int num = categoryService.delete(name);
        return "redirect:/writer";
    }
}
