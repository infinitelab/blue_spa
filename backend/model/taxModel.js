const mongoose = require("mongoose");

const taxSchema = new mongoose.Schema({
  title: {
    type: String,
    required: true,
  },
  sales_tax: {
    type: mongoose.Decimal128,
    get: (v) => (v ? parseFloat(v.toString()) : null),
    set: (v) => mongoose.Types.Decimal128.fromString(parseFloat(v).toFixed(2)),
    required: true,
  },
  is_default_tax: {
    type: Boolean,
    default: false,
  },
});

const Tax = mongoose.model("Tax", taxSchema);

module.exports = Tax;
