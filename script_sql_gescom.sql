CREATE DATABASE gescom_1;

USE gescom_1;

CREATE TABLE categories(
   cat_id INT,
   cat_name VARCHAR(50),
   cat_ss_id INT NOT NULL,
   PRIMARY KEY(cat_id),
   FOREIGN KEY(cat_ss_id) REFERENCES categories(cat_id)
);

CREATE TABLE countries(
   cou_id VARCHAR(2),
   cou_name VARCHAR(45),
   PRIMARY KEY(cou_id)
);

CREATE TABLE customers(
   cus_id INT,
   cus_lastname VARCHAR(50),
   cus_firstname VARCHAR(50),
   cus_address VARCHAR(150),
   cus_zipcode VARCHAR(5),
   cus_city VARCHAR(50),
   cus_countries_id VARCHAR(2) NOT NULL,
   cus_mail VARCHAR(255),
   cus_password VARCHAR(60),
   cus_add_date DATETIME,
   cus_update_date DATETIME,
   PRIMARY KEY(cus_id),
   FOREIGN KEY(cus_countries_id) REFERENCES countries(cou_id)
);

CREATE TABLE orders(
   ord_id INT,
   ord_order_date DATE,
   ord_payment_date DATE,
   ord_ship_date DATE,
   ord_reception_date DATE,
   ord_status VARCHAR(25),
   ord_cus_id INT NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(ord_cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE posts(
   pos_id INT,
   pos_libelle VARCHAR(30),
   PRIMARY KEY(pos_id)
);

CREATE TABLE employees(
   emp_id INT,
   emp_superior_id INT NOT NULL,
   emp_pos_id INT NOT NULL,
   emp_lastname VARCHAR(50),
   emp_firstname VARCHAR(50),
   emp_adress VARCHAR(150),
   emp_zipcode VARCHAR(5),
   emp_city VARCHAR(50),
   emp_mail VARCHAR(255),
   emp_phone INT,
   emp_salary INT,
   emp_enter_date DATE,
   emp_gender VARCHAR(1),
   emp_children SMALLINT,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(emp_superior_id) REFERENCES employees(emp_id),
   FOREIGN KEY(emp_pos_id) REFERENCES posts(pos_id)
);

CREATE TABLE suppliers(
   sup_id INT,
   sup_name VARCHAR(50),
   sup_city VARCHAR(50),
   sup_countries_id VARCHAR(2) NOT NULL,
   sup_address VARCHAR(150),
   sup_zipcode VARCHAR(5),
   sup_contact VARCHAR(100),
   sup_phone VARCHAR(10),
   sup_mail VARCHAR(75),
   sup_emp_id INT NOT NULL,
   PRIMARY KEY(sup_id),
   FOREIGN KEY(sup_emp_id) REFERENCES employees(emp_id),
   FOREIGN KEY(sup_countries_id) REFERENCES countries(cou_id)
);

CREATE TABLE products(
   pro_id INT,
   pro_cat_id INT NOT NULL,
   pro_price DECIMAL(7,2),
   pro_ref VARCHAR(8),
   pro_ean VARCHAR(13),
   pro_stock INT,
   pro_stock_alert INT,
   pro_color VARCHAR(30),
   pro_name VARCHAR(50),
   pro_desc TEXT,
   pro_publish SMALLINT,
   pro_sup_id INT NOT NULL,
   pro_add_date DATETIME,
   pro_update_date DATETIME,
   pro_picture VARCHAR(50),
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_sup_id) REFERENCES suppliers(sup_id),
   FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id)
);

CREATE TABLE orders_details(
   ode_id INT,
   ode_unit_price DECIMAL(7,2),
   ode_discount DECIMAL(4,2),
   ode_quantity INT,
   ode_ord_id INT NOT NULL,
   ode_pro_id INT NOT NULL,
   PRIMARY KEY(ode_id),
   FOREIGN KEY(ode_ord_id) REFERENCES orders(ord_id),
   FOREIGN KEY(ode_pro_id) REFERENCES products(pro_id)
);
