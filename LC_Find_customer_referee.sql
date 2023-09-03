/*
Input: 
Customer table:
+----+------+------------+
| id | name | referee_id |
+----+------+------------+
| 1  | Will | null       |
| 2  | Jane | null       |
| 3  | Alex | 2          |
| 4  | Bill | null       |
| 5  | Zack | 1          |
| 6  | Mark | 2          |
+----+------+------------+
Output: 
+------+
| name |
+------+
| Will |
| Jane |
| Bill |
| Zack |
+------+
Explaination:
Intuition
=========
Some people come out the following solution by intuition.

SELECT name FROM customer WHERE referee_Id <> 2;
However, this query will only return one result:Zack although there are 4 customers not referred by Jane (including Jane herself).
All the customers who were referred by nobody at all (NULL value in the referee_id column) don’t show up. But why?

Algorithm
==========
MySQL uses three-valued logic -- TRUE, FALSE and UNKNOWN. Anything compared to NULL evaluates to the third value: UNKNOWN. 
That “anything” includes NULL itself! That’s why MySQL provides the IS NULL and IS NOT NULL operators to specifically check for NULL.
Thus, one more condition 'referee_id IS NULL' should be added to the WHERE clause as below.
*/
select name from customer where referee_id!=2 or referee_id is null;
