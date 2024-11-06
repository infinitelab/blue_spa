const User = require("../../model/userModel");
const jwt = require("jsonwebtoken");

function generateToken(user) {
  const payload = { id: user._id, name: user.name, email: user.email };
  //const options = { expiresIn: '1h' };
  return jwt.sign(payload, process.env.JWT_SECRET);
}

exports.signup = async (req, res) => {
  const { name, email, password } = req.body;

  try {
    /* res.status(201).json({
      id: name,
      name: email,
      email: password,
      role: role,
      token: "random",
    }); */
    const userExist = await User.findOne({ email });
    if (userExist) {
      return res.status(400).json({ message: "User already exist" });
    }
    const user = await User.create({
      name,
      email,
      password,
      role: "user",
    });

    const token = generateToken(user);

    res.status(201).json({
      id: user._id,
      name: user.name,
      email: user.email,
      token: token,
    });
  } catch (error) {
    res.status(500).json({ message: `Error registering user ${error}` });
  }
};

exports.signin = async (req, res) => {
  const { email, password } = req.body;

  try {
    const user = await User.findOne({ email });
    if (user && (await user.matchPassword(password))) {
      const token = generateToken(user);
      res.json({
        id: user._id,
        name: user.name,
        email: user.email,
        token: token,
      });
    } else {
      res.status(401).json({ message: "Invalid email or password" });
    }
  } catch (error) {
    res.status(500).json({ message: `Error logging in ${error}` });
  }
};
