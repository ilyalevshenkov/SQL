/* ДЗ 1. Установка СУБД, подключение к БД, просмотр и создание таблиц
Задача 1
Создайте таблицу с мобильными телефонами, используя графический интерфейс. Заполните БД данными (поля и наполнение см. в презентации).
*/

Use HW_1;

CREATE TABLE mobile_phones 
(
    id int NOT NULL AUTO_INCREMENT,
    product_name varchar(45) NOT NULL,
    manufactures varchar(45) NOT NULL,
    product_count int NOT NULL,
    price int NOT NULL,
    PRIMARY KEY (id)
); 

INSERT mobile_phones (product_name, manufactures, product_count, price)
VALUES
    ('iPhone X', 'Apple', 3, 76000),
    ('iPhone 8', 'Apple', 2, 51000),
    ('Galaxy S9', 'Samsung', 2, 56000),
    ('Galaxy S8', 'Samsung', 1, 41000),
    ('P20 Pro', 'Huawei', 5, 36000);

/*Задание 2
Выведите название, производителя и цену для товаров, количество которых превышает 2. */

SELECT manufactures, price FROM mobile_phones
WHERE product_count > 2;

/*Задание 3
Выведите весь ассортимент товаров марки “Samsung”*/

SELECT * FROM mobile_phones
WHERE manufactures = 'Samsung';   

/* Задание 4
С помощью регулярных выражений найти:

Товары, в которых есть упоминание "Iphone"*/
SELECT * FROM mobile_phones
WHERE product_name REGEXP 'iPhone';

/*Товары, в которых есть упоминание"Samsung"*/
SELECT * FROM mobile_phones
WHERE manufactures REGEXP 'Samsung';
    
/*Товары, в которых есть ЦИФРЫ*/
SELECT * FROM mobile_phones
WHERE product_name REGEXP '[0-9]';


/*Товары, в которых есть ЦИФРА "8".*/
SELECT * FROM mobile_phones
WHERE product_name REGEXP '8';

