package demo.controller;

import com.jfinal.core.Controller;
import demo.service.*;
import sun.plugin.dom.core.Comment;

import java.util.ArrayList;
import java.util.List;

public class IndexController extends Controller {
    public void index() {

        //base


        //setAttr("website_title", "myBlog");




        //end

        //count notification


        setAttr("carousel_page_list", Carousel.dao.find("select * from blog_carousel order by id asc"));
        setAttr("article_list", Article.dao.find("select * from blog_article order by id asc"));
        setAttr("website_welcome", "welcome to Jinhong guo personal blog");
        render("/WEB-INF/view/blog/index.html");

    }


}
