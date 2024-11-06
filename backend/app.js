const express = require("express");
const connectDB = require("./config/db");
const dotenv = require("dotenv");
const cors = require("cors");

dotenv.config();
connectDB();

const mainRouter = require("./routes/index");

const app = express();
app.use(express.json());
app.use(
  cors({
    origin: "http://localhost:3000",
    methods: ["GET", "POST", "PUT", "DELETE"],
  })
);

app.use(mainRouter);
app.use((req, res) => {
  res.status(404).json({ message: "No route found" });
});

const PORT = process.env.PORT || 4000;
app.listen(PORT, process.env.IP,() => {
  console.log(`Server running on PORT: ${PORT}`);
});
