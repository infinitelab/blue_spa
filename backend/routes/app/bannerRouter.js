const express = require("express");

const router = express.Router();

const { banners } = require("../../controller/app/bannerController");

router.get("/", banners);

module.exports = router;
