package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class SystemLinks extends Model<SystemLinks> {
    public static final SystemLinks dao = new SystemLinks().dao();
}
