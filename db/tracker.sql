DROP TABLE transactions;
DROP TABLE stamps;
DROP TABLE merchants;
DROP TABLE budget;

CREATE TABLE budgets (
  id SERIAL4 PRIMARY KEY,
  label VARCHAR(255),
  total FLOAT(24),
  starting DATE,
  ending DATE
);

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
  budget_id INT4 REFERENCES budgets(id) ON DELETE CASCADE,
  charge FLOAT(24),
  date TIMESTAMP NOT NULL DEFAULT CURRENT_TIMESTAMP
);
