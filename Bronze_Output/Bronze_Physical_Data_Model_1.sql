_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Physical Data Model for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Physical Data Model for Zoom Platform Analytics Systems

## 1. Bronze Layer DDL Script

### 1.1 Core Business Entity Tables

#### 1.1.1 User Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_user (
    user_name STRING,
    email_address STRING,
    user_type STRING,
    department STRING,
    location STRING,
    license_type STRING,
    status STRING,
    registration_date DATE,
    last_login_date TIMESTAMP_NTZ,
    time_zone STRING,
    language_preference STRING,
    role STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.2 Account Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_account (
    account_name STRING,
    account_type STRING,
    subscription_plan STRING,
    billing_address STRING,
    contract_start_date DATE,
    contract_end_date DATE,
    account_manager STRING,
    industry STRING,
    company_size STRING,
    payment_status STRING,
    feature_set STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.3 Meeting Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting (
    meeting_topic STRING,
    meeting_type STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration NUMBER,
    host_name STRING,
    meeting_password STRING,
    waiting_room BOOLEAN,
    recording_permission STRING,
    maximum_participants NUMBER,
    actual_participants NUMBER,
    meeting_status STRING,
    time_zone STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.4 Participant Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_participant (
    participant_name STRING,
    email_address STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    duration NUMBER,
    participant_type STRING,
    connection_type STRING,
    location STRING,
    audio_status STRING,
    video_status STRING,
    screen_share BOOLEAN,
    chat_activity STRING,
    attention_score NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.5 Recording Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_recording (
    recording_name STRING,
    recording_type STRING,
    file_size NUMBER,
    duration NUMBER,
    storage_location STRING,
    access_permission STRING,
    download_count NUMBER,
    creation_date DATE,
    expiration_date DATE,
    encryption_status STRING,
    transcription_status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.6 Room Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_room (
    room_name STRING,
    room_type STRING,
    capacity NUMBER,
    location STRING,
    equipment_list STRING,
    booking_status STRING,
    utilization_rate NUMBER,
    technical_specifications STRING,
    maintenance_schedule STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.7 Device Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_device (
    device_name STRING,
    device_type STRING,
    operating_system STRING,
    zoom_client_version STRING,
    network_connection STRING,
    audio_device STRING,
    video_device STRING,
    performance_metrics STRING,
    last_update TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.1.8 Session Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_session (
    session_start_time TIMESTAMP_NTZ,
    session_end_time TIMESTAMP_NTZ,
    session_duration NUMBER,
    session_type STRING,
    ip_address STRING,
    geographic_location STRING,
    device_information STRING,
    connection_quality STRING,
    activities_performed STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.2 Analytics and Reporting Entity Tables

#### 1.2.1 Report Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_report (
    report_name STRING,
    report_type STRING,
    generation_date DATE,
    report_period STRING,
    report_format STRING,
    recipient_list STRING,
    data_sources STRING,
    refresh_frequency STRING,
    report_size NUMBER,
    delivery_method STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.2 Dashboard Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_dashboard (
    dashboard_name STRING,
    dashboard_type STRING,
    widget_count NUMBER,
    data_refresh_rate STRING,
    access_permissions STRING,
    customization_level STRING,
    export_options STRING,
    filter_capabilities STRING,
    alert_configuration STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.3 Metric Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_metric (
    metric_name STRING,
    metric_type STRING,
    measurement_unit STRING,
    calculation_method STRING,
    data_source STRING,
    update_frequency STRING,
    target_value NUMBER,
    current_value NUMBER,
    trend_direction STRING,
    alert_threshold NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.4 Event Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_event (
    event_name STRING,
    event_type STRING,
    event_timestamp TIMESTAMP_NTZ,
    event_source STRING,
    event_severity STRING,
    event_description STRING,
    user_context STRING,
    system_context STRING,
    event_outcome STRING,
    correlation_information STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.5 Usage Summary Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_usage_summary (
    summary_period STRING,
    summary_type STRING,
    total_meetings NUMBER,
    total_participants NUMBER,
    total_duration NUMBER,
    peak_concurrent_users NUMBER,
    storage_consumed NUMBER,
    bandwidth_usage NUMBER,
    feature_utilization STRING,
    growth_metrics STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.6 Quality Metric Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_quality_metric (
    metric_name STRING,
    measurement_type STRING,
    quality_score NUMBER,
    measurement_timestamp TIMESTAMP_NTZ,
    sample_size NUMBER,
    geographic_region STRING,
    network_type STRING,
    device_category STRING,
    issue_count NUMBER,
    resolution_status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.7 Integration Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_integration (
    integration_name STRING,
    integration_type STRING,
    api_version STRING,
    authentication_method STRING,
    data_sync_frequency STRING,
    integration_status STRING,
    configuration_settings STRING,
    usage_volume NUMBER,
    error_rate NUMBER,
    performance_metrics STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

#### 1.2.8 API Call Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_api_call (
    api_endpoint STRING,
    request_method STRING,
    request_timestamp TIMESTAMP_NTZ,
    response_time NUMBER,
    response_status STRING,
    request_size NUMBER,
    response_size NUMBER,
    authentication_token STRING,
    rate_limit_status STRING,
    error_message STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);
```

### 1.3 Audit Table

#### 1.3.1 Bronze Layer Audit Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_audit (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);
```

## 2. Bronze Layer Implementation Notes

### 2.1 Data Type Specifications
1. **STRING**: Used for all text-based fields with variable length requirements
2. **NUMBER**: Used for all numeric fields including integers, decimals, and floating-point values
3. **BOOLEAN**: Used for true/false flag fields
4. **DATE**: Used for date-only fields without time components
5. **TIMESTAMP_NTZ**: Used for date and time fields without timezone information

### 2.2 Metadata Columns
1. **load_timestamp**: Records when data was initially loaded into the Bronze layer
2. **update_timestamp**: Records when data was last modified in the Bronze layer
3. **source_system**: Identifies the originating system for data lineage tracking

### 2.3 Table Naming Convention
1. All Bronze layer tables use the prefix 'bz_' followed by the entity name
2. Schema name 'Bronze' is used to organize all Bronze layer tables
3. Table names use lowercase with underscores for readability

### 2.4 Snowflake Compatibility Features
1. **CREATE TABLE IF NOT EXISTS**: Prevents errors during repeated deployments
2. **No Primary Keys or Foreign Keys**: Follows Bronze layer best practices for raw data storage
3. **No Constraints**: Allows for flexible data ingestion without validation restrictions
4. **Micro-partitioned Storage**: Leverages Snowflake's default storage optimization
5. **AUTOINCREMENT**: Used for audit table record identification

### 2.5 Data Loading Considerations
1. Tables are designed to store raw data as-is from source systems
2. Metadata columns support data lineage and audit requirements
3. Flexible data types accommodate varying source data formats
4. Audit table tracks all data processing activities

### 2.6 Performance Optimization
1. Tables can be clustered on frequently queried columns in higher environments
2. Time-based partitioning can be implemented using timestamp columns
3. Compression is handled automatically by Snowflake's micro-partitioning

## 3. API Cost

**apiCost: 7344.000000**