use hw_2;

/* Задание 1. 
   Используя операторы языка SQL,
   создайте таблицу “ sales” . Заполните ее данными.*/

create table sales
(
	id int auto_increment not null primary key,
	order_data date not null,
	count_product int not null
);

insert into sales (order_data, count_product)
values
	('2022-01-01', 156),
    ('2022-01-02', 180),
    ('2022-01-03', 21),
    ('2022-01-04', 124),
    ('2022-01-05', 341);
    
/*Задание 2. 
 Для данных таблицы “sales” укажите тип
 заказа в зависимости от кол-ва :
 меньше 100 - Маленький заказ
 от 100 до 300 - Средний заказ
 больше 300 - Большой заказ*/
   
   select id, 
case
	when count_product between 100 and 300
		then 'Средний заказ'
	when count_product > 300
		then 'Большой заказ'
	when count_product < 100
		then 'Маленький заказ'   
	else 'Не определено'
end as order_type
from sales;


/*Задание 3. 
  Создайте таблицу “ orders” , заполните ее значениями
  Выберите все заказы. В зависимости от поля order_status выведите столбец full_order_status:
  OPEN – «Order is in open state» ; CLOSED - «Order is closed»; CANCELLED - «Order is cancelled»*/

create table orders
(
	id int auto_increment not null primary key,
	employee_id  varchar(5) not null,
	amount decimal(5, 2) not null,
    order_status varchar(15) not null
);

insert into orders (employee_id, amount, order_status)
values
	('e03', 15.00, 'OPEN'),
    ('e01', 25.50, 'OPEN'),
    ('e05', 100.70, 'CLOSED'),
    ('e02', 22.18, 'OPEN'),
    ('e04', 9.50, 'CANCELLED');

select id, employee_id, amount, order_status,
if(order_status = 'OPEN', 'Order is in open state',
	if(order_status = 'CLOSED', 'Order is closed', 'Order is cancelled')
	)	 as full_order_status
from orders;


/* Задание 4. 
 Чем 0 отличается от NULL?
 
 Ответ: 
 0 - это цифра, которая рассматривается как конкретное число и может использоваться в арифметических операциях. 
 		Например, если у числового столбца значение равно 0, это ознаячает, что в этом чиловом столбце нет значения лбо оно равно 0.
 
 NULL - это ключевое слово, которое представляет собой отсутсвие какого-либо значения вообщее 
       (ячейка ничем не занята) или неопределеное значение. Оно используется для собозначения ситуаций, когда значение неизвестно, 
       неприменимо или отсутствует. NULL не является числовым значением и не может быть спользован в арифметических операциях*/







