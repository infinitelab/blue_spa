const mongoose = require("mongoose");

const bannerSchema = new mongoose.Schema({
  identifier: {
    type: {
      type: String,
      required: true,
    },
    value: {
      type: String,
      required: false,
    },
  },
  banner: {
    image_url: {
      type: String,
      required: true,
    },
    title: {
      type: String,
    },
    expiry: {
      type: Date,
    },
  },
  page_details: {
    keywords: { type: [String], default: [] },
    created_at: { type: Date, defaul: Date.now() },
    updated_at: { type: Date, defaul: Date.now },
  },
});

const Banner = mongoose.model("Banner", bannerSchema);

module.exports = Banner;
