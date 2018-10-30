DROP TABLE IF EXISTS category CASCADE;
DROP TABLE IF EXISTS language CASCADE;
DROP TABLE IF EXISTS film CASCADE;
DROP TABLE IF EXISTS film_category CASCADE;
DROP TABLE IF EXISTS actor CASCADE;
DROP TABLE IF EXISTS film_actor CASCADE;
DROP TABLE IF EXISTS country CASCADE;
DROP TABLE IF EXISTS city CASCADE;
DROP TABLE IF EXISTS address CASCADE;
DROP TABLE IF EXISTS store CASCADE;
DROP TABLE IF EXISTS staff CASCADE;
DROP TABLE IF EXISTS customer CASCADE;
DROP TABLE IF EXISTS inventory CASCADE;
DROP TABLE IF EXISTS rental CASCADE;
DROP TABLE IF EXISTS payment CASCADE;


CREATE TABLE category (
    category_id SERIAL PRIMARY KEY,
    name VARCHAR (255),
    last_update TIMESTAMP
);


CREATE TABLE language (
    language_id SERIAL PRIMARY KEY,
    name VARCHAR(255),
    last_update TIMESTAMP
);


CREATE TABLE film (
    film_id SERIAL PRIMARY KEY,
    title VARCHAR (255),
    description VARCHAR (255),
    release_year TIMESTAMP,
    language_id INTEGER,
    rental_duration INTEGER,
    rental_rate NUMERIC (5, 2),
    length TIME,
    replacement_cost NUMERIC (5, 2),
    rating VARCHAR(18),
    last_update TIMESTAMP,
    special_features VARCHAR(255),
    fulltext VARCHAR(255),

    FOREIGN KEY (language_id) REFERENCES language (language_id) ON DELETE CASCADE
);


CREATE TABLE film_category (
    film_id INTEGER,
    category_id INTEGER,
    last_update TIMESTAMP,

    PRIMARY KEY (film_id, category_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE CASCADE,
    FOREIGN KEY (category_id) REFERENCES category (category_id) ON DELETE CASCADE
);


CREATE TABLE actor (
    actor_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    last_update TIMESTAMP
);


CREATE TABLE film_actor (
    actor_id INTEGER,
    film_id INTEGER,
    last_update TIMESTAMP,

    PRIMARY KEY (actor_id, film_id),
    FOREIGN KEY (film_id) REFERENCES film (film_id) ON DELETE CASCADE,
    FOREIGN KEY (actor_id) REFERENCES actor (actor_id) ON DELETE CASCADE
);


CREATE TABLE country (
    country_id SERIAL PRIMARY KEY,
    country VARCHAR(255),
    last_update TIMESTAMP
);


CREATE TABLE city (
    city_id SERIAL PRIMARY KEY,
    city VARCHAR(255),
    country_id INTEGER,
    last_update TIMESTAMP,

    FOREIGN KEY (country_id) REFERENCES country (country_id)
);


CREATE TABLE address (
    address_id SERIAL PRIMARY KEY,
    address VARCHAR(255),
    address2 VARCHAR(255),
    district VARCHAR(255),
    city_id INTEGER,
    postal_code VARCHAR(255),
    phone VARCHAR(255),
    last_update TIMESTAMP,

    FOREIGN KEY (city_id) REFERENCES city (city_id)
);


CREATE TABLE store (
    store_id SERIAL PRIMARY KEY,
    manager_staff_id INTEGER,
    address_id INTEGER NULL,
    last_update TIMESTAMP,

    FOREIGN KEY (address_id) REFERENCES address (address_id)
);


CREATE TABLE staff (
    staff_id SERIAL PRIMARY KEY,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    address_id INTEGER,
    email VARCHAR(255),
    store_id INTEGER,
    active BOOLEAN NOT NUlL,
    username VARCHAR(255),
    password VARCHAR(255),
    last_update TIMESTAMP,
    picture OID,

    FOREIGN KEY (address_id) REFERENCES address (address_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id)
);


CREATE TABLE customer (
    customer_id SERIAL PRIMARY KEY,
    store_id INTEGER,
    first_name VARCHAR(255),
    last_name VARCHAR(255),
    email VARCHAR(255),
    address_id INTEGER,
    activebool BOOLEAN NOT NUlL,
    create_date TIMESTAMP,
    last_update TIMESTAMP,
    active BOOLEAN,

    FOREIGN KEY (store_id) REFERENCES store (store_id),
    FOREIGN KEY (address_id) REFERENCES address (address_id)
);


CREATE TABLE inventory (
    inventory_id SERIAL PRIMARY KEY,
    film_id INTEGER,
    store_id INTEGER,
    last_update TIMESTAMP,

    FOREIGN KEY (film_id) REFERENCES film (film_id),
    FOREIGN KEY (store_id) REFERENCES store (store_id)
);


CREATE TABLE rental (
    rental_id SERIAL PRIMARY KEY,
    rental_date TIMESTAMP,
    inventory_id INTEGER,
    customer_id INTEGER,
    return_date TIMESTAMP,
    staff_id INTEGER,
    last_update TIMESTAMP,

    FOREIGN KEY (inventory_id) REFERENCES inventory (inventory_id),
    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id)
);


CREATE TABLE payment (
    payment_id SERIAL PRIMARY KEY,
    customer_id INTEGER,
    staff_id INTEGER,
    rental_id INTEGER,
    amount NUMERIC (5, 2),
    payment_date TIMESTAMP,

    FOREIGN KEY (customer_id) REFERENCES customer (customer_id),
    FOREIGN KEY (staff_id) REFERENCES staff (staff_id),
    FOREIGN KEY (rental_id) REFERENCES rental (rental_id)
);
