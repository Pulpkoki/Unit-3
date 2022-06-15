/*
Get the customers for which the borrowed amount is 
higher than the mean amount of all the customers.
*/

use bank;
select account_id, sum(amount) as borrowed_amount from loan
group by account_id
having borrowed_amount > (select avg(amount) from loan);

/*
Get for each account, the total amount transferred, destination bank and destination account,
which are above 10K
*/

SELECT * from
(select account_id, sum(amount) as total_amount_transferred, bank_to, account_to 
from bank.order group by account_id, bank_to, account_to) as sub
where total_amount_transferred > 10000;

/*
Which transactions of bank.trans are in the list
(In this query we are trying to find the k_symbols
based on the average amount from the table order.
the average amount should be more than 3000)
*/
-- child query

select k_symbol, round(avg(amount),2) as Average from bank.order
where k_symbol not in (' ', ' ')
group by k_symbol
having Average > 3000;

select * from bank.trans
where k_symbol in
(select k_symbol from
(select k_symbol,round(avg(amount),2) as average from bank.order
where k_symbol not in ('', ' ')
group by k_symbol
having average > 3000) as filtered_ksymbols
);

##rewriting it using keyword WITH

WITH
filtered_ksymbols as (select k_symbol,round(avg(amount),2) as average from bank.order
where k_symbol not in ('',' ')
group by k_symbol
having average > 3000)

select * from bank.trans
where k_symbol in
(select k_symbol from filtered_ksymbols)