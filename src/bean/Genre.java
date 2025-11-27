package bean;

public class Genre {
    private int genreId;
    private String genreNameId; // Dựa trên tên cột `genre_name_id`
    // Foreign Keys
    private Integer menuItemId; // FK: cook_menu (Đây có thể là mối quan hệ 1-n, xem xét lại thiết kế DB)

    // Constructors...
    // Getters and Setters...
}
