package demo.controller;

import com.jfinal.core.Controller;
import demo.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class AllController extends Controller {
    public void index() {





        setAttr("article_list", Article.dao.find("select * from blog_article order by id asc"));
        setAttr("category_list", BlogCategory.dao.find("select * from blog_category order by id asc"));




        render("/WEB-INF/view/blog/all.html");
    }
}
