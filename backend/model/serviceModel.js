const mongoose = require("mongoose");

const serviceSchema = new mongoose.Schema({
  title: {
    type: String,
    required: false,
  },
  description: {
    type: String,
  },
  image: {
    type: String,
    required: true,
  },
  pricing: [
    {
      noOfGuest: { type: Number, required: true },
      duration: {
        hours: {
          type: Number,
        },
        minutes: {
          type: Number,
        },
      },
      earlyprice: {
        type: mongoose.Decimal128,
        get: (v) => (v ? parseFloat(v.toString()) : null),
        set: (v) =>
          mongoose.Types.Decimal128.fromString(parseFloat(v).toFixed(2)),
        required: true,
      },
      earlyprice: {
        type: mongoose.Decimal128,
        get: (v) => (v ? parseFloat(v.toString()) : null),
        set: (v) =>
          mongoose.Types.Decimal128.fromString(parseFloat(v).toFixed(2)),
        required: true,
      },
    },
  ],

  type: {
    type: String,
    default: "spa",
  },
});
const ServiceModel = mongoose.model("service", serviceSchema);

module.exports = ServiceModel;
