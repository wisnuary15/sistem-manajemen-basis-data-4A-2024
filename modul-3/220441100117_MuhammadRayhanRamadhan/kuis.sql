CREATE DATABASE toko;

USE toko;

CREATE TABLE orderr(
id_order INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_customer INT (3) NOT NULL,
order_date DATE,
total_amount VARCHAR (25) NOT NULL
);
ALTER TABLE toko.orderr ADD CONSTRAINT fk_Customer FOREIGN KEY (id_customer) REFERENCES customers(id_customer);

CREATE TABLE customers(
id_customer INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
name_customer VARCHAR (15) NOT NULL,
email VARCHAR (15) NOT NULL
);

CREATE TABLE order_items(
id_order_item INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
id_order INT (3) NOT NULL,
id_product INT (3) NOT NULL,
quantity VARCHAR (25) NOT NULL,
unit_price VARCHAR (25) NOT NULL
);
ALTER TABLE toko.order_items ADD CONSTRAINT fk_orderItem FOREIGN KEY (id_order) REFERENCES orderr(id_order);
ALTER TABLE toko.order_items ADD CONSTRAINT fk_Product FOREIGN KEY (id_product) REFERENCES product(id_product);



CREATE TABLE product(
id_product INT (3) PRIMARY KEY NOT NULL AUTO_INCREMENT,
product_ame VARCHAR (15) NOT NULL,
category VARCHAR (15) NOT NULL,
unit_price VARCHAR (25) NOT NULL
);

INSERT INTO orderr (id_customer,order_date,total_amount) VALUES
(1,'2022-05-12','9000'),
(2,'2022-05-12','15000'),
(3,'2022-05-12','20000');

INSERT INTO customers (name_customer,email) VALUES
('sigma','sigma@gmail'),
('rafly','rafly@gmail'),
('ardi','ardi@gmail');

INSERT INTO order_items (id_order,id_product,quantity,unit_price) VALUES
(1,1,'3','3000'),
(2,2,'1','15000'),
(3,3,'2','10000');

INSERT INTO product (product_ame,category ,unit_price) VALUES
('es Teh','Minuman','3000'),
('soto','Makanan','15000'),
('Nasgor','Makanan','10000');

-- Soal1
DELIMITER //
CREATE PROCEDURE belanja(
IN id_pelanggan INT (3),
IN total_belanja VARCHAR (25)
)
BEGIN
SELECT * FROM orderr WHERE id_customer = id_pelanggan AND total_amount = total_belanja;
END //
DELIMITER ;
CALL belanja(1, '9000');


-- Soal2
DELIMITER //
CREATE PROCEDURE jumlahBrg(
IN idItem INT (3),
IN total_barang VARCHAR (25)
)
BEGIN
SELECT * FROM order_items WHERE id_order_item = idItem AND quantity = total_barang;
END //
DELIMITER ;
CALL jumlahBrg(10, '3');

DROP DATABASE toko;
DROP PROCEDURE jumlahBrg;
