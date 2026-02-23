# SQL-Fundamentals

![GitHub last commit](https://img.shields.io/github/last-commit/AbdiR0099/SQL_fundamentals?style=flat-square)
![GitHub repo size](https://img.shields.io/github/repo-size/AbdiR0099/SQL_fundamentals?style=flat-square)
![GitHub language count](https://img.shields.io/github/languages/count/AbdiR0099/SQL_fundamentals?style=flat-square)

##  About the Project
This repository serves as a personal checkpoint and comprehensive cheat sheet for mastering relational database querying and management using **SQL**. 

Writing a query is only half the battle; understanding *how* the database engine processes that query is what distinguishes a beginner from a professional. This project documents my journey in learning the core SQL clauses, filtering techniques, data manipulation, and table schema definitions.

##  Key Concepts & Workflow

### 1. The Logical Execution Order of SQL
One of the most critical concepts I focused on is the order in which a SQL database engine evaluates a query. This dictates how aliases are used and how data is filtered at different stages of execution. The execution sequence learned is:
1. **FROM**: Identify the target tables.
2. **WHERE**: Filter base data.
3. **GROUP BY**: Aggregate rows based on common attributes.
4. **HAVING**: Filter the aggregated data.
5. **SELECT (DISTINCT)**: Determine the final columns to return and remove duplicates.
6. **ORDER BY**: Sort the final result set.
7. **TOP**: Restrict the number of returned rows.



### 2. Filtering & Operators
Data rarely comes exactly how you need it. I extensively practiced refining datasets using various operators:
* **Comparison & Logical:** `=`, `>`, `<=`, `!=`, `AND`, `OR`, `NOT`
* **Range Operator:** `BETWEEN` to efficiently find values within a boundary.
* **Membership Operator:** `IN` and `NOT IN` to streamline multiple `OR` conditions.
* **Search Operator:** `LIKE` (with `%` and `_` wildcards) to perform pattern matching on text data.

### 3. Data Manipulation Language (DML)


Understanding how to safely and effectively manipulate existing data is a core industry skill. This section of the repository covers:
* **INSERT:** Adding new records, including mapping data directly from one table to another.
* **UPDATE:** Modifying existing records. *Crucial learning:* Always pair `UPDATE` with a precise `WHERE` clause to avoid overwriting the entire table.
* **DELETE:** Removing specific rows safely based on targeted conditions.

### 4. Data Definition Language (DDL)
Beyond just querying data, I learned how to define the structures that hold the data:
* **CREATE TABLE:** Building tables from scratch and defining constraints like `PRIMARY KEY` and `NOT NULL`.
* **ALTER TABLE:** Modifying existing schemas by adding or dropping columns.
* **DROP TABLE:** Completely removing a table from the database.

### 5. Aggregation & Grouping
To extract analytical insights, I utilized aggregate functions (`SUM`, `AVG`, `COUNT`) paired with `GROUP BY`. I also explored the critical difference between `WHERE` (filtering raw rows) and `HAVING` (filtering grouped/aggregated rows).

##  Tech Stack
* **Language:** SQL (T-SQL syntax oriented)
* **Environment:** Microsoft SQL Server (SSMS) / Azure Data Studio *(adjust based on what you actually used)*

##  Getting Started (Installation & Usage)

To run these scripts locally:

1. **Clone the repository:**
   ```bash
   git clone [https://github.com/AbdiR0099/SQL_fundamentals](https://github.com/AbdiR0099/SQL_fundamentals.git)
   cd AbdiR0099/SQL_fundamentals
   
2. Set up a Local Database Engine:
   Ensure you have a SQL engine installed (e.g., SQL Server, MySQL, or PostgreSQL).

3. Execute the Script:
   Open the .sql file in your preferred IDE (like Azure Data Studio, SSMS, or DBeaver), highlight the specific blocks of code you wish to test, and execute them sequentially against the database.
