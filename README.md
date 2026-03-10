# Zepto Inventory Analysis — SQL Data Exploration & Business Insights

SQL analysis of zepto inventory dataset to uncover pricing patterns, stock availability, and category-level insights.

**Skills:** **SQL**, **Data Cleaning**, **Data Exploration**, **Aggregations**, **Business Analysis**

---

## Project Summary

This project analyzes **Zepto inventory data using SQL** to explore **product pricing patterns**, **discount strategies**, **stock availability**, and **category-level inventory performance**.

The analysis identifies **high-discount products**, **stock shortages**, and **category-level revenue opportunities**, helping understand how **quick-commerce companies manage large product inventories**.

---

## Business Problem

Quick-commerce companies like **Zepto** manage **thousands of products** with varying prices, packaging sizes, and discount strategies.

Without proper inventory analysis, companies may face:

- **stock shortages**
- **inefficient inventory management**
- **inconsistent pricing strategies**
- **missed revenue opportunities**

This project analyzes Zepto’s inventory dataset to uncover **discount trends**, **product distribution**, and **category-level performance** using **SQL**.

---

## Dataset Information

**Dataset Source:** Kaggle — **Zepto Inventory Dataset**

The dataset contains **product-level inventory and pricing information**.

### Dataset Columns

| Column | Description |
|------|-------------|
| **sku_id** | Unique product identifier |
| **name** | Product name |
| **category** | Product category |
| **mrp** | Maximum Retail Price |
| **discounted_selling_price** | Selling price |
| **discount_percent** | Discount percentage |
| **available_quantity** | Available inventory quantity |
| **weight_in_gms** | Product weight |
| **out_of_stock** | Product stock status |

---

## Data Cleaning

During data exploration, several data quality issues were identified and resolved before performing the analysis.

### Issues Identified

1. **File Encoding Issue**
   - The dataset was not in UTF-8 format.
   - Converted the dataset to UTF-8 format using Excel.

2. **Invalid Product Record**
   - A product with **MRP = 0** was identified.
   - Since this represents invalid pricing data, the record was removed from the dataset.

3. **Price Values Stored in Paise**
   - The columns **mrp** and **discounted_selling_price** were stored in paise.
   - Converted these values to **rupees by dividing them by 100**.

---

## Tools & Skills Demonstrated

### Tools Used

- **SQL (PostgreSQL)**

### SQL Techniques Used

- **Data Cleaning**
- **Aggregations (SUM, AVG, COUNT)**
- **Filtering (WHERE)**
- **Conditional Logic (CASE)**
- **Grouping (GROUP BY)**
- **Sorting (ORDER BY)**

---

## Analysis Questions

Key questions explored in this analysis:

1. Which products offer the **highest discount percentage**?
2. Which **high-MRP products are currently out of stock**?
3. What is the **estimated revenue contribution of each category**?
4. Which products have **high MRP but low discounts**?
5. Which categories offer the **highest average discount percentage**?
6. Which products provide the **best price per gram**?
7. How can products be **categorized by weight (Low, Medium, Bulk)**?
8. What is the **total inventory weight per category**?

---

## Example SQL Query

Below is the SQL query used to identify **categories offering the highest average discount percentage**.

```sql
SELECT
    category,
    ROUND(AVG(discount_percent),2) AS avg_discount_percent
FROM
    zepto
GROUP BY
    category
ORDER BY
    avg_discount_percent DESC
LIMIT 5;
```

---

## Query Output

```markdown
!images/highest_avg_discount_category.png
```

---

## Key Insights

Key insights discovered during the analysis:

- Certain categories offer **significantly higher discounts**, suggesting **aggressive promotional strategies**.
- Some **high-MRP products are frequently out of stock**, indicating **demand–supply imbalance**.
- **Price-per-gram analysis** highlights products providing **better value for customers**.
- Most products fall under **low to medium weight categories**, aligning with **quick-commerce delivery models**.

---

## Author

**Abdul Rahim**
