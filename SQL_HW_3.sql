/* ДЗ 3. SQL – выборка данных, сортировка, агрегатные функции
 * 1. Отсортируйте данные по полю заработная плата (salary) в порядке: убывания, 
 возрастания*/

use lesson_3;


select * 
from staff
order by salary desc;

select * 
from staff
order by salary;


/*2. Выведите 5 максимальных заработных плат (saraly)*/

select salary 
from staff
order by salary desc
limit 5;

/*3. Посчитайте суммарную зарплату (salary) по каждой специальности (роst)*/

select post, sum(salary) 
from staff
group by post;

/*4. Найдите кол-во сотрудников с специальностью (post) «Рабочий» в возрасте от 24 до 49 лет включительно.*/

select count(*)  
from staff
where age between 24 and 50
group by post 
having post = 'Рабочий';

/*5. Найдите количество специальностей*/

select  count(distinct post)  
from staff;

/*6. Выведите специальности, у которых средний возраст сотрудников меньше 30 лет*/

select post 
from staff
group by post
having avg(age) < 30;
