const mongoose = require("mongoose");
const connectDB = require("../config/db");
const ServiceModel = require("../model/serviceModel");

const services = [
  {
    name: "Basic packet",
    image_url: "a",
    price: 10.99,
  },
];
async function seed() {
  await connectDB();
  try {
    await ServiceModel.deleteMany({});
    await ServiceModel.insertMany(services);
    console.log("Dummy Services seeded");
  } catch (e) {
    console.log(`Error while Adding data ${e}`);
    await mongoose.connection.close();
    console.log("Mongo Db connection closed");
    process.exit(1);
  } finally {
    await mongoose.connection.close();
    console.log("Mongo Db connection closed");
    process.exit(0);
  }
}
seed();
