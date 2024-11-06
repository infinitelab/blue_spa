const mongoose = require("mongoose");

const storeSchema = new mongoose.Schema({
  storeDetails: {
    name: {
      type: String,
      required: true,
    },
    location: {
      type: String,
      default: null,
    },
    description: {
      type: String,
      default: null,
    },
    image: {
      type: String,
      default: null,
    },
    email: {
      type: String,
      default: null,
    },
    mobile: {
      type: String,
      default: null,
    },
  },
  schedule: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "StoreSchedule",
  },
});

const Store = mongoose.model("Serviceprovider", storeSchema);
module.exports = Store;
