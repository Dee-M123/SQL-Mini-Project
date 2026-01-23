USE coffee_shop;

-- H1: Certain store locations generate higher total revenue than others.
-- Using JOIN, GROUP BY & ORDER BY

SELECT
    s.store_location,
    SUM(t.total_bill) AS total_revenue,
    AVG(t.total_bill) AS avg_transaction_value,
    COUNT(*) AS number_of_transactions
FROM transactions t
JOIN stores s
    ON t.store_id = s.store_id
GROUP BY s.store_location
ORDER BY total_revenue DESC;

-- Findings:
# H1 is supported. Astoria generates more revenue than the other two locations. 
# This is because Astoria serves more customers than the other two location. 
# The higher revenue is not as a result of having higher prices. 


-- H2: Coffee products contribute more to overall revenue than non-coffee products.
-- Since we filtering and categorising, CASEcan be used here 

SELECT
    CASE
        WHEN LOWER(p.product_category) = 'coffee' THEN 'Coffee'
        ELSE 'Non-Coffee'
    END AS product_group,
    COUNT(t.transaction_id) AS transactions_count,
    SUM(t.total_bill) AS total_revenue,
    AVG(t.total_bill) AS avg_transaction_value
FROM products p
LEFT JOIN transactions t
    ON p.product_id = t.product_id
GROUP BY product_group
ORDER BY total_revenue DESC;

-- H2 rejected
-- non coffee products generate more revenue than coffe and are purchased more than coffee

-- H3: Sales revenue peaks during specific hours of the day.
-- Using GROUP BY & ORDER BY

SELECT
    hour,
    SUM(total_bill) AS total_revenue,
    AVG(total_bill) AS avg_transaction_value,
    COUNT(*) AS number_of_transactions
FROM transactions
GROUP BY hour
ORDER BY total_revenue DESC;

-- which store contributes the most revenue:
-- Using subqueries 

SELECT
    store_location,
    total_revenue,
    ROUND(total_revenue / (SELECT SUM(total_bill) FROM transactions) * 100,2) AS revenue_percentage
FROM (SELECT
        s.store_location,
        SUM(t.total_bill) AS total_revenue
    FROM transactions t
    JOIN stores s
        ON t.store_id = s.store_id
    GROUP BY s.store_location
) AS store_revenue
ORDER BY revenue_percentage DESC;

-- Results remain same as in H1

-- Summary in respect to quantity: 
-- Using aggregation 

SELECT
    MIN(transaction_qty) AS min_qty,
    MAX(transaction_qty) AS max_qty,
    AVG(transaction_qty) AS avg_qty,
    STD(transaction_qty) AS std_qty
FROM transactions;

# results show that customer by single items
# As a result, revenue growth is driven by customer volume
# not by "basket" orders




    
