package demo.controller;

import com.jfinal.core.Controller;
import com.jfinal.kit.HashKit;
import com.jfinal.kit.Ret;
import com.jfinal.upload.UploadFile;
import demo.service.Comments;
import demo.service.Notification;
import demo.service.User;
import sun.misc.BASE64Decoder;

import javax.imageio.ImageIO;
import javax.imageio.stream.FileImageOutputStream;
import java.awt.image.BufferedImage;
import java.io.*;
import java.sql.Connection;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

// pascal
public class UserController extends Controller {
    // carmel
    //public void register() {
        // new User().set("name", getPara("username")).set("password", getPara("password")).set("img", "http://vmaig.qiniudn.com/image/tx/tx-default.jpg").set("email", getPara("email")).save();
    //}
    private static BASE64Decoder decoder = new BASE64Decoder();


    public void index() {
        if(getAttr("isLogin")){
            render("/WEB-INF/view/blog/user_changetx.html");
        } else {
            render("/WEB-INF/view/blog/login.html");
        }

    }

    public void notification() {
        Notification notification = Notification.dao.findById(getParaToInt("notification_id"));
        notification.set("is_read", 1).update();
        final int j = notification.get("article_id");
        renderJson(new HashMap<String, String>(){{
            put("url","/article?articleId="+j);
        }});
//        redirect("/article?articleId="+notification.get("article_id"));
        //render("/WEB-INF/view/blog/article.html?articleId="+notification.getInt("article_id"));
    }

    public void changePicture() {
        if(getAttr("isLogin")){
            render("/WEB-INF/view/blog/user_changetx.html");
        } else {
            render("/WEB-INF/view/blog/login.html");
        }
    }

    public void changePasswordPage() {
        if(getAttr("isLogin")){
            render("/WEB-INF/view/blog/user_changepassword.html");
        } else {
            render("/WEB-INF/view/blog/login.html");
        }
    }

    public void notificationPage() {
        if(getAttr("isLogin")){
            User user = getSessionAttr("User");
            setAttr("notifications", Notification.dao
                    .find("select * from vmaig_system_notification where to_user_id=?", user.getInt("id")));
            render("/WEB-INF/view/blog/user_notification.html");
        } else {
            render("/WEB-INF/view/blog/login.html");
        }
    }

    public void changetx() {
//        UploadFile file = getFile("tx", "/blog/static/img");
        String encodedTx = getPara("tx");
        try {
            User user = getSessionAttr("User");
            byte[] key = decoder.decodeBuffer(encodedTx);
            ByteArrayInputStream bais = new ByteArrayInputStream(key);
            BufferedImage bi1 = ImageIO.read(bais);
            File w2 = new File("/Users/guojinhong/Documents/myFirstJFinalProject/src/main/webapp/blog/static/img/" +user.getStr("username")+".jpg");
            ImageIO.write(bi1, "jpg", w2);
            user.set("img", "/blog/static/img/"+user.getStr("username")+".jpg").update();
            renderText("success");
        }catch (IOException e) {
            e.printStackTrace();
        }

    }

    public void newRegister() {
        render("/WEB-INF/view/blog/register.html");
    }

    public void reLogin() {
        removeSessionAttr("User");
        render("/WEB-INF/view/blog/login.html");
    }

    public void changePassword() {
        String oldPass = HashKit.md5(getPara("old_password"));
        Map<String, Object> errorInfo = new HashMap<String, Object>();
        errorInfo.put("errors", new ArrayList<String>());
        User user = getAttr("user");
        if(oldPass.equals(user.getStr("password"))){
            String pass1 = getPara("new_password1");
            String pass2 = getPara("new_password2");
            if(pass1.length() == 0 || pass2.length() == 0) {
                errorInfo.put("errors", new ArrayList<String>() {{
                    add("empty password!");
                }});
                renderJson(errorInfo);
                return;
            }
            if(!pass1.equals(pass2)) {
                errorInfo.put("errors", new ArrayList<String>() {{
                    add("password doesn't match");
                }});
                renderJson(errorInfo);
                return;
            }
            String pass = HashKit.md5(pass1);
            user.set("password", pass).update();
            renderJson(errorInfo);
        } else {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("wrong password!");
            }});
            renderJson(errorInfo);
        }

    }


    public void login() {
        String name = getPara("username");
        String pass = getPara("password");
        Map<String, Object> errorInfo = new HashMap<String, Object>();
        errorInfo.put("errors", new ArrayList<String>());
        if (null != name && name.length() > 0) {
            // jdbc prepareStatement
            String query = "select * from user where username=?";
            User user = User.dao.findFirst(query, name);
            if (user == null) {
                errorInfo.put("errors", new ArrayList<String>() {{
                    add("密码或者用户名不正确");
                }});
                renderJson(errorInfo);
            } else {
                pass = HashKit.md5(pass);
                String userPass = user.getStr("password");
                if (pass.equals(userPass)) {
                    setSessionAttr("User", user);
                    renderJson(errorInfo);
                } else {
                    errorInfo.put("errors", new ArrayList<String>() {{
                        add("密码或者用户名不正确");
                    }});
                    renderJson(errorInfo);
                }
            }
        }
    }

    public void register() {
        Map<String, Object> errorInfo = new HashMap<String, Object>();
        errorInfo.put("errors", new ArrayList<String>());
        String name = getPara("username");
        if(name.length() == 0) {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("empty username!");
            }});
            renderJson(errorInfo);
            return;
        }
        String nameQuery = "select * from user where username=?";
        User user = User.dao.findFirst(nameQuery, name);
        if(user != null) {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("username already exist!");
            }});
            renderJson(errorInfo);
            return;
        }

        String pass1 = getPara("password1");
        String pass2 = getPara("password2");
        if(pass1.length() == 0 || pass2.length() == 0) {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("empty password!");
            }});
            renderJson(errorInfo);
            return;
        }
        if(!pass1.equals(pass2)) {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("password doesn't match");
            }});
            renderJson(errorInfo);
            return;
        }

        String email = getPara("email");
        if(email.length() == 0) {
            errorInfo.put("errors", new ArrayList<String>() {{
                add("empty email!");
            }});
            renderJson(errorInfo);
            return;
        }
        String emailQuery = "select * from user where email=?";
        user = User.dao.findFirst(emailQuery, email);
        if(user != null) {
            errorInfo.put("error", new ArrayList<String>() {{
                add("email already exist");
            }});
            renderJson(errorInfo);
            return;
        }

        String pass = HashKit.md5(pass1);
        new User().set("username", name)
                .set("password", pass)
                .set("img", "/blog/static/img/favicon.ico")
                .set("email", email).save();
        user = User.dao.findFirst(nameQuery, name);
        setSessionAttr("User", user);
        renderJson(errorInfo);
    }

    public void logout() {
        removeSessionAttr("User");
        renderJson();
    }
}
