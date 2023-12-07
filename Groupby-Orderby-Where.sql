----------------------------- GROUP BY ------------------------------------

-- HAVING joins the GROUP BY party when you want to filter the results based on the result of aggregate functions. Here's how they play together:

SELECT column1, aggregate_function(column2) as result
FROM table
GROUP BY column1
HAVING condition;


-- for expample more 
-- Let's say you have a "orders" table with columns "customer_id" and "total_amount," and you want to find customers who have made purchases totaling more than $1000:
-- SUM() is the aggregation method.

SELECT customer_id, SUM(total_amount) as total_purchases
FROM orders
GROUP BY customer_id
HAVING SUM(total_amount) > 1000;

-- How can we perform Group By in Django ORM.

-- In Django's ORM, you can use the values and annotate methods to achieve the equivalent of a GROUP BY operation. Here's an example:

-- sample model
from django.db import models

class MyModel(models.Model):
    column1 = models.CharField(max_length=255)
    column2 = models.IntegerField()

-- we need aggregate method here I use SUM()
from django.db.models import Sum

result = MyModel.objects.values('column1').annotate(total_column2=Sum('column2')).filter(total_column2__gt=1000)

values('column1') -- is equivalent to the GROUP BY column1 in SQL.
annotate(total_column2=Sum('column2')) -- calculates the sum of column2 for each group.
filter(total_column2__gt=1000) -- filters the results based on the aggregate condition (similar to HAVING clause in SQL).

for row in result:
    print(row['column1'], row['total_column2'])



---------------------------- WHERE ------------------------------

-- The WHERE clause in SQL is used to filter records based on a specified condition. It's like a gatekeeper, 
-- allowing only the rows that meet certain criteria to be included in the result set

SELECT column1, column2, ...
FROM table
WHERE condition;

-- example

SELECT user_id, username, age
FROM users
WHERE age > 21;

-- we can use logical and conditional operation also

SELECT product_name, price
FROM products
WHERE category = 'Electronics' AND price < 1000;

-- WHERE in Django Orm 

from yourapp.models import User

result = User.objects.filter(age__gt=21)

for user in result:
    print(user.username, user.age)


-- various lookup types in Django, such as __exact, __iexact, __contains, __gt, __lt, __gte, __lte, etc.

result = User.objects.filter(username__contains='john')


----------------------------- ORDER BY ------------------------------------

-- In SQL, the ORDER BY clause is used to sort the result set of a query based on one or more columns

-- example

SELECT column1, column2, ...
FROM table
ORDER BY column1 ASC, column2 DESC;

SELECT product_name, price
FROM products
ORDER BY price DESC;


-- ORDER BY in Django ORM

from yourapp.models import Product

result = Product.objects.all().order_by('price')

for product in result:
    print(product.product_name, product.price)

result = Product.objects.all().order_by('category', '-price')

-- order_by('price') sorts the result set based on the price column in ascending order. You can use 
-- '-price' to sort in descending order.


