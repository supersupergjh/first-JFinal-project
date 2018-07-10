package demo.controller;
import com.jfinal.core.Controller;
import demo.service.User;

public class HelloController extends Controller {
    public void index() {
        renderText("Hello JFinal World.");
    }

    public void printSomething() {
        renderText("hi");
    }

    public void add() {
        //new User().set("id", 2).set("title", "sdada").set("content", "abc").save();
        renderText("hi");
    }
}
