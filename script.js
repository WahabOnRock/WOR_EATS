const express = require('express');
const bodyParser = require('body-parser');
const { Pool } = require('pg');
const path = require('path');

const app = express();
const port = 3000;

// Database configuration
const pool = new Pool({
    user: 'postgres',
    host: 'localhost',
    database: 'WOR_Eats',
    password: '8007',
    port: 5432,
});

app.use(bodyParser.urlencoded({ extended: true }));
app.use(bodyParser.json());
app.use(express.static(path.join(__dirname, 'public')));

// Serve the login page
app.get('/', (req, res) => {
    res.sendFile(path.join(__dirname, 'index.html'));
});

app.post('/register',(req,res) => {
    const { name, email, password, deliveryaddress } = req.body;

    try {
        // Check if the user already exists
        const client = await pool.connect();
        const userCheck = await client.query('SELECT * FROM userinfo WHERE email = $1', [email]);
        if (userCheck.rows.length > 0) {
            res.status(400).send('User already exists');
            client.release();
            return;
            res.redirect("/");
        }



        // Insert the new user into the database
        const result = await client.query(
            'INSERT INTO userinfo (name, email, password, deliveryaddress) VALUES ($1, $2, $3, $4) RETURNING *',
            [name, email, password, deliveryaddress]
        );

        client.release();
        res.status(201).send('User registered successfully');
    } catch (err) {
        console.error(err);
        res.status(500).send('Error occurred while processing your request');
    }
})

// Handle login form submission
app.post('/login', async (req, res) => {
    const { email, password } = req.body;

    try {
        const client = await pool.connect();
        const result = await client.query('SELECT * FROM userinfo WHERE email = $1 AND password = $2', [email, password]);

        if (result.rows.length > 0) {
            res.send('Login successfully');
            // Redirect to the home page
            res.redirect('/home');
        } else {
            res.send('Invalid email or password');
        }

        client.release();
    } catch (err) {
        console.error(err);
        res.send('Error occurred while processing your request');
    }
});

// Serve the home page
app.get('/home', (req, res) => {
    res.send('<h1>Welcome to the Home Page</h1>');
});

app.listen(port, () => {
    console.log(`Server is running on http://localhost:${port}`);
});
