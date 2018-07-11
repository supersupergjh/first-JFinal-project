package demo.controller;

import com.jfinal.core.Controller;
import demo.service.Article;
import demo.service.BlogCategory;

import java.util.List;

public class CategoryController extends Controller {
    public void index() {
        Integer categoryId = getParaToInt("categoryId");
        List<Article> articleCategory = Article.dao.find("select * from blog_article where category_id=?", categoryId);
        setAttr("article_list", articleCategory);
        render("/WEB-INF/view/blog/category.html");
    }
}
