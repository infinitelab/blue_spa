const mongoose = require("mongoose");

const servicePriceSchema = new mongoose.Schema({
  serviceId: {
    type: mongoose.Schema.Types.ObjectId,
    ref: "Service",
    required: true,
  },
  timeSlot: {
    type: String,
    required: true,
    enum: ["morning", "noon", "evening"],
  },
  price: { type: Number, required: true },
  startTime: { type: String, required: true },
  endTime: { type: String, required: true },
});

const ServicePrice = mongoose.model("ServicePrice", ServiceModel);

module.exports = ServicePrice;
