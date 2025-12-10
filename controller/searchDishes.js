const { pool } = require("../db/db");

async function searchDishes(req, res) {
  try {
    const { name, minPrice, maxPrice } = req.query;
    if (!name || minPrice === undefined || maxPrice === undefined) {
      return res.status(400).json({
        error: "Missing required query params: name, minPrice, maxPrice",
      });
    }
    const min = Number(minPrice);
    const max = Number(maxPrice);

    const sql = `
        SELECT r.restaurant_id AS restaurant_id,
            r.restaurant_name AS restaurant_name,
            r.city AS city,
            d.dish_name AS dish_name,
            d.price AS price,
            COUNT(o.order_id) AS order_count
        FROM Dish d
        RIGHT JOIN Restaurant r ON r.restaurant_id = d.restaurant_id
        LEFT JOIN orders o ON o.dish_id = d.dish_id AND o.restaurant_id = d.restaurant_id
        WHERE LOWER(d.dish_name) LIKE ? AND d.price BETWEEN ? AND ?
        GROUP BY restaurant_id, restaurant_name, city, dish_name, price
        ORDER BY order_count DESC;
      `;
    const dishName = name.toLowerCase();
    const [rows] = await pool.query(sql, [dishName, min, max]);
    const restaurants = rows.map((row) => ({
      restaurantId: row.restaurant_id,
      restaurantName: row.restaurant_name,
      city: row.city,
      dishName: row.dish_name,
      dishPrice: Number(row.price),
      orderCount: Number(row.order_count),
    }));
    console.log("Restaurants: ", restaurants);
    return res.status(200).json({ restaurants });
  } catch (error) {
    console.log("Error: ", error);
    return res.status(503).json({ error: "Internal Server Error" });
  }
}

module.exports = { searchDishes };
