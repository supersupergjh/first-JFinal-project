package demo.service;

import com.jfinal.plugin.activerecord.Model;

public class Carousel extends Model<Carousel> {
    public static final Carousel dao = new Carousel().dao();
}
