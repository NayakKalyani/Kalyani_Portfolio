Create database customer_churn_analysis;
use customer_churn_analysis;
Drop Table analysis_data;
Select count(Customer_ID) as customer_count from new_customer_data;

-- revenue lost to churned customers in basis of churn category
Select Churn_Category, 
count(Customer_ID) as customer_count,
Round((sum(Total_Revenue)*100)/ sum(sum(Total_Revenue)) Over(), 0) as Revenue_Percentage
from new_customer_data
Group by Churn_Category;


-- Tenure for churners
SELECT
    CASE 
        WHEN Tenure_in_Months <= 6 THEN '6 months'
        WHEN Tenure_in_Months <= 12 THEN '1 Year'
        WHEN Tenure_in_Months <= 24 THEN '2 Years'
        ELSE '> 2 Years'
    END AS Tenure,
    ROUND(COUNT(Customer_ID) * 100.0 / SUM(COUNT(Customer_ID)) OVER(),1) AS Churn_Percentage
FROM
new_customer_data
WHERE
Customer_Status = 'Churned'
GROUP BY
    CASE 
        WHEN Tenure_in_Months <= 6 THEN '6 months'
        WHEN Tenure_in_Months <= 12 THEN '1 Year'
        WHEN Tenure_in_Months <= 24 THEN '2 Years'
        ELSE '> 2 Years'
    END
ORDER BY
Churn_Percentage DESC;


-- cities with highest churn rates
SELECT
    City,
    COUNT(Customer_ID) AS Churned,
    CEILING(COUNT(CASE WHEN Customer_Status = 'Churned' THEN Customer_ID ELSE NULL END) * 100.0 / COUNT(Customer_ID)) AS Churn_Rate
FROM
    new_customer_data
GROUP BY
    City
HAVING
    COUNT(Customer_ID)  > 20
AND
    COUNT(CASE WHEN Customer_Status = 'Churned' THEN Customer_ID ELSE NULL END) > 0
ORDER BY
    Churn_Rate DESC
    limit 5;
    -- general reason for churn
    Select Churn_Category,
    Round(Sum(Total_Revenue), 0) as Churned_Rev,
    Ceiling((Count(Customer_ID)*100.0) / sum(count(Customer_ID)) over()) as Churn_Percentage
    From new_customer_data
    where Customer_Status = 'Churned'
    Group By Churn_Category
    order by Churn_Percentage DESC;
    -- why did customers churn
    Select Churn_Reason, Churn_Category,
    Round(count(Customer_ID) *100/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    From new_customer_data
    Group By
    Churn_Reason, Churn_Category
    order by Churn_Percentage DESC
    Limit 5;
    -- offers churners have
    Select Offer,
    Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as churned
    from new_customer_data
    Group by Offer
    Order By churned desc;
    -- internet type for churn customers
    Select Internet_Type,
    count(Customer_ID) as churned,
    Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    from new_customer_data
    Group by Internet_Type
    Order By Churned desc;
    -- internet type for dissatisfaction
    Select Internet_Type,
	Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    from new_customer_data
    Where 
    Customer_Status = 'Churned'
    AND Churn_Category = 'Competitor'
    Group by Internet_Type, 
    Churn_Category
    Order By Churn_Percentage desc;
    
    -- internet type for diisatisfaction
     Select Internet_Type,
	Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    from new_customer_data
    Where 
    Customer_Status = 'Churned'
    AND Churn_Category = 'Dissatisfaction'
    Group by Internet_Type, 
    Churn_Category
    Order By Churn_Percentage desc;
   
   
   -- find premium tech support
     Select Premium_Tech_Support,
     Count(Customer_ID) as Churned,
	Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    from new_customer_data
    Group by Premium_Tech_Support
    Order By Churned desc;
  
  
  -- contract of churners
     Select Contract,
     Count(Customer_ID) as Churned,
	Round(Count(Customer_ID) *100.0/ sum(count(Customer_ID)) over(), 0) as Churn_Percentage
    from new_customer_data
    Group by Contract
    Order By Churned desc;
    
    Alter Table new_customer_data
    Add Column Monthly_Charge Decimal(10,2);
    Describe new_customer_data;
    SELECT
    Customer_ID,
    City,
    Total_Revenue
FROM new_customer_data
WHERE
    Total_Revenue > 1000 
ORDER BY
    Total_Revenue DESC
LIMIT 5;
SELECT
    City,
    AVG(Age) AS Average_Age,
    COUNT(Customer_ID) AS Total_Customers,
    COUNT(CASE WHEN Total_Revenue > 1000 THEN Customer_ID END) AS High_Value_Customers,
    ROUND(COUNT(CASE WHEN Total_Revenue > 1000 THEN Customer_ID END) * 100.0 / COUNT(Customer_ID), 2) AS High_Value_Churn_Rate
FROM new_customer_data
GROUP BY
    City
HAVING
    COUNT(Customer_ID) > 45  -- Adjust the minimum count as needed
    AND COUNT(CASE WHEN Total_Revenue > 1000 THEN Customer_ID END) > 0
ORDER BY
    High_Value_Churn_Rate DESC
LIMIT 5;

-- churned customers based on age and chunr category
SELECT
    Churn_Category,
    AVG(Age) AS Average_Age,
    COUNT(Customer_ID) AS Total_Customers,
    COUNT(CASE WHEN Churn_Category = 'Churned' THEN Customer_ID END) AS Churned_Customers,
    ROUND(COUNT(CASE WHEN Churn_Category = 'Churned' THEN Customer_ID END) * 100.0 / COUNT(Customer_ID), 0) AS Churn_Rate
FROM new_customer_data
GROUP BY
    Churn_Category
ORDER BY
    Churn_Rate DESC;
    
    
    
    



    
    
     
    
    
    
    
































