CREATE DATABASE gescom_1;

USE gescom_1;

CREATE TABLE categories(
   cat_id INT(10) NOT NULL,
   cat_name VARCHAR(50) NOT NULL,
   cat_parent_id INT(10) DEFAULT NULL,
   PRIMARY KEY(cat_id),
   FOREIGN KEY(cat_parent_id) REFERENCES categories(cat_id)
);

CREATE TABLE countries(
   cou_id CHAR(2) NOT NULL,
   cou_name VARCHAR(45) NOT NULL,
   PRIMARY KEY(cou_id)
);

CREATE TABLE customers(
   cus_id INT(10) NOT NULL,
   cus_lastname VARCHAR(50) NOT NULL,
   cus_firstname VARCHAR(50) NOT NULL,
   cus_address VARCHAR(150) NOT NULL,
   cus_zipcode VARCHAR(5) NOT NULL,
   cus_city VARCHAR(50) NOT NULL,
   cus_countries_id CHAR(2) NOT NULL,
   cus_mail VARCHAR(255),
   cus_phone INT(10) NOT NULL,
   cus_password VARCHAR(60) NOT NULL,
   cus_add_date DATETIME NOT NULL,
   cus_update_date DATETIME DEFAULT NULL,
   PRIMARY KEY(cus_id),
   FOREIGN KEY(cus_countries_id) REFERENCES countries(cou_id)
);

CREATE TABLE orders(
   ord_id INT(10) NOT NULL,
   ord_order_date DATE NOT NULL,
   ord_payment_date DATE DEFAULT NULL,
   ord_ship_date DATE DEFAULT NULL,
   ord_reception_date DATE DEFAULT NULL,
   ord_status VARCHAR(25) NOT NULL,
   ord_cus_id INT(10) NOT NULL,
   PRIMARY KEY(ord_id),
   FOREIGN KEY(ord_cus_id) REFERENCES customers(cus_id)
);

CREATE TABLE posts(
   pos_id INT(10) NOT NULL,
   pos_libelle VARCHAR(30),
   PRIMARY KEY(pos_id)
);

CREATE TABLE employees(
   emp_id INT(10) NOT NULL,
   emp_superior_id INT(10) NOT NULL,
   emp_pos_id INT(10) NOT NULL,
   emp_lastname VARCHAR(50),
   emp_firstname VARCHAR(50),
   emp_adress VARCHAR(150),
   emp_zipcode VARCHAR(5),
   emp_city VARCHAR(50),
   emp_mail VARCHAR(255),
   emp_phone INT(10) NOT NULL,
   emp_salary INT(10) DEFAULT NULL,
   emp_enter_date DATE NOT NULL,
   emp_gender CHAR(1) NOT NULL,
   emp_children TINYINT(2) NOT NULL,
   PRIMARY KEY(emp_id),
   FOREIGN KEY(emp_superior_id) REFERENCES employees(emp_id),
   FOREIGN KEY(emp_pos_id) REFERENCES posts(pos_id)
);

CREATE TABLE suppliers(
   sup_id INT(10) NOT NULL,
   sup_name VARCHAR(50),
   sup_city VARCHAR(50),
   sup_countries_id CHAR(2) NOT NULL,
   sup_address VARCHAR(150) NOT NULL,
   sup_zipcode VARCHAR(5),
   sup_contact VARCHAR(100) NOT NULL,
   sup_phone VARCHAR(10),
   sup_mail VARCHAR(75) NOT NULL,
   PRIMARY KEY(sup_id),
   FOREIGN KEY(sup_countries_id) REFERENCES countries(cou_id)
);

CREATE TABLE products(
   pro_id INT(10) NOT NULL,
   pro_cat_id INT(10) NOT NULL,
   pro_price DECIMAL(7,2) NOT NULL,
   pro_ref VARCHAR(8),
   pro_ean VARCHAR(13),
   pro_stock INT(5),
   pro_stock_alert INT(5),
   pro_color VARCHAR(30),
   pro_name VARCHAR(50),
   pro_desc TEXT,
   pro_publish TINYINT(1),
   pro_sup_id INT(10) NOT NULL,
   pro_add_date DATETIME NOT NULL,
   pro_update_date DATETIME DEFAULT NULL,
   pro_picture VARCHAR(50),
   PRIMARY KEY(pro_id),
   FOREIGN KEY(pro_sup_id) REFERENCES suppliers(sup_id),
   FOREIGN KEY(pro_cat_id) REFERENCES categories(cat_id)
);

CREATE TABLE orders_details(
   ode_id INT(10) NOT NULL,
   ode_unit_price DECIMAL(7,2) NOT NULL,
   ode_discount DECIMAL(4,2) DEFAULT NULL,
   ode_quantity INT(5) NOT NULL,
   ode_ord_id INT(10) NOT NULL,
   ode_pro_id INT(10) NOT NULL,
   PRIMARY KEY(ode_id),
   FOREIGN KEY(ode_ord_id) REFERENCES orders(ord_id),
   FOREIGN KEY(ode_pro_id) REFERENCES products(pro_id)
);
