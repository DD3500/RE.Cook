package bean;

public class CookMenu {
    private int menuItemId;
    private String dishName;
    private String description;
    // Foreign Keys
    private Integer couponId;    // FK: coupon
    private Integer favoriteId;  // FK: favorite_menu
    private Integer storeId;     // FK: store

    // Constructors...
    // Getters and Setters...
}
