 SELECT *
FROM survey
LIMIT 10;

SELECT question,
   COUNT(DISTINCT user_id)
FROM survey
GROUP BY 1;

/*testing*/ 
/*Q1:  
1. get home_try_on all count
2. get home_quiz all count
3. 1/2 as.... rate..
*/

/*SELECT question,
	COUNT(DISTINCT user_id)
FROM survey
GROUP by 
*/






SELECT *
FROM quiz
LIMIT 5;

SELECT *
FROM home_try_on
LIMIT 5;

SELECT *
FROM purchase
LIMIT 5;

/*5*/  
--WITH funnels AS (
  SELECT DISTINCT q.user_id,
    
   case
    when h.user_id IS NOT NULL then 'True'
    else 'False'
   end
   
   AS 'is_home_try_on',
   
/*case
   --when h.number_of_pairs is not NULL 
   --and char_length(h.number_of_pairs) > 0 
   
   then
  left(h.number_of_pairs, 1) 
   else Null
   end
   as 'number_of_pairs',
 */
h.number_of_pairs as 'number_of_pairs',
   
   case
    when p.user_id IS NOT NULL then 'True'
    else 'False'
   end
   AS is_purchase
  
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
LIMIT 10;
----------------------------------------------------

WITH funnels AS (
  SELECT DISTINCT q.user_id,
    
   case
    when h.user_id IS NOT NULL then 'True'
    else 'False'
   end
   
   AS is_home_try_on,
   
h.number_of_pairs as number_of_pairs,
   
   case
    when p.user_id IS NOT NULL then 'True'
    else 'False'
   end
   AS is_purchase
  
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
)

--select style,
--number_of_pairs

--FROM purchase
--left join funnels
--on purchase.user_id = funnels.user_id
--Group by 1; count (distinct user_id) as 'Total',
--SELECT 
--    COUNT(CASE WHEN rsp_ind = 0 then 1 ELSE NULL END) as "New",
--    COUNT(CASE WHEN rsp_ind = 1 then 1 ELSE NULL END) as "Accepted"
--from tb_a


SELECT
    COUNT (distinct user_id) as "Total",
	  COUNT (CASE WHEN is_home_try_on = 'True' then 1 ELSE NULL END) as "TryOn",
    COUNT (CASE WHEN is_purchase = 'True' then 1 ELSE NULL END) as "purchase"
    
FROM Funnels; 

----------------------------------------------------

WITH funnels AS (
  SELECT DISTINCT q.user_id,
    
   case
    when h.user_id IS NOT NULL then 'True'
    else 'False'
   end
   
   AS is_home_try_on,
   
h.number_of_pairs as number_of_pairs,
   
   case
    when p.user_id IS NOT NULL then 'True'
    else 'False'
   end
   AS is_purchase
  
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
)
SELECT
    COUNT (CASE WHEN is_home_try_on = 'True' then 1 ELSE NULL END) as "total_try_on",
	  COUNT (CASE WHEN number_of_pairs = '3 pairs' then 1 ELSE NULL END) as "3 pairs",
    COUNT (CASE WHEN number_of_pairs = '5 pairs' then 1 ELSE NULL END) as "5 pairs"
FROM Funnels; 




----------------------------------------------------

WITH funnels AS (
  SELECT DISTINCT q.user_id,
    
   case
    when h.user_id IS NOT NULL then 'True'
    else 'False'
   end
   
   AS is_home_try_on,
   
h.number_of_pairs as number_of_pairs,
   
   case
    when p.user_id IS NOT NULL then 'True'
    else 'False'
   end
   AS is_purchase
  
FROM quiz q
LEFT JOIN home_try_on h
   ON q.user_id = h.user_id
LEFT JOIN purchase p
   ON p.user_id = q.user_id
)


SELECT
number_of_pairs, 
COUNT (CASE WHEN is_purchase = 'True' then 1 ELSE NULL END) as "purchase"   
FROM Funnels
where number_of_pairs is not null

group by 1; 


