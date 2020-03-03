## Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet

This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.

## Part 1: Yelp Dataset Profiling and Understanding

**1. Profile the data by finding the total number of records for each of the tables below:**

**i.** attribute table = 10000  
**ii.** business table = 10000  
**iii.** category table = 10000  
**iv.** checkin table = 10000  
**v.** elite_years table = 10000  
**vi.** friend table = 10000  
**vii.** hours table = 10000  
**viii.** photo table = 10000  
**ix.** review table = 10000  
**x.** tip table = 10000  
**xi.** user table = 10000

**2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.**

**i.** business = 10000  
**ii.** hours = 1562  
**iii.** category = 2643  
**iv.** attribute = 1115  
**v.** review = **id:** 10000, **business_id:** 8090, **user_id:** 9581  
**vi.** checkin = 493  
**vii.** photo = id: 10000, business_id: 6493  
**viii.** tip = user_id: 537, business_id: 3979  
**ix.** user = 10000  
**x.** friend = 11  
**xi.** elite_years = 2780

Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.

**3. Are there any columns with null values in the Users table? Indicate "yes," or "no."**

**Answer:**  
No, there aren't.

**SQL code used to arrive at answer:**

```sql
SELECT
  COUNT(*)
FROM
  user
WHERE id IS NULL
  OR name IS NULL
  OR review_count IS NULL
  OR yelping_since IS NULL
  OR useful IS NULL
  OR funny IS NULL
  OR cool IS NULL
  OR fans IS NULL
  OR average_stars IS NULL
  OR compliment_hot IS NULL
  OR compliment_more IS NULL
  OR compliment_profile IS NULL
  OR compliment_cute IS NULL
  OR compliment_list IS NULL
  OR compliment_note IS NULL
  OR compliment_plain IS NULL
  OR compliment_cool IS NULL
  OR compliment_funny IS NULL
  OR compliment_writer IS NULL
  OR compliment_photos IS NULL;
```

**4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:**

**i.** Table: review, Column: stars  
`min: 1 max: 5 avg: 3.7082`

**ii.** Table: business, Column: stars  
`min: 1.0 max: 5.0 avg: 3.6549`

**iii.** Table: tip, Column: likes  
`min: 0 max: 2 avg: 0.0144`

**iv.** Table: checkin, Column: count  
`min: 1 max: 53 avg: 1.9414`

**v.** Table: user, column: review_count  
`min: 0 max: 2000 avg: 24.2995`

**5. List the cities with the most reviews in descending order:**

**SQL code used to arrive at answer:**

```sql
SELECT
  city,
  COUNT(review_count) AS reviews
FROM
  business
GROUP BY
  city
ORDER BY
  reviews DESC;
```

**Copy and Paste the Result Below:**

```
+-----------------+---------+
| city            | reviews |
+-----------------+---------+
| Las Vegas       | 82854   |
| Phoenix         | 34503   |
| Toronto         | 24113   |
| Scottsdale      | 20614   |
| Charlotte       | 12523   |
| Henderson       | 10871   |
| Tempe           | 10504   |
| Pittsburgh      | 9798    |
| Montréal        | 9448    |
| Chandler        | 8112    |
| Mesa            | 6875    |
| Gilbert         | 6380    |
| Cleveland       | 5593    |
| Madison         | 5265    |
| Glendale        | 4406    |
| Mississauga     | 3814    |
| Edinburgh       | 2792    |
| Peoria          | 2624    |
| North Las Vegas | 2438    |
| Markham         | 2352    |
| Champaign       | 2029    |
| Stuttgart       | 1849    |
| Surprise        | 1520    |
| Lakewood        | 1465    |
| Goodyear        | 1155    |
+-----------------+---------+
```

**6. Find the distribution of star ratings to the business in the following cities:**

**i.** Avon

**SQL code used to arrive at answer:**

```sql
SELECT
  stars,
  SUM(review_count) AS star_count
FROM
  business
WHERE
  city = 'Avon'
GROUP BY
  stars;
```

**Copy and Paste the Resulting Table Below (2 columns – star rating and count):**

```
+-------+------------+
| stars | star_count |
+-------+------------+
| 1.5   | 10         |
| 2.5   | 6          |
| 3.5   | 88         |
| 4.0   | 21         |
| 4.5   | 31         |
| 5.0   | 3          |
+-------+------------+
```

**ii.** Beachwood

**SQL code used to arrive at answer:**

```sql
SELECT
  stars,
  SUM(review_count) AS star_count
FROM
  business
WHERE
  city = 'Beachwood'
GROUP BY
  stars;
```

**Copy and Paste the Resulting Table Below (2 columns – star rating and count):**

```
+-------+------------+
| stars | star_count |
+-------+------------+
| 2.0   | 8          |
| 2.5   | 3          |
| 3.0   | 11         |
| 3.5   | 6          |
| 4.0   | 69         |
| 4.5   | 17         |
| 5.0   | 23         |
+-------+------------+
```

**7. Find the top 3 users based on their total number of reviews:**

**SQL code used to arrive at answer:**

```sql
SELECT
name,
review_count AS reviews
FROM user
ORDER BY reviews DESC
LIMIT 3;
```

**Copy and Paste the Result Below:**

```
+--------+---------+
| name   | reviews |
+--------+---------+
| Gerald | 2000    |
| Sara   | 1629    |
| Yuri   | 1339    |
+--------+---------+
```

**8. Does posing more reviews correlate with more fans?**

**Please explain your findings and interpretation of the results:**  
No, analysing the results we can see that Amy who has the most fans, has only 609 reviews compared to Geralt, who has 2000 reviews but only 253 fans. We can also see that Yuri has 1339 reviews but only 76 fans.

**SQL Code:**

```sql
SELECT
  name,
  review_count AS reviews,
  fans
FROM
  user
ORDER BY
  fans DESC;
```

**9. Are there more reviews with the word "love" or with the word "hate" in them?**

**Answer:**  
There are 1780 reviews with "love" versus 232 with "hate", so it's safe to assume more people loved rather than hated.

**SQL code used to arrive at answer:**

```sql
SELECT
  COUNT(text)
FROM
  review
WHERE text LIKE "%love%";
```

```sql
SELECT
  COUNT(text)
FROM
  review
WHERE text LIKE "%hate%";
```

**10. Find the top 10 users with the most fans:**

**SQL code used to arrive at answer:**

```sql
SELECT
  name,
  fans
FROM
  user
ORDER BY
  fans DESC
LIMIT 10;
```

**Copy and Paste the Result Below:**

```
+-----------+------+
| name      | fans |
+-----------+------+
| Amy       | 503  |
| Mimi      | 497  |
| Harald    | 311  |
| Gerald    | 253  |
| Christine | 173  |
| Lisa      | 159  |
| Cat       | 133  |
| William   | 126  |
| Fran      | 124  |
| Lissa     | 120  |
+-----------+------+
```

**11. Is there a strong relationship (or correlation) between having a high number of fans and being listed as "useful" or "funny?" Out of the top 10 users with the highest number of fans, what percent are also listed as “useful” or “funny”?**

**Key:**  
0% - 25% - Low relationship  
26% - 75% - Medium relationship  
76% - 100% - Strong relationship

**SQL code used to arrive at answer:**

```sql
SELECT
  name,
  fans,
  funny,
  useful
FROM
  user
ORDER BY
  fans DESC
LIMIT 10;
```

**Copy and Paste the Result Below:**

```
+-----------+------+--------+--------+
| name      | fans | funny  | useful |
+-----------+------+--------+--------+
| Amy       | 503  | 2554   | 3226   |
| Mimi      | 497  | 138    | 257    |
| Harald    | 311  | 122419 | 122921 |
| Gerald    | 253  | 2324   | 17524  |
| Christine | 173  | 6646   | 4834   |
| Lisa      | 159  | 13     | 48     |
| Cat       | 133  | 672    | 1062   |
| William   | 126  | 9361   | 9363   |
| Fran      | 124  | 7606   | 9851   |
| Lissa     | 120  | 150    | 455    |
+-----------+------+--------+--------+
```

**Please explain your findings and interpretation of the results:**  
All the top 10 users are also listed as either "funny" or "useful". So yes, there is a correlation between having a high number of fans and being listed as useful or funny.

## Part 2: Inferences and Analysis

**1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.**

**i. Do the two groups you chose to analyze have a different distribution of hours?**

I choose the city of Las Vegas and the food category. The business have different distribution of hours. The lowest rated service opens earlier on Saturdays, the highest opens at later hours and also closes earlier.

```
+-----------+----------+-------+----------------------+
| city      | category | stars | hours                |
+-----------+----------+-------+----------------------+
| Las Vegas | Food     |   2.5 | Saturday|8:00-22:00  |
| Las Vegas | Food     |   4.0 | Saturday|10:00-19:00 |
+-----------+----------+-------+----------------------+
```

**ii. Do the two groups you chose to analyze have a different number of reviews?**

Yes. The 2.5 star service has less reviews (6) compared to the 4.0 star (30).

```
+-----------+----------+-------+----------------------+--------------+
| city | category | stars | hours | review_count |
+-----------+----------+-------+----------------------+--------------+
| Las Vegas | Food | 2.5 | Saturday|8:00-22:00 | 6 |
| Las Vegas | Food | 4.0 | Saturday|10:00-19:00 | 30 |
+-----------+----------+-------+----------------------+--------------+
```

iii. Are you able to infer anything from the location data provided between these two groups? Explain.

No, they are in different locations.

```
+-----------+----------+-------+-----------------------------+-------------+
| city | category | stars | address | postal_code |
+-----------+----------+-------+-----------------------------+-------------+
| Las Vegas | Food | 2.5 | 3808 E Tropicana Ave | 89121 |
| Las Vegas | Food | 4.0 | 8975 S Eastern Ave, Ste 3-B | 89123 |
+-----------+----------+-------+-----------------------------+-------------+
```

**SQL code used for analysis:**

```sql
SELECT
  business.city,
  category.category,
  business.stars,
  hours.hours,
  business.review_count,
  business.address,
  business.postal_code
FROM
  business
  INNER JOIN category ON business.id = category.business_id
  INNER JOIN hours ON hours.business_id = business.id
WHERE
  business.city = 'Las Vegas'
  AND category.category = 'Food'
GROUP BY
  business.stars;
```

**2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.**

```
+---------+-----------------+-------+------------------+------------------+
| reviews | average_reviews | stars | useful_and_funny | opened_or_closed |
+---------+-----------------+-------+------------------+------------------+
| 504     | 38.7692307692   | 2.0   | 26               | open             |
| 4       | 4.0             | 2.0   | 2                | closed           |
+---------+-----------------+-------+------------------+------------------+
```

**i. Difference 1:**

The opened ones have much more reviews than the closed ones, with an average of 38.7 and a total of 504.

**ii. Difference 2:**

The opened ones are also much more likely to be useful and funny, although this can be based on the sheer number of reviews.

**SQL code used for analysis:**

```sql
SELECT
  SUM(business.review_count) AS reviews,
  AVG(business.review_count) AS average_reviews,
  business.stars AS stars,
  COUNT(review.useful) + COUNT(review.funny) AS useful_and_funny,
  CASE
  WHEN is_open = 1 THEN 'open'
  WHEN is_open = 0 THEN 'closed'
  ELSE 'unknown'
  END AS opened_or_closed
FROM
  business
  INNER JOIN review ON business.id = review.id
GROUP BY
  opened_or_closed
ORDER BY
  opened_or_closed DESC;
```

**3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.**

Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:

**i. Indicate the type of analysis you chose to do:**

Find which business are the most rated on Yelp.

**ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:**

I will pick several business and find which has most positive reviews based on average stars. Then find which state has the best services overall and in which category. Lastly I will group the data based on which state has the best rating per user ratio.

**iii. Output of your finished dataset:**

```
+-------+---------------+---------------+-----------------+---------------+
| state | city          | average_stars | average_reviews | category      |
+-------+---------------+---------------+-----------------+---------------+
| WI    | Cottage Grove | 4.1           | 37.47           | Active Life   |
| AZ    | Peoria        | 4.0           | 54.51           | Doctors       |
| NC    | Charlotte     | 4.0           | 6.98            | Beauty & Spas |
| NV    | Las Vegas     | 4.0           | 83.96           | Japanese      |
| OH    | Cleveland     | 3.7           | 141.3           | Candy Stores  |
| ON    | Toronto       | 3.6           | 19.50           | Restaurants   |
| PA    | Pittsburgh    | 3.6           | 25.29           | Pizza         |
| HLD   | Inverness     | 3.5           | 3.0             | Indian        |
| EDH   | Edinburgh     | 3.2           | 11.36           | Restaurants   |
| QC    | Verdun        | 3.2           | 15.66           | Restaurants   |
| NI    | Hemmingen     | 3.0           | 3.0             | German        |
| BW    | Stuttgart     | 2.8           | 14.23           | Shopping      |
| IL    | Champaign     | 2.0           | 4.0             | Mexican       |
+-------+---------------+---------------+-----------------+---------------+
```

**iv. Provide the SQL code you used to create your final dataset:**

```sql
SELECT
  business.state,
  business.city,
  SUBSTR(AVG(business.stars), 0, 4) AS average_stars,
  SUBSTR(AVG(business.review_count), 0, 6) AS average_reviews,
  category.category
FROM
  business
  INNER JOIN category ON business.id = category.business_id
GROUP BY
  business.state
ORDER BY
  average_stars DESC;
```
