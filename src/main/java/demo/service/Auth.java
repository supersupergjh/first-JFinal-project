package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class Auth extends Model<Auth> {
    public static final Auth dao = new Auth().dao();
}
