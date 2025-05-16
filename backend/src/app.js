const express = require("express");
const cors = require("cors");
const helmet = require("helmet");
const morgan = require("morgan");
const app = express();
// Middleware
app.use(cors());
app.use(express.json());
// Health check route
app.use(express.static("public"));
app.get("/", (req, res) => {
  res.status(200).json({ check: "health", status: "OK" });
});
app.post("/sum", (req, res) => {
  const { num1, num2 } = req.body;
  res.status(200).json({ sum: num1 + num2 });
});
app.use((err, req, res, next) => {
  console.error(err.stack);
  res.status(500).json({ message: "Internal Server Error" });
});
module.exports = app;
