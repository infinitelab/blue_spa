const mongoose = require("mongoose");
require("dotenv").config();

const connectDB = async () => {
  try {
    await mongoose.connect(process.env.MONGO_DB, {});
    console.log("Mongo connection success");
  } catch (error) {
    console.log("Mongo connection failed:", error);
  }
};

module.exports = connectDB;
