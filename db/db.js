const mysql2 = require("mysql2/promise");
const dotenv = require("dotenv");
const fs = require("fs");
const path = require("path");
dotenv.config();

const pool = mysql2.createPool({
  host: process.env.DB_HOST,
  user: process.env.DB_USERNAME,
  password: process.env.DB_PASSWORD,
  database: process.env.DB_DATABASE,
  port: process.env.DB_PORT,
  multipleStatements: true,
  ssl: {
    rejectUnauthorized: true, // REQUIRED
  },
});

const setupDatabase = async () => {
  const schemaPath = path.join(process.cwd(), "db", "schema.sql");
  const schema = fs.readFileSync(schemaPath, "utf-8");

  await pool.query(schema);
  console.log("Database initialized");

  const seedPath = path.join(process.cwd(), "db", "seed.sql");
  const insertSeed = fs.readFileSync(seedPath, "utf-8");
  await pool.query(insertSeed);
  console.log("Seed data inserted");
};

module.exports = { pool, setupDatabase };
