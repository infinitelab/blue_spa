const jwt = require("jsonwebtoken");
const User = require("../model/userModel");

const authMiddleware = async (req, res, next) => {
  try {
    const authHeader = req.headers.authorization;
    if (!authHeader || !authHeader.startsWith("Bearer ")) {
      return res.status(401).json({ message: "token not present or invalid" });
    }
    const token = authHeader.split(" ")[1];
    try {
      const decode = jwt.verify(token, process.env.JWT_SECRET);
      const user = await User.findById(decode.id);
      if (!user) {
        return res.status(401).json({ message: "User not found" });
      }
      req.user = user;
      next();
    } catch (e) {
      return res.status(401).json({ message: `Invalid token ${e}` });
    }
  } catch (e) {
    return res.status(401).json({ message: `UnAuthorized request ${e}` });
  }
};

module.exports = authMiddleware;
