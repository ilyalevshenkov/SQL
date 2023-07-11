/* ДЗ 6.  SQL – Транзакции. Временные таблицы, управляющие конструкции, циклы */


USE lesson_4;

/* Задача 1. Создайте таблицу users_old, аналогичную таблице users. Создайте процедуру, 
с помощью которой можно переместить любого (одного) пользователя из таблицы users в таблицу users_old. 
(использование транзакции с выбором commit или rollback – обязательно). */

CREATE TABLE users_old (
    id SERIAL PRIMARY KEY,
    firstname VARCHAR(50),
    lastname VARCHAR(50) COMMENT 'Фамилия',
    email VARCHAR(120) UNIQUE
);

drop procedure if exists users_move;
DELIMITER //
create procedure users_move(in num1 int)
begin
	select id, firstname, lastname, email 
    from users
    where id = num1;
    
commit;
end//
DELIMITER ;

call users_move(3);

/* Задача 2. Создайте хранимую функцию hello(), которая будет возвращать
приветствие, в зависимости от текущего времени суток. С 6:00 до 12:00
функция должна возвращать фразу "Доброе утро", с 12:00 до 18:00
функция должна возвращать фразу "Добрый день", с 18:00 до 00:00 —
"Добрый вечер", с 00:00 до 6:00 — "Доброй ночи". */

DROP FUNCTION IF EXISTS hello;
DELIMITER //
CREATE FUNCTION hello()
RETURNS VARCHAR(20)
DETERMINISTIC
BEGIN
declare total_text VARCHAR(20);
	select case 
		when CURRENT_TIME between '6:00:01' and '12:00:00'
		then 'Доброе утро'
		when CURRENT_TIME between '12:00:01' and '18:00:00'
		then 'Добрый день'
		when CURRENT_TIME between '18:00:01' and '24:00:00'
		then 'Добрый вечер'
		else 'Доброй ночи'
	end into total_text;
return total_text;
END//
DELIMITER ;
select hi_user();

/* Задача 3. (по желанию)* Создайте таблицу logs типа Archive. Пусть при каждом
создании записи в таблицах users, communities и messages в таблицу logs
помещается время и дата создания записи, название таблицы, идентификатор 
первичного ключа. */

CREATE TABLE logs_archive (
    id_logs INT AUTO_INCREMENT NOT NULL PRIMARY KEY,
    date_insert DATE NOT NULL,
    time_insert TIME NOT NULL,
    name_table VARCHAR(20),
    id_pk INT UNSIGNED NOT NULL
)  ENGINE=ARCHIVE;

DROP trigger IF EXISTS insert_logs_archive;
DELIMITER $$
CREATE trigger insert_logs_archive
after insert on users
for each row
begin
	insert into logs_archive(date_insert, time_insert, name_table, id_pk)
    values (CURRENT_DATE(),  CURRENT_TIME(), 'users', new.id);

end $$
DELIMITER ;

DELIMITER $$
CREATE trigger insert_logs_archive
after insert on communities
for each row
 begin
	insert into logs_archive(date_insert, time_insert, name_table, id_pk)
    values (CURRENT_DATE(),  CURRENT_TIME(), 'communities', new.id);

end $$
DELIMITER ;

DELIMITER $$
CREATE trigger insert_logs_archive
after insert on messages
for each row
begin
	insert into logs_archive(date_insert, time_insert, name_table, id_pk)
    values (CURRENT_DATE(),  CURRENT_TIME(), 'messages', new.id);

end $$
DELIMITER ;



