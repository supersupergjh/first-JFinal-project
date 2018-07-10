package demo.common;
import com.jfinal.config.*;
import com.jfinal.core.JFinal;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.druid.DruidPlugin;
import com.jfinal.template.Engine;
import demo.controller.*;
import demo.interceptor.NavInterceptor;
import demo.service.*;


public class DemoConfig extends JFinalConfig {
    public void configConstant(Constants me) {
        me.setDevMode(true);
    }

    public void configRoute(Routes me) {

        me.add("/", IndexController.class, "/WEB-INF/view/blog");
        me.add("/news", NewsController.class,"/WEB-INF/view/blog");
        me.add("/all", AllController.class, "/WEB-INF/view/blog");
        me.add("/article",ArticleController.class, "/WEB-INF/view/blog");
        me.add("/user", UserController.class);
        me.add("/comment", CommentController.class,"/WEB-INF/view/blog");

    }

    public void configEngine(Engine me) {
        me.addSharedFunction("/WEB-INF/view/blog/base.html");
    }

    public void configPlugin(Plugins me) {
        loadPropertyFile("app_config.txt");
        DruidPlugin dp = new DruidPlugin(getProperty("jdbcUrl"),
                getProperty("user"), getProperty("password"));
        me.add(dp);
        ActiveRecordPlugin arp = new ActiveRecordPlugin(dp);
        me.add(arp);
        arp.addMapping("blog_carousel", Carousel.class);
        arp.addMapping("blog_article", Article.class);
        arp.addMapping("vmaig_system_link", SystemLinks.class);
        arp.addMapping("blog_category", BlogCategory.class);
        arp.addMapping("auth_group", Auth.class);
        arp.addMapping("user", User.class);
        arp.addMapping("vmaig_comments_comment", Comments.class);
        arp.addMapping("vmaig_system_notification", Notification.class);
    }

    public void configInterceptor(Interceptors me) {
        me.add(new NavInterceptor());
    }

    public void configHandler(Handlers me) {
    }


    public static void main(String[] args) {
        JFinal.start("src/main/webapp", 8080, "/");
    }
}