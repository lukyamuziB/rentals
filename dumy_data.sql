\set last_update CURRENT_TIMESTAMP


INSERT INTO "category" ("name", "last_update")
VALUES
('horror', :last_update),
('mystry', :last_update);


INSERT INTO "language" ("name", "last_update")
VALUES
('English', :last_update),
('Spanish', :last_update);


INSERT INTO "film" (
    "title",
    "description",
    "release_year",
    "language_id",
    "rental_duration",
    "rental_rate",
    "length",
    "replacement_cost",
    "rating",
    "last_update",
    "fulltext"
)
VALUES
('sex and the city','sex in a city I guess', '2016-11-27 18:50:16', 1,  4, 45.23, '20:20', 30.1, 'PG 13', :last_update, 'This is the full text'),
('mom','two crazy mome', '2016-11-27 18:50:16', 2, 4, 45.23, '20:20', 30.1, 'PG 13', :last_update, 'This is the full text');


INSERT INTO "film_category" ("film_id", "category_id", "last_update")
VALUES
(1, 1, :last_update),
(2, 2, :last_update);


INSERT INTO "actor" ("first_name", "last_name", "last_update")
VALUES
('Chack', 'Noris', :last_update),
('Jack', 'Chan', :last_update);


INSERT INTO "film_actor" ("actor_id", "film_id", "last_update")
VALUES
(1, 1, :last_update),
(2, 2, :last_update);


INSERT INTO "country" ("country", "last_update")
VALUES
('Kenya', :last_update),
('Uganda', :last_update),
('USA', :last_update);


INSERT INTO "city" ("city", "country_id", "last_update")
VALUES
('Nairobi', 1, :last_update),
('Kampala', 2, :last_update),
('NYC', 3, :last_update);


INSERT INTO "address" (
    "address",
    "address2",
    "district",
    "city_id",
    "postal_code",
    "phone",
    "last_update"
)
VALUES
('Roysambu TRM drive', 'Kasarani', 'Nairobi', 1, '10001', '00089772', :last_update),
('3rd street bukoto', '4th avenue, Kam', 'Kampala', 2, '8980', '00076786', :last_update),
('23rd street', '9th street', 'NYC', 3, '9909', '009664763', :last_update);


INSERT INTO "store" ("manager_staff_id", "address_id", "last_update")
VALUES
(1, 1, :last_update),
(2, 2, :last_update),
(3, 3, :last_update);


INSERT INTO "staff" (
    "first_name",
    "last_name",
    "address_id",
    "email",
    "store_id",
    "active",
    "username",
    "password",
    "last_update"
)
VALUES
('sam', 'smith', 1, 'sam@store.com', 1, 'true', 'sam', 'samsmith', :last_update),
('john', 'doe', 2, 'john@store.com', 2, 'false', 'john', 'johndoe', :last_update),
('alice', 'jane', 3, 'alice@store.com', 3, 'true', 'alice', 'alicejane', :last_update);


INSERT INTO "customer" (
    "store_id",
    "first_name",
    "last_name",
    "email",
    "address_id",
    "activebool",
    "create_date",
    "last_update",
    "active"
)
VALUES
(1, 'janet', 'bar', 'janet@customer.com', 1, 'true', '2017-02-27 18:50:16', :last_update, 'true'),
(2, 'janice', 'bars', 'janice@customer.com', 2, 'true', '2017-02-27 18:50:16', :last_update, 'true'),
(3, 'justice', 'barz', 'justice@customer.com', 3, 'true', '2017-02-27 18:50:16', :last_update, 'true');


INSERT INTO "inventory" ("film_id", "store_id", "last_update")
VALUES
(1, 1, :last_update),
(2, 2, :last_update);


INSERT INTO "rental" (
    "rental_date",
    "inventory_id",
    "customer_id",
    "return_date",
    "staff_id",
    "last_update"
)
VALUES
('2017-02-27 18:50:16', 1, 3, '2017-11-27 18:50:16', 2, :last_update),
('2017-02-27 18:50:16', 2, 1, '2017-11-27 18:50:16', 1, :last_update);


INSERT INTO "payment" (
    "customer_id",
    "staff_id",
    "rental_id",
    "amount",
    "payment_date"
)
VALUES
(3, 1, 2, 23.43, '2017-11-27 18:50:16'),
(1, 2, 1, 1.43, '2017-10-27 19:50:16');
