CREATE DATABASE IF NOT EXISTS factory_yt;
USE factory_yt;
CREATE TABLE IF NOT EXISTS product(
    product_id INT NOT NULL,
    code CHAR(5) NOT NULL,
    name VARCHAR(20) NOT NULL,
    class VARCHAR(45) NOT NULL,
    clock VARCHAR(40) NOT NULL,
    has_clock ENUM('Y','N') NOT NULL,
    mrsp DECIMAL(9,2) NOT NULL,
    primary key (product_id),
    UNIQUE key (code),
    index product_id_index(product_id)
);

ALTER TABLE product add column description VARCHAR(40) NOT NULL after name;
ALTER TABLE product change column description `desc` VARCHAR(40) NOT NULL;


CREATE TABLE IF NOT EXISTS client(
    client_id VARCHAR(20) NOT NULL,
    name VARCHAR(20) NOT NULL,
    sex ENUM('F','M') NOT NULL,
    primary key (client_id),
    UNIQUE (name)
);	