# 🏗️ SQL Data Warehouse Project

A end-to-end data warehousing project built with SQL Server, implementing the **Medallion Architecture** (Bronze → Silver → Gold) to ingest, transform, and expose business-ready data for BI, ad-hoc analysis, and machine learning.

---

## 📐 Architecture Overview

![Data Architecture](docs/data_architecture.png)

The warehouse follows a classic three-layer Medallion Architecture, ingesting data from **CRM** and **ERP** source systems and progressively refining it until it is ready for consumption.

---

## 🔷 Layer Details

### 🟫 Bronze Layer — Raw Ingestion
| Property | Detail |
|---|---|
| **Object Type** | Tables |
| **Load Strategy** | Batch Processing · Full Load · Truncate & Insert |
| **Transformations** | None — data stored as-is |
| **Data Model** | None (as-is) |

> The Bronze layer is a faithful copy of the source. No business logic is applied here, preserving full auditability and replayability.

---

### 🪙 Silver Layer — Cleansed & Standardized
| Property | Detail |
|---|---|
| **Object Type** | Tables |
| **Load Strategy** | Batch Processing · Full Load · Truncate & Insert |
| **Transformations** | Data Cleansing · Data Standardization · Data Normalization · Data Enrichment |
| **Data Model** | None (as-is) |

> The Silver layer applies business rules, resolves data quality issues, and standardizes formats across all source systems to produce a consistent, analysis-ready dataset.

---

### 🥇 Gold Layer — Business Ready
| Property | Detail |
|---|---|
| **Object Type** | Tables / Views |
| **Load Strategy** | No Load (derived from Silver) |
| **Transformations** | Star Schema modeling (Facts & Dimensions) |
| **Data Model** | Star Schema |

> The Gold layer presents curated, business-aligned entities optimized for high-performance querying by BI tools, SQL analysts, and ML models.

---

## 📊 Consumption Layer

| Consumer | Description |
|---|---|
| 📊 **BI & Reporting** | Power BI / dashboards connected to Gold layer |
| 🔍 **Ad-Hoc SQL** | Direct SQL queries for exploratory analysis |
| 🤖 **Machine Learning** | Gold layer datasets used as ML-ready feature stores |

---

## 🗂️ Repository Structure
```
sql-data-warehouse-project/
│
├── datasets/          # Raw source data (CRM and ERP CSV files)
│
├── docs/              # Project documentation and architecture assets
│   ├── data_architecture.drawio
│   ├── data_flow.drawio
│   ├── data_models.drawio
│   ├── etl.drawio
│   ├── data_catalog.md
│   └── naming-conventions.md
│
├── scripts/
│   ├── bronze/        # Raw ingestion scripts
│   ├── silver/        # Cleansing and transformation scripts
│   └── gold/          # Star schema views and analytical models
│
├── tests/             # Data quality and validation scripts
│
└── README.md
```

---

## 🛠️ Tech Stack

| Tool | Purpose |
|---|---|
| **SQL Server Express** | Database engine |
| **SSMS** | Query editor & DB management |
| **Draw.io** | Architecture & data model diagrams |
| **Git / GitHub** | Version control & collaboration |

---

## 🚀 Getting Started

### Prerequisites
- [SQL Server Express](https://www.microsoft.com/en-us/sql-server/sql-server-downloads)
- [SSMS](https://learn.microsoft.com/en-us/sql/ssms/download-sql-server-management-studio-ssms)
- [Git](https://git-scm.com/)

### Setup
1. Clone the repo: `git clone https://github.com/Balaprathap/sql-data-warehouse-project.git`
2. Open SSMS and connect to your SQL Server Express instance
3. Run scripts in order: **Bronze → Silver → Gold**

> ⚠️ Always run layers in sequence. Each layer depends on the previous one.

---

## 📋 Data Sources

| Source | Description | Format |
|---|---|---|
| CRM | Customer relationship data | CSV |
| ERP | Enterprise resource planning data | CSV |

---

## ✅ Key Skills Demonstrated

- **Medallion Architecture** — structured, layered data warehouse design
- **ETL Pipelines** — extract, load, and transform data across layers
- **Data Modeling** — star schema with fact and dimension tables
- **Data Quality** — validation scripts and cleansing transformations
- **SQL Development** — optimized queries for analytics and reporting
- **Documentation** — data catalog, naming conventions, architecture diagrams

---

## 📄 License

This project is licensed under the [MIT License](LICENSE).

---

## 🙋 About

Built by **[Balaprathap Chellakkannu](https://github.com/Balaprathap)** — Data Science MS student at Florida Atlantic University, IEEE-published researcher, and data engineering enthusiast.

Feel free to ⭐ the repo if you find it useful!
