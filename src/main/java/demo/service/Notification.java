package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class Notification extends Model<Notification> {
    public static final Notification dao = new Notification().dao();
}
