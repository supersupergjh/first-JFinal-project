package demo.service;


import com.jfinal.plugin.activerecord.Model;

public class BlogTag extends Model<BlogTag> {
    public static final BlogTag dao = new BlogTag().dao();
}
