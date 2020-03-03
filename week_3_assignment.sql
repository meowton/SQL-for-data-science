/* 1. Using a subquery, find the names of all the tracks 
 for the album "Californication". */
SELECT
  tracks.Name,
  tracks.AlbumId
FROM
  tracks
WHERE
  tracks.AlbumId IN (
    SELECT
      albums.AlbumId
    FROM
      albums
    WHERE
      albums.Title = 'Californication'
  );

/* 2. Find the total number of invoices for each customer along 
 with the customer's full name, city and email. */
SELECT
  customers.FirstName,
  customers.LastName,
  customers.City,
  customers.Email,
  COUNT(*) AS orders
FROM
  customers
  INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
GROUP BY
  customers.CustomerId
ORDER BY
  customers.CustomerId;

/* 3. Retrieve the track name, album, artistID, and trackID 
 for all the albums. */
SELECT
  albums.ArtistId,
  albums.Title,
  tracks.TrackId,
  tracks.Name
FROM
  albums
  INNER JOIN tracks ON albums.AlbumId = tracks.AlbumId
WHERE
  tracks.TrackId = '12'
GROUP BY
  tracks.Name
ORDER BY
  tracks.TrackId;

/* 4. Retrieve a list with the managers last name, and the last
 name of the employees who report to him or her. */
SELECT
  man.LastName AS Manager,
  emp.LastName AS Employee
FROM
  employees AS emp
  INNER JOIN employees AS man ON emp.ReportsTo = man.EmployeeId;

/* 5. Find the name and ID of the artists who do not have albums. */
SELECT
  artists.ArtistId,
  artists.Name
FROM
  artists
WHERE
  NOT EXISTS (
    SELECT
      albums.ArtistId
    FROM
      albums
    WHERE
      albums.ArtistId = artists.ArtistId
  )
ORDER BY
  artists.ArtistId;

/* 6. Use a UNION to create a list of all the employee's and customer's 
 first names and last names ordered by the last name in descending order. */
SELECT
  employees.FirstName,
  employees.LastName
FROM
  employees
UNION
SELECT
  customers.FirstName,
  customers.LastName
FROM
  customers
ORDER BY
  LastName DESC;

/* 7. See if there are any customers who have a different 
 city listed in their billing city versus their customer city. */
SELECT
  customers.FirstName,
  customers.City,
  invoices.BillingCity
FROM
  customers
  INNER JOIN invoices ON customers.CustomerId = invoices.CustomerId
WHERE
  customers.City NOT LIKE invoices.BillingCity
ORDER BY
  customers.CustomerId;