const express = require("express");
const router = express.Router();
const authMiddleware = require("../middleware/authMiddleware");
//Admin
const adminAuthRouter = require("./admin/authRouter");

router.use("admin", adminAuthRouter);

//App
const appAuthRouter = require("./app/authRouter");
const appBannerRouter = require("./app/bannerRouter");
router.use("/app", appAuthRouter);
router.use("/app/banner", authMiddleware, appBannerRouter);

module.exports = router;
