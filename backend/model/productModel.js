const mongoose = require("mongoose");

const productSchema = new mongoose.Schema({
  title: { type: String, required: true },
  category: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "ProductCategory",
    required: true,
  },
  description: String,
  image: String,
  price: { type: Number, required: true },
  allergenInfo: String,
  stock: { type: Number, default: 0 },
  stockable: { type: Boolean },
  isAvailable: { type: Boolean, default: true },
  orderableAtBooking: { type: Boolean, default: true },
  orderableAtLocation: { type: Boolean, default: true },
  addOn: [{ type: mongoose.Schema.Types.ObjectId, ref: "ProductAddon" }],
});

const Product = mongoose.model("Product", productSchema);

module.exports = Product;
