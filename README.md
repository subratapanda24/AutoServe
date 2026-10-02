````markdown
# AutoServe – Car Service Center Job Card Management System

## Overview

AutoServe is a PostgreSQL database project designed for a car service center to manage customers, vehicles, mechanics, service jobs, and spare parts.

The system tracks service job cards, calculates the total cost of each service job using labour and spare-part costs, and provides information about mechanic workloads and pending service jobs.

---

## Objectives

- Design an Entity-Relationship (ER) diagram for the car service center.
- Convert the ER model into a normalized relational database schema.
- Store customer and vehicle information.
- Manage mechanics and their service jobs.
- Track spare parts used in each service job.
- Calculate the total cost of each service job.
- Generate mechanic workload and revenue information.
- Create a `PendingJobCards` view for tracking incomplete service jobs.
- Maintain referential integrity using primary and foreign keys.

---

## Database Schema

The database consists of the following tables:

| Table | Description |
|---|---|
| `Customer` | Stores customer details |
| `Vehicle` | Stores vehicle details and customer ownership |
| `Mechanic` | Stores mechanic details and specialization |
| `ServiceJob` | Stores service job card information |
| `SparePart` | Stores spare-part details, prices, and stock |
| `JobParts` | Associates service jobs with spare parts and stores quantity used |

### Relationships

```text
Customer 1 ─── M Vehicle
Vehicle  1 ─── M ServiceJob
Mechanic 1 ─── M ServiceJob
ServiceJob M ─── N SparePart
````

The many-to-many relationship between `ServiceJob` and `SparePart` is implemented using the `JobParts` table.

---

## Main Features

### 1. Job Cost Calculation

The total cost of a service job is calculated as:

```text
Total Job Cost = Labour Charge + Spare-Part Cost
```

Spare-part cost is calculated using:

```text
Quantity × UnitPrice
```

`COALESCE()` is used to handle service jobs that do not use any spare parts.

### 2. Mechanic Revenue and Workload

The project calculates the number of jobs handled and the total revenue associated with each mechanic using:

* `JOIN`
* `COUNT()`
* `SUM()`
* `GROUP BY`
* Subqueries

### 3. Above-Average Job Cost

A CTE and subquery are used to identify service jobs whose total cost is greater than the average job cost.

### 4. PendingJobCards View

The `PendingJobCards` view joins:

* `ServiceJob`
* `Vehicle`
* `Mechanic`

and displays all service jobs that are not marked as `Completed`.

### 5. Referential Integrity

Foreign-key constraints ensure that service jobs cannot reference vehicles or mechanics that do not exist in the database.

---

## SQL Scripts

The SQL queries are organized into separate files:

```text
Queries/
│
├── 01_schema.sql
├── 02_data.sql
├── 03_jobCost.sql
├── 04_mechanic_revenue.sql
├── 05_above_averageJobs.sql
├── 06_pending_jobCards.sql
└── 07_integrity_demo.sql
```

### Execution Order

Run the SQL files in the following order:

```text
01_schema.sql
      ↓
02_data.sql
      ↓
03_jobCost.sql
      ↓
04_mechanic_revenue.sql
      ↓
05_above_averageJobs.sql
      ↓
06_pending_jobCards.sql
      ↓
07_integrity_demo.sql
```

The database should be created and selected before executing the schema:

```sql
CREATE DATABASE autoserve;
```

Then connect to the database:

```text
\c autoserve
```

---

## ER Diagram

The ER diagram uses **Chen notation** and represents the entities, attributes, relationships, primary keys, foreign keys, cardinalities, and the derived `TotalCost` attribute.

The many-to-many relationship between `ServiceJob` and `SparePart` contains the `Quantity` attribute.

The ER diagram is available in:

```text
ER Diagram/er.png
```

---

## Database Constraints

The database uses the following constraints:

* Primary Key
* Foreign Key
* `NOT NULL`
* `UNIQUE`
* `CHECK`
* `DEFAULT`
* Composite Primary Key

These constraints help maintain data integrity and consistency.

---

## Technologies Used

* PostgreSQL
* SQL
* ER Modeling
* Relational Database Design

---

## Project Structure

```text
AutoServe/
│
├── Documentation/
│   └── AutoServe_DBMS_Report.pdf
│
├── ER Diagram/
│   └── er.png
│
├── Queries/
│   ├── 01_schema.sql
│   ├── 02_data.sql
│   ├── 03_jobCost.sql
│   ├── 04_mechanic_revenue.sql
│   ├── 05_above_averageJobs.sql
│   ├── 06_pending_jobCards.sql
│   └── 07_integrity_demo.sql
│
└── README.md
```

---

## Documentation

The complete project documentation, including:

* Problem Statement
* ER Diagram
* Schema Design
* Normalization
* SQL Implementation
* Query Set
* View Creation
* Query Outputs
* Working Database Results

is available in:

**`Documentation/AutoServe_DBMS_Report.pdf`**

---

## Learning Outcomes

This project demonstrates practical knowledge of:

* Database and table creation
* DDL and DML
* Primary and foreign keys
* Database constraints
* Normalization
* SQL JOINs
* Aggregate functions
* `GROUP BY`
* Subqueries
* CTEs
* Views
* Referential integrity
* Relational database design

