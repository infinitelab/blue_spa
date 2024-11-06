const mongoose = require("mongoose");
const connectDB = require("../config/db");
const ProductCategory = require("../model/productCategory");

const categories = [
  {
    name: "Foods",
    
  },
  {
    name: "Snacks",
  },
  {
    name: "Smoothies",
  },
  {
    name: "Drinks",
  },
  {
    name: "Cooktails",
  },
  {
    name: "Wein Bier sekt",
  },
  {
    name: "Heisse-getranke",
  },
  {
    name: "Aufgusse",
  },
  {
    name: "Frottierware",
  },
  {
    name: "wellnessextras",
  },
];

async function seed() {
  try {
    await connectDB();
    console.log("DB connection success");
    await ProductCategory.deleteMany({});
    await ProductCategory.insertMany(categories);
    console.log("Product category seed Sucess");
  } catch (e) {
    await mongoose.connection.close();
    console.log("Mongo connection closed");
    process.exit(1);
  } finally {
    await mongoose.connection.close();
    console.log("Mongo connection close");
    process.exit(0)
  }
}

seed();
