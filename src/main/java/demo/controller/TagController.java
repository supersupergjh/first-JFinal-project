package demo.controller;

import com.jfinal.core.Controller;
import demo.service.Article;

import java.util.List;

public class TagController extends Controller {
    public void index() {
        Integer tagId = getParaToInt("tagId");
        List<Article> articleTag = Article.dao.find("select * from blog_article where tags=?", tagId);
        setAttr("article_list", articleTag);
        render("/WEB-INF/view/blog/tag.html");
    }
}
