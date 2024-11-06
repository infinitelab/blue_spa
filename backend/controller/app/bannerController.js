const Banner = require("../../model/bannerModel");

exports.banners = async (req, res) => {
  try {
    const banners = await Banner.find();
    res.json(banners);
  } catch (e) {
    res.status(500).json({ message: `Unknwon error ${e}` });
  }
};
