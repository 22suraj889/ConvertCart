CREATE TABLE IF NOT EXISTS Restaurant (
    restaurant_id INT PRIMARY KEY AUTO_INCREMENT,
    restaurant_name VARCHAR(255) NOT NULL
);

CREATE TABLE IF NOT EXISTS Dish (
    dish_id INT PRIMARY KEY AUTO_INCREMENT,
    dish_name VARCHAR(255) NOT NULL,
    price DECIMAL(10,2) NOT NULL,
    restaurant_id INT NOT NULL,
    FOREIGN KEY (restaurant_id) REFERENCES Restaurant(restaurant_id)
        ON DELETE CASCADE
);

CREATE TABLE IF NOT EXISTS Orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    dish_id INT NOT NULL,
    FOREIGN KEY (dish_id) REFERENCES Dish(dish_id)
        ON DELETE CASCADE
);
