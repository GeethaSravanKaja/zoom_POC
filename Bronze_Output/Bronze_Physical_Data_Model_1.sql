_____________________________________________
## *Author*: AAVA
## *Created on*:   
## *Description*: Bronze Physical Data Model for Zoom Platform Analytics Systems in Medallion Architecture
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Physical Data Model for Zoom Platform Analytics Systems

## 1. Bronze Layer DDL Script

### 1.1 Bronze Users Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    user_name STRING,
    email STRING,
    company STRING,
    plan_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.2 Bronze Meetings Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration_minutes NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.3 Bronze Participants Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_participants (
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.4 Bronze Feature Usage Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_feature_usage (
    feature_name STRING,
    usage_count NUMBER,
    usage_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.5 Bronze Webinars Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    registrants NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.6 Bronze Support Tickets Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_support_tickets (
    ticket_type STRING,
    resolution_status STRING,
    open_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.7 Bronze Licenses Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_licenses (
    license_type STRING,
    start_date DATE,
    end_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.8 Bronze Billing Events Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_events (
    event_type STRING,
    amount NUMBER(10,2),
    event_date DATE,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.9 Bronze Audit Log Table
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

## 2. Table Specifications

### 2.1 Data Type Mapping
1. **STRING**: Used for all text-based columns including names, topics, types, and status fields
2. **NUMBER**: Used for numeric values including counts, durations, and amounts
3. **NUMBER(10,2)**: Used specifically for monetary amounts with precision
4. **DATE**: Used for date-only fields like open_date, start_date, end_date
5. **TIMESTAMP_NTZ**: Used for datetime fields and metadata timestamps
6. **NUMBER AUTOINCREMENT**: Used for the audit log record_id as an auto-incrementing identifier

### 2.2 Metadata Columns
1. **load_timestamp**: Records when data was initially loaded into the Bronze layer
2. **update_timestamp**: Records when data was last modified in the Bronze layer
3. **source_system**: Identifies the originating system for data lineage tracking

### 2.3 Storage Specifications
1. **Storage Format**: Default Snowflake micro-partitioned storage
2. **Schema**: All tables created in the Bronze schema
3. **Table Naming**: All tables prefixed with 'bz_' following Bronze layer conventions
4. **Constraints**: No primary keys, foreign keys, or other constraints as per Bronze layer requirements

## 3. Implementation Notes

### 3.1 Snowflake Compatibility
1. All DDL scripts use Snowflake-supported data types
2. CREATE TABLE IF NOT EXISTS syntax prevents errors on re-execution
3. No unsupported features like foreign key constraints or triggers
4. Compatible with Snowflake's ANSI SQL implementation

### 3.2 Bronze Layer Design Principles
1. **Raw Data Storage**: Tables store data as-is from source systems
2. **No Transformations**: Data structure mirrors source with minimal changes
3. **Audit Trail**: Comprehensive audit logging for data lineage
4. **Metadata Enrichment**: Standard metadata columns for operational tracking

### 3.3 Data Loading Considerations
1. Use COPY INTO commands for bulk data loading
2. Leverage Snowflake's automatic compression and optimization
3. Monitor clustering effectiveness for large tables
4. Implement appropriate warehouse sizing for loading operations