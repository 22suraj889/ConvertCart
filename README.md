# ConvertCart

A restaurant and dish search API that allows users to discover dishes within a specific price range across multiple restaurants.

## Table of Contents

- [Prerequisites](#prerequisites)
- [Setup Instructions](#setup-instructions)
- [Running the Server](#running-the-server)
- [API Documentation](#api-documentation)
- [Project Structure](#project-structure)

## Prerequisites

- Node.js (v14 or higher)
- npm (v6 or higher)
- MySQL/TiDB database
- A `.env` file with database credentials

## Setup Instructions

### 1. Install Dependencies

```bash
npm install
```

This will install all required packages:

- `express` - Web framework
- `mysql2/promise` - MySQL database driver with promise support
- `cors` - Cross-Origin Resource Sharing middleware
- `dotenv` - Environment variable management
- `nodemon` - Development server with auto-reload

### 2. Configure Environment Variables

Create a `.env` file in the project root with the following variables:

```env
DB_HOST=your_database_host
DB_PORT=your_database_port
DB_USERNAME=your_database_username
DB_PASSWORD=your_database_password
DB_DATABASE=your_database_name
PORT=5000
```

### 3. Database Setup

The application automatically initializes the database on startup using:

- `db/schema.sql` - Creates tables (Restaurant, Dish, Orders)
- `db/seed.sql` - Populates sample data

No manual database setup is required. The schema and seed data are applied automatically when the server starts.

### Database Schema

The application uses three main tables:

**Restaurant**

- `restaurant_id` (INT, PRIMARY KEY)
- `restaurant_name` (VARCHAR)
- `city` (VARCHAR)

**Dish**

- `dish_id` (INT, PRIMARY KEY)
- `dish_name` (VARCHAR)
- `price` (DECIMAL)
- `restaurant_id` (INT, FOREIGN KEY)

**Orders**

- `order_id` (INT, PRIMARY KEY)
- `dish_id` (INT, FOREIGN KEY)
- `restaurant_id` (INT, FOREIGN KEY)

## Running the Server

### Development Mode

Start the server with auto-reload on file changes:

```bash
npm start
```

The server will start on `http://localhost:5000` (or the port specified in your `.env` file).

You should see:

```
DB Initialized.
Seed data inserted
Server is running...
```

### Verify Server is Running

Open your browser or use curl to check the health endpoint:

```bash
curl http://localhost:5000
```

Expected response:

```json
{
  "message": "Listening"
}
```

## API Documentation

### Search Dishes Endpoint

**Endpoint:** `GET /search/dishes`

**Query Parameters:**

- `name` (required) - Dish name to search for (case-insensitive)
- `minPrice` (required) - Minimum price filter
- `maxPrice` (required) - Maximum price filter

**Response:** Returns an array of restaurants that serve matching dishes

### Example Usage

#### Using cURL

Search for "Veg Biryani" with price between 100 and 200:

```bash
curl "http://localhost:5000/search/dishes?name=veg%20biryani&minPrice=100&maxPrice=200"
```

### Example Response

```json
{
  "restaurants": [
    {
      "restaurantId": 1,
      "restaurantName": "The Spice House",
      "city": "Prayagraj",
      "dishName": "Veg Biryani",
      "dishPrice": 180,
      "orderCount": 2
    },
    {
      "restaurantId": 2,
      "restaurantName": "Ocean Breeze Cafe",
      "city": "Banaras",
      "dishName": "Veg Biryani",
      "dishPrice": 180,
      "orderCount": 0
    }
  ]
}
```

### Error Handling

## Project Structure

```
convertCart/
├── app.js                      # Main Express application
├── package.json                # Project dependencies
├── .env                        # Environment variables (git-ignored)
├── .gitignore                  # Git ignore rules
├── README.md                   # This file
├── controller/
│   └── searchDishes.js         # Dish search controller
└── db/
    ├── db.js                   # Database connection and setup
    ├── schema.sql              # Database schema
    └── seed.sql                # Sample data
```
