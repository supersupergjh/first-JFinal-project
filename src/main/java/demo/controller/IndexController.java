package demo.controller;

import com.jfinal.core.Controller;
import demo.service.*;
import sun.plugin.dom.core.Comment;

import java.util.ArrayList;
import java.util.List;

public class IndexController extends Controller {
    public void index() {

        //base


//        List<String> navList = new ArrayList<String>();
//        navList.add("linux环境编程");
//        navList.add("反汇编");
//        navList.add("python");
//        navList.add("Django");
//        setAttr("nav_list", navList);
        setAttr("hot_article_list", Article.dao.find("select * from blog_article order by id asc"));
        //setAttr("website_title", "myBlog");
        setAttr("latest_comment_list", Comments.dao
                .find("select * from vmaig_comments_comment order by create_time desc LIMIT 10"));

        setAttr("links", SystemLinks.dao.find("select * from vmaig_system_link order by id asc"));
        setAttr("blog_category", BlogCategory.dao);

        //end

        //count notification


        setAttr("carousel_page_list", Carousel.dao.find("select * from blog_carousel order by id asc"));
        setAttr("article_list", Article.dao.find("select * from blog_article order by id asc"));
        setAttr("website_welcome", "welcome to Jinhong guo personal blog");
        render("/WEB-INF/view/blog/index.html");

    }


}
