# basic_sql
Solutions to basic sql problems.

Table 1: PERSON 
----------------------------------- 
    person_id (PK)        NUMBER(10)    NOT NULL 

    first_name            VARCHAR2(100) 

    preferred_first_name  VARCHAR2(100) 

    last_name             VARCHAR2(100) NOT NULL 

    date_of_birth         DATE 

    hire_date             DATE 

    occupation            VARCHAR2(1) 
    
Table 2: ADDRESS
----------------------------------- 
    address_id (PK)       NUMBER(10)    NOT NULL 

    person_id (FK)        NUMBER(10)    NOT NULL 

    address_type          VARCHAR2(4)   NOT NULL 

    street_line_1         VARCHAR2(100) 

    city                  VARCHAR2(100) 

    state                 VARCHAR2(100) 

    zip_code              VARCHAR2(30) 


Problems
-----------------------------------
1. Write a query to select all rows from person.  If the person row has a value in preferred_first_name, select the preferred name instead of the value in first name.  
Alias the column as REPORTING_NAME.

2. Write a query to select all rows from person that have a NULL occupation.
    
3. Write a query to select all rows from person that have a date_of_birth before August 7th, 1990.
    
4. Write a query to select all rows from person that have a hire_date in the past 100 days.

5. Write a query to select rows from person that also have a row in address with address_type = 'HOME'.

6. Write a query to select all rows from person and only those rows from address that have a matching billing address (address_type = 'BILL').  
If a matching billing address does not exist, display 'NONE' in the address_type column.
    
7. Write a query to count the number of addresses per address type.
    
8. Write a query to select data in the following format.
 

-----------------------------------
 

    last_name              home_address                          billing_address 
    Smith                  89 Main St, Clifton, VA 12345         89 Main St, Clifton, VA 12345 
    Jones                  212 Maple Ave, Manassas, VA 22033     212 Maple Ave, Manassas, VA 22033


9. Write a query to update the person.occupation column to ‘X’ for all rows that have a ‘BILL’ address in the address table.
