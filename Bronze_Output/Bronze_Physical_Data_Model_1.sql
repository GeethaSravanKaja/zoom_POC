_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Physical Data Model for Zoom Platform Analytics Systems with Snowflake-compatible DDL scripts
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Physical Data Model - Zoom Platform Analytics Systems

## 1. Bronze Layer DDL Scripts

This document contains the complete DDL scripts for the Bronze layer tables in the Medallion architecture, designed for Snowflake compatibility. All tables store raw data as-is with additional metadata columns for data lineage and processing tracking.

### 1.1 Users Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    user_id STRING,
    user_name STRING,
    email STRING,
    company STRING,
    plan_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.2 Meetings Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_id STRING,
    host_id STRING,
    meeting_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration_minutes NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.3 Participants Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_participants (
    participant_id STRING,
    meeting_id STRING,
    user_id STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.4 Feature Usage Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_feature_usage (
    usage_id STRING,
    meeting_id STRING,
    feature_name STRING,
    usage_count NUMBER,
    usage_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.5 Webinars Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_id STRING,
    host_id STRING,
    webinar_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    registrants NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.6 Support Tickets Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_support_tickets (
    ticket_id STRING,
    user_id STRING,
    ticket_type STRING,
    resolution_status STRING,
    open_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.7 Licenses Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_licenses (
    license_id STRING,
    license_type STRING,
    assigned_to_user_id STRING,
    start_date DATE,
    end_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.8 Billing Events Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_events (
    event_id STRING,
    user_id STRING,
    event_type STRING,
    amount NUMBER(10,2),
    event_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.9 Audit Table
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

## 2. Data Type Mappings

The following data type conversions have been applied for Snowflake compatibility:

### 2.1 Source to Snowflake Data Type Mapping
- **VARCHAR(n)** → **STRING**
- **DATETIME** → **TIMESTAMP_NTZ**
- **INT** → **NUMBER**
- **DECIMAL(10,2)** → **NUMBER(10,2)**
- **DATE** → **DATE**

### 2.2 Metadata Columns Added
All Bronze layer tables include the following metadata columns:
- **load_timestamp** (TIMESTAMP_NTZ) - Timestamp when the record was loaded into Bronze layer
- **update_timestamp** (TIMESTAMP_NTZ) - Timestamp when the record was last updated
- **source_system** (STRING) - Identifier of the source system providing the data

## 3. Bronze Layer Design Principles

### 3.1 Snowflake Best Practices Applied
1. **No Constraints**: Primary keys, foreign keys, and other constraints are not included as per Bronze layer best practices
2. **Micro-partitioned Storage**: Default Snowflake storage format is used for optimal performance
3. **CREATE TABLE IF NOT EXISTS**: Ensures idempotent script execution
4. **Appropriate Data Types**: Snowflake-native data types are used for optimal performance
5. **Schema Naming**: All tables use the Bronze schema with 'bz_' prefix

### 3.2 Raw Data Storage
- Tables store data as-is from source systems
- No data transformations or business logic applied
- All source columns preserved with appropriate data type conversions
- Nullable fields maintained as nullable in Bronze layer

### 3.3 Data Lineage and Auditing
- Audit table tracks all data processing activities
- Metadata columns enable data lineage tracking
- Processing timestamps support data quality monitoring
- Source system identification enables multi-source data integration

## 4. Table Descriptions

### 4.1 Bronze.bz_users
**Purpose**: Stores raw user account information from the Zoom platform
**Source Fields**: user_id, user_name, email, company, plan_type
**Key Characteristics**: Contains all user profile and subscription information

### 4.2 Bronze.bz_meetings
**Purpose**: Stores raw meeting session data including timing and host information
**Source Fields**: meeting_id, host_id, meeting_topic, start_time, end_time, duration_minutes
**Key Characteristics**: Captures all meeting metadata and duration metrics

### 4.3 Bronze.bz_participants
**Purpose**: Stores raw participant data for meeting attendance tracking
**Source Fields**: participant_id, meeting_id, user_id, join_time, leave_time
**Key Characteristics**: Enables participant-level analytics and engagement tracking

### 4.4 Bronze.bz_feature_usage
**Purpose**: Stores raw feature utilization data during meetings
**Source Fields**: usage_id, meeting_id, feature_name, usage_count, usage_date
**Key Characteristics**: Tracks adoption and usage patterns of platform features

### 4.5 Bronze.bz_webinars
**Purpose**: Stores raw webinar event data including registration information
**Source Fields**: webinar_id, host_id, webinar_topic, start_time, end_time, registrants
**Key Characteristics**: Captures large-scale event metrics and attendance data

### 4.6 Bronze.bz_support_tickets
**Purpose**: Stores raw customer support interaction data
**Source Fields**: ticket_id, user_id, ticket_type, resolution_status, open_date
**Key Characteristics**: Enables support analytics and customer satisfaction tracking

### 4.7 Bronze.bz_licenses
**Purpose**: Stores raw license assignment and management data
**Source Fields**: license_id, license_type, assigned_to_user_id, start_date, end_date
**Key Characteristics**: Tracks license utilization and subscription management

### 4.8 Bronze.bz_billing_events
**Purpose**: Stores raw billing and financial transaction data
**Source Fields**: event_id, user_id, event_type, amount, event_date
**Key Characteristics**: Enables financial analytics and revenue tracking

### 4.9 Bronze.bz_audit_log
**Purpose**: Tracks all data processing activities and system operations
**Source Fields**: record_id, source_table, load_timestamp, processed_by, processing_time, status
**Key Characteristics**: Provides comprehensive audit trail for data governance

## 5. Implementation Notes

### 5.1 Deployment Instructions
1. Execute DDL scripts in the order provided
2. Ensure Bronze schema exists before table creation
3. Verify Snowflake warehouse is active and properly sized
4. Test table creation with sample data loads

### 5.2 Data Loading Considerations
- Use Snowflake COPY INTO commands for bulk data loading
- Implement error handling for data quality issues
- Set up monitoring for load performance and success rates
- Configure appropriate warehouse sizing for expected data volumes

### 5.3 Maintenance Requirements
- Regular monitoring of table growth and performance
- Periodic review of metadata column usage
- Audit log cleanup based on retention policies
- Performance optimization through clustering if needed for large tables