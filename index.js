const { Sequelize } = require("sequelize");
const { Client } = require("pg");
const express = require("express");
const server = express();
const bodyParser = require("body-parser");
let ejsLayouts = require("express-ejs-layouts");

server.set("view engine", "ejs");
server.use(ejsLayouts);
server.use(express.static("public"));
server.use(express.urlencoded({ extended: false }));
server.use(express.json());

const sequelize = new Sequelize("postgres://postgres:8007@localhost:5432/WOR_Eats");

async function connectionDB() {
  try {
    await sequelize.authenticate();
    console.log("Connection has been established successfully.");
  } catch (error) {
    console.error("Unable to connect to the database:", error);
  }
}
connectionDB();

const client = new Client({
  host: "localhost",
  user: "postgres",
  port: 5432,
  password: "8007",
  database: "WOR_Eats",
});
client.connect();+

server.get("/", async (req, res) => {
  const data = await client.query("SELECT * FROM Menu_Item;");
  res.render("home", { data: data.rows });
});

// Ensure this route exists in index.js
server.get("/kart", (req, res) => {
  res.render("kart"); // Renders the kart.ejs page
});
server.post("/confirmOrder", (req, res) => {
  const { name, phonenumber, address } = req.body;

  if (name && phonenumber && address) {
    console.log("Order confirmed for", name);
    // Additional processing can be done here (e.g., saving order to database)
  }

  res.render("kart", { message: "Your order is confirmed" });
});

server.get('/search', async (req, res) => {
  const query = req.query.query;

  try {
    const result = await client.query(
      "SELECT * FROM Menu_Item WHERE item_name ILIKE $1 OR description ILIKE $1 OR category ILIKE $1",
      [`%${query}%`]
    );
    res.render('home', { data: result.rows });
  } catch (err) {
    console.error(err);
    res.status(500).send('Error occurred while processing your request');
  }
});

server.post("/addProduct", async (req, res) => {
  await client.query(`
    INSERT INTO Menu_Item (item_id, item_name, category, description, price, img)
    VALUES
      (1, 'Cheeseburger', 'Burgers', 'Juicy beef patty with melted cheese', 9.99, 'https://www.eatingwell.com/thmb/aKA6WL4j01orJ6F7v9bF4PH6B7Y=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/air-fryer-cheeseburgers-9e0cf0071bcb4b8d9bc806cabfb61347.jpg'),
      (2, 'Margherita Pizza', 'Pizza', 'Classic pizza with tomato sauce, mozzarella, and basil', 11.99, 'https://www.tasteofhome.com/wp-content/uploads/2018/01/Homemade-Pizza_EXPS_FT23_376_EC_120123_3.jpg')
    ON CONFLICT DO NOTHING;
  `);
  res.send("Data Inserted");
});

server.get("/login", (req, res) => {
  const { email, password } = req.query;
  res.render("login");
});

server.post("/login", async (req, res) => {
  const { email, password } = req.body;

  try {
    const result = await client.query("SELECT * FROM userinfo WHERE email = $1", [email]);

    if (result.rows.length > 0) {
      res.redirect("/"); // Redirect user to the home page on successful login
    } else {
      res.status(401).send("Invalid email or password");
    }

  } catch (err) {
    console.error(err);
    res.status(500).send("Error occurred while processing your request");
  }
});

server.get("/register", async (req, res) => {
  await res.render("register");
});

server.post("/register", async (req, res) => {
  const { name, email, password, deliveryaddress } = req.body;

  try {
    const userCheck = await client.query("SELECT * FROM userinfo WHERE email = $1", [email]);
    if (userCheck.rows.length > 0) {
      return res.redirect("/register");
    }

    const result = await client.query(
      "INSERT INTO userinfo (name, email, password, deliveryaddress) VALUES ($1, $2, $3, $4) RETURNING *",
      [name, email, password, deliveryaddress]
    );
    res.redirect("/");
  } catch (err) {
    console.error(err);
    res.redirect("/register");
  }
});

server.listen(8000, () => {
  console.log("Server Working");
});
