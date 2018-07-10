package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class BlogCategory extends Model<BlogCategory> {
    public static final BlogCategory dao = new BlogCategory().dao();

}
