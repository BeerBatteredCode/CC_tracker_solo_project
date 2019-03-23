DROP TABLE transactions;
DROP TABLE tags;
DROP TABLE merchants;

CREATE TABLE tags (
  id SERIAL4 PRIMARY KEY,
  catagory VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  tag_id INT4 REFERENCES tags(id) ON DELETE CASCADE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  charge float(24),
  date TIMESTAMP NOT NULL DEFAULT CURRENT_DATE
);
