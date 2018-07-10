package demo.controller;

import com.jfinal.core.Controller;
import demo.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class AllController extends Controller {
    public void index() {

        List<String> navList = new ArrayList<String>();
        navList.add("linux环境编程");
        navList.add("反汇编");
        navList.add("python");
        navList.add("Django");
        setAttr("latest_comment_list", Comments.dao
                .find("select * from vmaig_comments_comment order by create_time desc LIMIT 10"));
        setAttr("blog_category", BlogCategory.dao);
        setAttr("links", SystemLinks.dao.find("select * from vmaig_system_link order by id asc"));
        setAttr("hot_article_list", Article.dao.find("select * from blog_article order by id asc"));
        setAttr("nav_list", navList);
        setAttr("article_list", Article.dao.find("select * from blog_article order by id asc"));
        setAttr("category_list", BlogCategory.dao.find("select * from blog_category order by id asc"));




        render("/WEB-INF/view/blog/all.html");
    }
}
