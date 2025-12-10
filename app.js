const express = require("express");
const app = express();
const { setupDatabase } = require("./db/db");
const cors = require("cors");
const { searchDishes } = require("./controller/searchDishes");

const PORT = process.env.PORT || 5000;
app.use(express.json());
app.use(cors());

setupDatabase()
  .then(() => {
    console.log("DB Initialized.");
  })
  .catch((err) => {
    console.error("DB Initialization failed:", err);
  });
app.get("/", (req, res) => {
  res.status(200).json({ message: "Listening" });
});
app.get("/search/dishes", searchDishes);
app.listen(PORT, () => {
  console.log("Server is running...");
});
