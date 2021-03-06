DROP TABLE transactions;
DROP TABLE stamps;
DROP TABLE merchants;

CREATE TABLE stamps (
  id SERIAL4 PRIMARY KEY,
  category VARCHAR(255)
);

CREATE TABLE merchants (
  id SERIAL4 PRIMARY KEY,
  name VARCHAR(255)
);

CREATE TABLE transactions (
  id SERIAL4 PRIMARY KEY,
  stamp_id INT4 REFERENCES stamps(id) ON DELETE CASCADE,
  merchant_id INT4 REFERENCES merchants(id) ON DELETE CASCADE,
  charge FLOAT(24),
  is_charitable BOOLEAN,
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP(0)
);
