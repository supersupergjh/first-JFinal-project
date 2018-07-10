package demo.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.Ret;
import demo.service.Article;
import demo.service.Comments;
import demo.service.Notification;
import demo.service.User;


public class CommentController extends Controller {
    public void index() {
        Integer articleId = getParaToInt("articleId");
        String comment = getPara("comment");
        User user = getAttr("user");
        if(getParaToBoolean("hasParent")) {
            new Notification()
                    .set("title", user.getStr("username")+"回复了你在 "
                            +Article.dao.findById(articleId).getStr("title")+" 的评论")
                    .set("to_user_id", getParaToInt("comment_user"))
                    .set("from_user_id", user.getInt("id"))
                    .set("article_id", articleId)
                    .save();
            new Comments().set("parent_id", getParaToInt("parent_id")).set("text", comment)
                    .set("article_id", articleId).set("user_id", user.getInt("id")).save();
        } else {
            new Comments().set("text", comment).set("article_id", articleId)
                    .set("user_id", user.getInt("id")).save();
        }
        Article article = Article.dao.findById(articleId);
        Integer comment_times = article.getInt("comment_times");
        article.set("comment_times", comment_times+1).update();
        renderJson(Ret.ok());
    }
}
