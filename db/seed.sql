-- Insert Restaurants
INSERT INTO Restaurant (restaurant_name, city)
VALUES 
    ('The Spice House', 'Prayagraj'),
    ('Ocean Breeze Cafe', 'Banaras'),
    ('Urban Grill', 'Bengluru'),
    ('Pasta Palace', 'Pune'),
    ('Bombay Biryani Corner', 'Hydrabad');

-- Insert Dishes
INSERT INTO Dish (dish_name, price, restaurant_id)
VALUES
    ('Paneer Butter Masala', 220.00, 1),
    ('Tandoori Roti', 20.00, 1),
    ('Veg Biryani', 180.00, 1),

    ('Grilled Salmon', 450.00, 2),
    ('Veg Biryani', 180.00, 2),

    ('Cheese Burger', 150.00, 3),
    ('French Fries', 80.00, 3),

    ('Paneer Butter Masala', 300.00, 4),
    ('Veg Biryani', 90.00, 4),

    ('Chicken Biryani', 250.00, 5),
    ('Tandoori Roti', 30.00, 5),
    ('Veg Biryani', 140.00, 5);


-- Insert Orders
INSERT INTO Orders (dish_id, restaurant_id)
VALUES
    (1, 1), 
    (4, 2), 
    (7, 3), 
    (8, 4), 
    (10, 5),
    (3, 1), 
    (3, 1), 
    (3, 5),
    (11, 5);
