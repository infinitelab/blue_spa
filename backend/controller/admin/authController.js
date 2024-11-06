const User = require("../../model/userModel");

exports.signup = async (req, res) => {
  const { name, email, password, role } = req.body;

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
      role,
    });

    res.status(201).json({
      id: user._id,
      name: user.name,
      email: user.email,
      role: user.role,
      token: "random",
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
      res.json({
        id: user._id,
        name: user.name,
        email: user.email,
        role: user.role,
        token: "random",
      });
    } else {
      res.status(401).json({ message: "Invalid email or password" });
    }
  } catch (error) {
    res.status(500).json({ message: `Error logging in ${error}` });
  }
};
