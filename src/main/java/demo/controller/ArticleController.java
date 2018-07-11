package demo.controller;

import com.jfinal.core.Controller;
import demo.service.*;

import java.util.ArrayList;

import java.util.List;

public class ArticleController extends Controller {
    public void index() {



        Integer article_id = getParaToInt("articleId");

        //Create comment list
        setAttr("comment_table", Comments.dao);
        setAttr("comment_list", Comments.dao
                .find("select * from vmaig_comments_comment where article_id=? Order by create_time Desc",
                        article_id));

        //Update view times and create article object
        Article article = Article.dao.findById(article_id);
        setAttr("auth", Auth.dao);
        Integer view_times = article.getInt("view_times");
        article.set("view_times", view_times+1).update();
        setAttr("article", article);





        //end


        render("/WEB-INF/view/blog/article.html");


    }
}
