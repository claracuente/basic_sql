/* 1. Write a query to select all rows from person.  If the person row has a value in preferred_first_name, select the preferred name instead of the value in first name.  
Alias the column as REPORTING_NAME.*/

SELECT
    person_id,
    preferred_first_name AS reporting_name,
    last_name,
    date_of_birth,
    hire_date,
    occupation
FROM
    person
WHERE preferred_first_name IS NOT NULL
UNION
SELECT
    person_id,
    first_name AS reporting_name,
    last_name,
    date_of_birth,
    hire_date,
    occupation
FROM
    person
WHERE preferred_first_name IS NULL;

/* 2. Write a query to select all rows from person that have a NULL occupation.*/

SELECT
    *
FROM
    person
WHERE
    occupation IS NULL;
    
/* 3. Write a query to select all rows from person that have a date_of_birth before August 7th, 1990. */ 

SELECT
    *
FROM
    person
WHERE
    date_of_birth < CAST('08-07-1990' as date);
    
/* 4. Write a query to select all rows from person that have a hire_date in the past 100 days.*/

SELECT
    *
FROM
    person
WHERE
    hire_date <= (SELECT SYSDATE FROM dual) AND hire_date > (SELECT SYSDATE FROM dual) - 100;
    
/* 5. Write a query to select rows from person that also have a row in address with address_type = 'HOME'.*/

SELECT
    person.*
FROM
    person
JOIN 
    address ON person.person_id=address.person_id
WHERE
    address.address_type = 'home';
    
/* 6. Write a query to select all rows from person and only those rows from address that have a matching billing address (address_type = 'BILL').  
If a matching billing address does not exist, display 'NONE' in the address_type column.*/

SELECT
    person.*, REPLACE(address.address_type,'home', 'NONE') AS address_type
FROM
    person
JOIN 
    address ON person.person_id=address.person_id;
    
/* 7. Write a query to count the number of addresses per address type.*/

SELECT
    address_type, COUNT(address_type)
FROM
    address
GROUP 
BY
    address_type;
    
/* 8. Write a query to select data in the following format.
last_name           home_address                          billing_address 

------------------  ------------------------------------  --------------------------------------- 

Smith               89 Main St, Clifton, VA 12345         89 Main St, Clifton, VA 12345 

Jones               212 Maple Ave, Manassas, VA 22033     212 Maple Ave, Manassas, VA 22033 

*/

SELECT 
    person.last_name, 
    (p1.street_line_1 || ', ' || p1.city || ', ' || p1.state || ' ' || p1.zip_code) home_address, 
    (p2.street_line_1 || ', ' || p2.city || ', ' || p2.state || ' ' || p2.zip_code) billing_address
FROM 
    address p1
LEFT JOIN 
    address p2 ON p1.person_id = p2.person_id
JOIN 
    person ON p1.person_id = person.person_id
WHERE 
    p1.address_type = 'home' AND p2.address_type = 'bill';
    
/* 9. Write a query to update the person.occupation column to ‘X’ for all rows that have a ‘BILL’ address in the address table.*/

UPDATE
    person
SET
    person.occupation = 'X'
WHERE person_id in
    (SELECT person.person_id from person JOIN address ON person.person_id=address.person_id WHERE address.address_type = 'bill');
