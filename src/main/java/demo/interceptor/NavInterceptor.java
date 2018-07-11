package demo.interceptor;


import com.jfinal.aop.Interceptor;
import com.jfinal.aop.Invocation;
import com.jfinal.core.Controller;
import demo.service.*;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.List;

public class NavInterceptor implements Interceptor {
    public void intercept(Invocation inv) {
        Controller con=inv.getController();
        con.setAttr("user_list", User.dao);
        HttpSession session = inv.getController().getSession();
        if(session == null){
            con.setAttr("isLogin", false);
        }
        else{
            User user = (User) session.getAttribute("User");
            if(user != null) {
                con.setAttr("isLogin", true);
                con.setAttr("user", user);

                List<Notification> notifications = Notification.dao
                        .find("select * from vmaig_system_notification where to_user_id=? and is_read=0",
                                user.getInt("id"));
                Integer notification_count = 0;
                for (Notification i : notifications) {
                    notification_count++;
                }
                con.setAttr("notification_count", notification_count);
            }
            else {
                con.setAttr("isLogin", false);
            }
        }
        con.setAttr("website_title", "myBlog");
        con.setAttr("blog_category", BlogCategory.dao);
        con.setAttr("blog_tag", BlogTag.dao);
        con.setAttr("latest_comment_list", Comments.dao
                .find("select * from vmaig_comments_comment order by create_time desc LIMIT 10"));
        con.setAttr("hot_article_list", Article.dao
                .find("select * from blog_article order by view_times desc LIMIT 8"));
        con.setAttr("links", SystemLinks.dao.find("select * from vmaig_system_link order by id asc"));

        List<String> navList = new ArrayList<String>();
        navList.add("linux环境编程");
        navList.add("反汇编");
        navList.add("python");
        navList.add("Django");
        con.setAttr("nav_list", navList);
        inv.invoke();
    }
}
