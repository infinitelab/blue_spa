const mongoose = require("mongoose");
const Banner = require("../model/bannerModel");
const User = require("../model/userModel");
const connectDB = require("../config/db");

const banners = [
  {
    identifier: { type: "page", value: "home" },
    banner: {
      title: "image_1",
      image_url:
        "https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      expiry: Date.now(), // Fix: Invoke Date.now()
    },
    page_details: {
      keywords: [],
    },
  },
  {
    identifier: { type: "page", value: "home" },
    banner: {
      title: "image_1",
      image_url:
        "https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      expiry: Date.now(),
    },
    page_details: {
      keywords: [],
    },
  },
  {
    identifier: { type: "page", value: "home" },
    banner: {
      title: "image_1",
      image_url:
        "https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      expiry: Date.now(),
    },
    page_details: {
      keywords: [],
    },
  },
  {
    identifier: { type: "page", value: "home" },
    banner: {
      title: "image_1",
      image_url:
        "https://images.pexels.com/photos/164005/pexels-photo-164005.jpeg?auto=compress&cs=tinysrgb&w=1260&h=750&dpr=1",
      expiry: Date.now(),
    },
    page_details: {
      keywords: [],
    },
  },
];

async function seed() {
  connectDB();
  try {
    await Banner.deleteMany({});
    await Banner.insertMany(banners);
    console.log("Banner seeder success");
  } catch (e) {
    console.log(`Error while seeding ${e}`);

    process.exit(1);
  } finally {
    await mongoose.connection.close();
    console.log("Mongo db connection closed");
    process.exit(0);
  }
}

seed();
