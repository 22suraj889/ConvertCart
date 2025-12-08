-- Insert Restaurants
INSERT INTO Restaurant (restaurant_name)
VALUES 
    ('The Spice House'),
    ('Ocean Breeze Cafe'),
    ('Urban Grill'),
    ('Pasta Palace'),
    ('Bombay Biryani Corner');

-- Insert Dishes
INSERT INTO Dish (dish_name, price, restaurant_id)
VALUES
    ('Paneer Butter Masala', 220.00, 1),
    ('Tandoori Roti', 20.00, 1),
    ('Veg Biryani', 180.00, 1),

    ('Grilled Salmon', 450.00, 2),
    ('Caesar Salad', 180.00, 2),

    ('Cheese Burger', 150.00, 3),
    ('French Fries', 80.00, 3),

    ('Creamy Alfredo Pasta', 300.00, 4),
    ('Garlic Bread', 90.00, 4),

    ('Chicken Biryani', 250.00, 5),
    ('Mutton Biryani', 320.00, 5),
    ('Cold Drink', 40.00, 5);


-- Insert Orders
INSERT INTO Orders (dish_id)
VALUES
    (1), 
    (4), 
    (7), 
    (8), 
    (10),
    (3), 
    (11);
