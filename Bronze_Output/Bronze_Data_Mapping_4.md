_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze layer data mapping for Zoom Platform Analytics Systems - comprehensive version aligned with actual source table structure
## *Version*: 4
## *Updated on*: 
_____________________________________________

# Bronze Layer Data Mapping - Version 4
## Zoom Platform Analytics Systems

### Document Metadata
- **Author**: AAVA
- **Version**: 4.0
- **Date**: 2024
- **Description**: Comprehensive Bronze Layer Data Mapping for Zoom Platform Analytics Systems implementing Medallion Architecture in Snowflake
- **Target Platform**: Snowflake
- **Architecture**: Medallion (Bronze Layer)
- **Data Sources**: Zoom Platform Analytics Systems (8 core tables)

---

## Executive Summary

This document defines the comprehensive data mapping strategy for the Bronze layer implementation in the Medallion architecture for Zoom Platform Analytics Systems. The Bronze layer serves as the raw data ingestion layer, preserving original data structure while adding essential metadata for data lineage and governance.

### Key Objectives:
- Establish 1:1 mapping between source systems and Bronze layer tables
- Preserve raw data integrity and structure
- Implement comprehensive metadata management
- Enable efficient data ingestion and validation processes
- Support downstream Silver and Gold layer transformations

---

## Source System Overview

The Zoom Platform Analytics Systems consists of 8 core operational tables:

1. **Users** - User account information and plan details
2. **Meetings** - Meeting session data and metadata
3. **Participants** - Meeting participation tracking
4. **Feature_Usage** - Feature utilization metrics
5. **Webinars** - Webinar session information
6. **Support_Tickets** - Customer support interactions
7. **Licenses** - License management and assignments
8. **Billing_Events** - Billing and payment events

---

## Bronze Layer Architecture

### Design Principles
- **Raw Data Preservation**: Maintain original data structure and values
- **Metadata Enrichment**: Add load timestamps and source system tracking
- **Data Lineage**: Enable full traceability from source to Bronze
- **Scalability**: Support high-volume data ingestion
- **Governance**: Implement data quality and validation frameworks

### Naming Convention
- Bronze tables prefixed with `Bz_`
- Source field names preserved where possible
- Snowflake-compatible naming standards applied

---

## Comprehensive Data Mapping Table

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|---------------------|
| Bronze | Bz_Users | User_ID | Source | Users | User_ID | 1-1 Mapping |
| Bronze | Bz_Users | User_Name | Source | Users | User_Name | 1-1 Mapping |
| Bronze | Bz_Users | Email | Source | Users | Email | 1-1 Mapping |
| Bronze | Bz_Users | Company | Source | Users | Company | 1-1 Mapping |
| Bronze | Bz_Users | Plan_Type | Source | Users | Plan_Type | 1-1 Mapping |
| Bronze | Bz_Users | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Users | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Users | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Meetings | Meeting_ID | Source | Meetings | Meeting_ID | 1-1 Mapping |
| Bronze | Bz_Meetings | Host_ID | Source | Meetings | Host_ID | 1-1 Mapping |
| Bronze | Bz_Meetings | Meeting_Topic | Source | Meetings | Meeting_Topic | 1-1 Mapping |
| Bronze | Bz_Meetings | Start_Time | Source | Meetings | Start_Time | 1-1 Mapping |
| Bronze | Bz_Meetings | End_Time | Source | Meetings | End_Time | 1-1 Mapping |
| Bronze | Bz_Meetings | Duration_Minutes | Source | Meetings | Duration_Minutes | 1-1 Mapping |
| Bronze | Bz_Meetings | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Meetings | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Meetings | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Participants | Participant_ID | Source | Participants | Participant_ID | 1-1 Mapping |
| Bronze | Bz_Participants | Meeting_ID | Source | Participants | Meeting_ID | 1-1 Mapping |
| Bronze | Bz_Participants | User_ID | Source | Participants | User_ID | 1-1 Mapping |
| Bronze | Bz_Participants | Join_Time | Source | Participants | Join_Time | 1-1 Mapping |
| Bronze | Bz_Participants | Leave_Time | Source | Participants | Leave_Time | 1-1 Mapping |
| Bronze | Bz_Participants | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Participants | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Participants | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | Usage_ID | Source | Feature_Usage | Usage_ID | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | Meeting_ID | Source | Feature_Usage | Meeting_ID | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | Feature_Name | Source | Feature_Usage | Feature_Name | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | Usage_Count | Source | Feature_Usage | Usage_Count | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | Usage_Date | Source | Feature_Usage | Usage_Date | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Feature_Usage | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Webinars | Webinar_ID | Source | Webinars | Webinar_ID | 1-1 Mapping |
| Bronze | Bz_Webinars | Host_ID | Source | Webinars | Host_ID | 1-1 Mapping |
| Bronze | Bz_Webinars | Webinar_Topic | Source | Webinars | Webinar_Topic | 1-1 Mapping |
| Bronze | Bz_Webinars | Start_Time | Source | Webinars | Start_Time | 1-1 Mapping |
| Bronze | Bz_Webinars | End_Time | Source | Webinars | End_Time | 1-1 Mapping |
| Bronze | Bz_Webinars | Registrants | Source | Webinars | Registrants | 1-1 Mapping |
| Bronze | Bz_Webinars | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Webinars | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Webinars | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | Ticket_ID | Source | Support_Tickets | Ticket_ID | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | User_ID | Source | Support_Tickets | User_ID | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | Ticket_Type | Source | Support_Tickets | Ticket_Type | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | Resolution_Status | Source | Support_Tickets | Resolution_Status | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | Open_Date | Source | Support_Tickets | Open_Date | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Support_Tickets | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Licenses | License_ID | Source | Licenses | License_ID | 1-1 Mapping |
| Bronze | Bz_Licenses | License_Type | Source | Licenses | License_Type | 1-1 Mapping |
| Bronze | Bz_Licenses | Assigned_To_User_ID | Source | Licenses | Assigned_To_User_ID | 1-1 Mapping |
| Bronze | Bz_Licenses | Start_Date | Source | Licenses | Start_Date | 1-1 Mapping |
| Bronze | Bz_Licenses | End_Date | Source | Licenses | End_Date | 1-1 Mapping |
| Bronze | Bz_Licenses | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Licenses | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Licenses | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Billing_Events | Event_ID | Source | Billing_Events | Event_ID | 1-1 Mapping |
| Bronze | Bz_Billing_Events | User_ID | Source | Billing_Events | User_ID | 1-1 Mapping |
| Bronze | Bz_Billing_Events | Event_Type | Source | Billing_Events | Event_Type | 1-1 Mapping |
| Bronze | Bz_Billing_Events | Amount | Source | Billing_Events | Amount | 1-1 Mapping |
| Bronze | Bz_Billing_Events | Event_Date | Source | Billing_Events | Event_Date | 1-1 Mapping |
| Bronze | Bz_Billing_Events | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | Bz_Billing_Events | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | Bz_Billing_Events | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | audit_id | System | System | System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | table_name | System | System | System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | operation_type | System | System | System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | record_count | System | System | System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | load_timestamp | System | System | System | 1-1 Mapping |
| Bronze | Bz_Audit_Log | source_system | System | System | System | 1-1 Mapping |

---

## Data Ingestion Process

### Ingestion Strategy

#### 1. Full Load Process
- **Frequency**: Initial load and monthly full refresh
- **Method**: Complete table replacement
- **Validation**: Row count and data type validation
- **Rollback**: Previous version retention for 30 days

#### 2. Incremental Load Process
- **Frequency**: Daily incremental loads
- **Method**: CDC (Change Data Capture) based on source timestamps
- **Merge Strategy**: UPSERT operations based on primary keys
- **Conflict Resolution**: Latest timestamp wins

#### 3. Real-time Streaming (Future State)
- **Technology**: Snowflake Streams and Tasks
- **Latency**: Near real-time (< 5 minutes)
- **Error Handling**: Dead letter queue for failed records

### Data Validation Rules

#### Primary Key Validation
```sql
-- Example for Bz_Users table
SELECT COUNT(*) as duplicate_count
FROM Bz_Users
GROUP BY User_ID
HAVING COUNT(*) > 1;
```

#### Data Quality Checks
1. **Null Value Validation**: Check required fields for null values
2. **Data Type Validation**: Ensure data types match target schema
3. **Referential Integrity**: Validate foreign key relationships
4. **Business Rule Validation**: Custom validation rules per table

#### Metadata Validation
```sql
-- Validate load timestamps
SELECT table_name, 
       MIN(load_timestamp) as earliest_load,
       MAX(load_timestamp) as latest_load,
       COUNT(*) as record_count
FROM (
    SELECT 'Bz_Users' as table_name, load_timestamp FROM Bz_Users
    UNION ALL
    SELECT 'Bz_Meetings' as table_name, load_timestamp FROM Bz_Meetings
    -- Add other tables...
)
GROUP BY table_name;
```

---

## Snowflake Implementation

### Database Structure
```sql
-- Database and Schema Creation
CREATE DATABASE IF NOT EXISTS ZOOM_ANALYTICS;
CREATE SCHEMA IF NOT EXISTS ZOOM_ANALYTICS.BRONZE;
CREATE SCHEMA IF NOT EXISTS ZOOM_ANALYTICS.STAGING;
```

### Table Creation Scripts

#### Bz_Users Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Users (
    User_ID VARCHAR(50) NOT NULL,
    User_Name VARCHAR(255),
    Email VARCHAR(255),
    Company VARCHAR(255),
    Plan_Type VARCHAR(100),
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Meetings Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Meetings (
    Meeting_ID VARCHAR(50) NOT NULL,
    Host_ID VARCHAR(50),
    Meeting_Topic VARCHAR(500),
    Start_Time TIMESTAMP_NTZ,
    End_Time TIMESTAMP_NTZ,
    Duration_Minutes INTEGER,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Participants Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Participants (
    Participant_ID VARCHAR(50) NOT NULL,
    Meeting_ID VARCHAR(50),
    User_ID VARCHAR(50),
    Join_Time TIMESTAMP_NTZ,
    Leave_Time TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Feature_Usage Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Feature_Usage (
    Usage_ID VARCHAR(50) NOT NULL,
    Meeting_ID VARCHAR(50),
    Feature_Name VARCHAR(255),
    Usage_Count INTEGER,
    Usage_Date DATE,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Webinars Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Webinars (
    Webinar_ID VARCHAR(50) NOT NULL,
    Host_ID VARCHAR(50),
    Webinar_Topic VARCHAR(500),
    Start_Time TIMESTAMP_NTZ,
    End_Time TIMESTAMP_NTZ,
    Registrants INTEGER,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Support_Tickets Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Support_Tickets (
    Ticket_ID VARCHAR(50) NOT NULL,
    User_ID VARCHAR(50),
    Ticket_Type VARCHAR(100),
    Resolution_Status VARCHAR(50),
    Open_Date DATE,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Licenses Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Licenses (
    License_ID VARCHAR(50) NOT NULL,
    License_Type VARCHAR(100),
    Assigned_To_User_ID VARCHAR(50),
    Start_Date DATE,
    End_Date DATE,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Billing_Events Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Billing_Events (
    Event_ID VARCHAR(50) NOT NULL,
    User_ID VARCHAR(50),
    Event_Type VARCHAR(100),
    Amount DECIMAL(10,2),
    Event_Date DATE,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    update_timestamp TIMESTAMP_NTZ,
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

#### Bz_Audit_Log Table
```sql
CREATE OR REPLACE TABLE ZOOM_ANALYTICS.BRONZE.Bz_Audit_Log (
    audit_id VARCHAR(50) NOT NULL,
    table_name VARCHAR(100) NOT NULL,
    operation_type VARCHAR(20) NOT NULL,
    record_count INTEGER,
    load_timestamp TIMESTAMP_NTZ NOT NULL DEFAULT CURRENT_TIMESTAMP(),
    source_system VARCHAR(50) NOT NULL DEFAULT 'ZOOM_ANALYTICS'
);
```

### Performance Optimization

#### Clustering Keys
```sql
-- Cluster tables by frequently queried columns
ALTER TABLE ZOOM_ANALYTICS.BRONZE.Bz_Meetings 
CLUSTER BY (Start_Time, Host_ID);

ALTER TABLE ZOOM_ANALYTICS.BRONZE.Bz_Participants 
CLUSTER BY (Meeting_ID, Join_Time);

ALTER TABLE ZOOM_ANALYTICS.BRONZE.Bz_Feature_Usage 
CLUSTER BY (Usage_Date, Meeting_ID);
```

#### Time Travel and Data Retention
```sql
-- Set data retention for Bronze tables
ALTER TABLE ZOOM_ANALYTICS.BRONZE.Bz_Users 
SET DATA_RETENTION_TIME_IN_DAYS = 30;

ALTER TABLE ZOOM_ANALYTICS.BRONZE.Bz_Meetings 
SET DATA_RETENTION_TIME_IN_DAYS = 30;

-- Apply to all Bronze tables...
```

---

## API Cost Information

As per requirements, API cost tracking has been excluded from the Bronze layer implementation. The focus remains on core business data ingestion and analytics. Cost monitoring can be implemented through separate operational monitoring systems if needed in the future.

---

## Summary

This Bronze Layer Data Mapping document version 4 provides:
- **Complete field-level mapping** for all 8 source tables to Bronze layer tables
- **1-1 transformation rules** preserving raw data structure
- **Metadata management** with standardized audit columns
- **Snowflake optimization** for medallion architecture implementation
- **Comprehensive documentation** for data engineering teams
- **Performance optimization** guidelines
- **Data quality framework** with validation rules

The mapping covers 72 total field mappings across 9 Bronze tables (8 business tables + 1 audit table), ensuring complete data preservation and traceability from source to Bronze layer in the Zoom Platform Analytics Systems.

---

**Document Status**: Final  
**Version**: 4.0  
**Implementation Ready**: Yes  
**Next Phase**: Silver Layer Development