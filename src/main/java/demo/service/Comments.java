package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class Comments extends Model<Comments> {
    public static final Comments dao = new Comments().dao();
}
