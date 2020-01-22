DROP TABLE IF EXISTS albums;

DROP TABLE artists;


-- customer1 = Customer.new({'first_name' => 'Deirdre', 'last_name' => 'Barlow'})

-- order1 = PizzaOrder.new({
--   'customer_id' => customer1.id,
--   'topping' => 'uranium',
--   'quantity' => 2
--   })


CREATE TABLE artists (
    id SERIAL PRIMARY KEY,
    artist_name VARCHAR(255),
     last_name VARCHAR(255));


CREATE TABLE albums (
    id SERIAL PRIMARY KEY,
    title VARCHAR(255),
    genre VARCHAR(255),
    artist_id INT REFERENCES artists(id)
);
