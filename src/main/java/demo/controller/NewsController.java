package demo.controller;

import com.jfinal.core.Controller;

public class NewsController extends Controller {

    public void index() {
        render("/WEB-INF/view/blog/news.html");
    }
}
