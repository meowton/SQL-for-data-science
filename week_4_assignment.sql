/* 1. Pull a list of customer ids with the customer’s full name, 
 and address, along with combining their city and country together. 
 Be sure to make a space in between these two and make it UPPER CASE. */
SELECT
  customers.CustomerId,
  customers.FirstName,
  customers.LastName,
  customers.Address,
  UPPER(customers.City || " " || customers.Country || "")
FROM
  customers;

/* 2. Create a new employee user id by combining the first 4 
 letters of the employee’s first name with the first 2 letters 
 of the employee’s last name. Make the new field lower case and 
 pull each individual step to show your work. */
SELECT
  employees.FirstName,
  employees.LastName,
  LOWER(SUBSTR(employees.FirstName, 0, 5)) || LOWER(SUBSTR(employees.LastName, 0, 3)) AS new_id
FROM
  employees;

/* 3. Show a list of employees who have worked for the company 
 for 15 or more years using the current date function. 
 Sort by lastname ascending. */
SELECT
  employees.FirstName,
  employees.LastName,
  DATETIME('now') - employees.HireDate AS y_of_work
FROM
  employees
WHERE
  y_of_work >= 15
ORDER BY
  employees.LastName ASC;

/* 4. Profiling the Customers table, answer the following question. */
SELECT
  COUNT(*)
FROM
  customers
WHERE
  customers.Company IS NULL;

/* 5. Find the cities with the most customers and rank in descending order. */
SELECT
  customers.City,
  COUNT(*) AS num_customers
FROM
  customers
GROUP BY
  customers.City
ORDER BY
  num_customers DESC;

/* 6. Create a new customer invoice id by combining a customer’s 
 invoice id with their first and last name while ordering your 
 query in the following order: firstname, lastname, and invoiceID. */
SELECT
  customers.FirstName,
  customers.LastName,
  invoices.InvoiceId,
  customers.FirstName || customers.LastName || invoices.InvoiceId AS new_id
FROM
  customers
  INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
WHERE
  new_id LIKE 'Astrid%'
ORDER BY
  FirstName,
  LastName,
  InvoiceId;