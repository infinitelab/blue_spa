const mongoose = require("mongoose");

const productAddonSchema = new mongoose.Schema({
  name: { type: String, required: true },
  description: String,
  price: { type: String, required: true },
  isAvailable: { type: Boolean, required: true, default: true },
});

const ProductAddOn = mongoose.model("ProductAddon", productAddonSchema);

module.exports = ProductAddOn;
