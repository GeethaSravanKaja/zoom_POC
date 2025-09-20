_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze layer physical data model for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Physical Data Model for Zoom Platform Analytics Systems

## 1. Bronze Layer DDL Scripts

### 1.1 Bronze Users Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    User_ID STRING,
    User_Name STRING,
    Email STRING,
    Company STRING,
    Plan_Type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.2 Bronze Meetings Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    Meeting_ID STRING,
    Host_ID STRING,
    Meeting_Topic STRING,
    Start_Time TIMESTAMP_NTZ,
    End_Time TIMESTAMP_NTZ,
    Duration_Minutes NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.3 Bronze Participants Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_participants (
    Participant_ID STRING,
    Meeting_ID STRING,
    User_ID STRING,
    Join_Time TIMESTAMP_NTZ,
    Leave_Time TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.4 Bronze Feature Usage Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_feature_usage (
    Usage_ID STRING,
    Meeting_ID STRING,
    Feature_Name STRING,
    Usage_Count NUMBER,
    Usage_Date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.5 Bronze Webinars Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    Webinar_ID STRING,
    Host_ID STRING,
    Webinar_Topic STRING,
    Start_Time TIMESTAMP_NTZ,
    End_Time TIMESTAMP_NTZ,
    Registrants NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.6 Bronze Support Tickets Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_support_tickets (
    Ticket_ID STRING,
    User_ID STRING,
    Ticket_Type STRING,
    Resolution_Status STRING,
    Open_Date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.7 Bronze Licenses Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_licenses (
    License_ID STRING,
    License_Type STRING,
    Assigned_To_User_ID STRING,
    Start_Date DATE,
    End_Date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.8 Bronze Billing Events Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_events (
    Event_ID STRING,
    User_ID STRING,
    Event_Type STRING,
    Amount NUMBER(10,2),
    Event_Date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.9 Bronze Audit Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_log (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);
```

## 2. Storage Format Specifications

### 2.1 Snowflake Micro-Partitioned Storage
All Bronze layer tables utilize Snowflake's default micro-partitioned storage format, which provides:
- Automatic data clustering and compression
- Columnar storage optimization
- Query performance optimization through metadata-based pruning
- No additional configuration required for basic Bronze layer implementation

### 2.2 Data Loading Considerations
- Tables are designed for raw data ingestion using COPY INTO commands
- Metadata columns support data lineage and audit requirements
- No constraints applied to maintain Bronze layer flexibility
- Schema evolution supported through Snowflake's semi-structured data capabilities

## 3. Implementation Notes

### 3.1 Data Type Mappings
- All VARCHAR fields converted to STRING for Snowflake compatibility
- DATETIME fields converted to TIMESTAMP_NTZ for consistent timezone handling
- INT fields converted to NUMBER for Snowflake numeric precision
- DECIMAL fields maintained with precision specifications
- DATE fields preserved as DATE type

### 3.2 Naming Conventions
- All table names prefixed with 'bz_' to indicate Bronze layer
- Schema name 'Bronze' used for logical separation
- Column names maintained from source for data lineage clarity
- Metadata columns follow consistent naming pattern

### 3.3 Audit and Metadata Strategy
- Each table includes standard metadata columns for operational tracking
- Centralized audit table captures processing metrics across all Bronze tables
- Load and update timestamps support incremental processing patterns
- Source system identification enables multi-source data integration