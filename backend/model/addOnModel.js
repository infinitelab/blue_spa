const mongoose = require("mongoose");

const addOnSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  description: {
    type: String,
  },
  image: {
    type: String,
  },
  price: {
    type: Number,
  },
  category: {
    type: String,
    required: true,
  },
});

const AddOn = mongoose.model("AddOn", addOnSchema);

module.exports = AddOn;
