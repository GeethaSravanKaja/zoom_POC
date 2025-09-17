_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Enhanced Bronze Physical Data Model for Zoom Platform Analytics Systems with comprehensive improvements
## *Version*: 2 
## *Updated on*: 
## *Changes*: Added unique ID fields, record_hash for change detection, data_quality_score fields, batch_id tracking, enhanced metadata with source_file_name, data lineage and quality metrics tables, precise NUMBER types, boolean flags, relationship fields, performance optimizations
## *Reason*: Implementing Snowflake best practices for better data lineage, change detection, quality monitoring, processing tracking, and performance optimization in the Bronze layer
_____________________________________________

# Enhanced Bronze Physical Data Model for Zoom Platform Analytics Systems

## 1. Bronze Layer DDL Script

### 1.1 Core Business Entity Tables

#### 1.1.1 User Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_user (
    user_id STRING,
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
    is_active BOOLEAN,
    is_premium_user BOOLEAN,
    account_id STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.2 Account Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_account (
    account_id STRING,
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
    is_enterprise BOOLEAN,
    is_trial_account BOOLEAN,
    contract_value NUMBER(15,2),
    user_count NUMBER(10,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.3 Meeting Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting (
    meeting_id STRING,
    meeting_topic STRING,
    meeting_type STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration NUMBER(10,0),
    host_name STRING,
    host_user_id STRING,
    meeting_password STRING,
    waiting_room BOOLEAN,
    recording_permission STRING,
    maximum_participants NUMBER(8,0),
    actual_participants NUMBER(8,0),
    meeting_status STRING,
    time_zone STRING,
    is_recurring BOOLEAN,
    is_recorded BOOLEAN,
    account_id STRING,
    room_id STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.4 Participant Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_participant (
    participant_id STRING,
    participant_name STRING,
    email_address STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    duration NUMBER(10,0),
    participant_type STRING,
    connection_type STRING,
    location STRING,
    audio_status STRING,
    video_status STRING,
    screen_share BOOLEAN,
    chat_activity STRING,
    attention_score NUMBER(5,2),
    is_host BOOLEAN,
    is_co_host BOOLEAN,
    meeting_id STRING,
    user_id STRING,
    device_id STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.5 Recording Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_recording (
    recording_id STRING,
    recording_name STRING,
    recording_type STRING,
    file_size NUMBER(15,0),
    duration NUMBER(10,0),
    storage_location STRING,
    access_permission STRING,
    download_count NUMBER(10,0),
    creation_date DATE,
    expiration_date DATE,
    encryption_status STRING,
    transcription_status STRING,
    is_cloud_recording BOOLEAN,
    is_downloadable BOOLEAN,
    meeting_id STRING,
    host_user_id STRING,
    file_format STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.6 Room Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_room (
    room_id STRING,
    room_name STRING,
    room_type STRING,
    capacity NUMBER(6,0),
    location STRING,
    equipment_list STRING,
    booking_status STRING,
    utilization_rate NUMBER(5,2),
    technical_specifications STRING,
    maintenance_schedule STRING,
    is_zoom_room BOOLEAN,
    is_available BOOLEAN,
    account_id STRING,
    building_id STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.7 Device Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_device (
    device_id STRING,
    device_name STRING,
    device_type STRING,
    operating_system STRING,
    zoom_client_version STRING,
    network_connection STRING,
    audio_device STRING,
    video_device STRING,
    performance_metrics STRING,
    last_update TIMESTAMP_NTZ,
    is_mobile_device BOOLEAN,
    is_company_managed BOOLEAN,
    user_id STRING,
    room_id STRING,
    cpu_usage NUMBER(5,2),
    memory_usage NUMBER(5,2),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.1.8 Session Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_session (
    session_id STRING,
    session_start_time TIMESTAMP_NTZ,
    session_end_time TIMESTAMP_NTZ,
    session_duration NUMBER(10,0),
    session_type STRING,
    ip_address STRING,
    geographic_location STRING,
    device_information STRING,
    connection_quality STRING,
    activities_performed STRING,
    is_successful_session BOOLEAN,
    is_mobile_session BOOLEAN,
    user_id STRING,
    device_id STRING,
    meeting_id STRING,
    bandwidth_usage NUMBER(12,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

### 1.2 Analytics and Reporting Entity Tables

#### 1.2.1 Report Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_report (
    report_id STRING,
    report_name STRING,
    report_type STRING,
    generation_date DATE,
    report_period STRING,
    report_format STRING,
    recipient_list STRING,
    data_sources STRING,
    refresh_frequency STRING,
    report_size NUMBER(12,0),
    delivery_method STRING,
    is_automated BOOLEAN,
    is_scheduled BOOLEAN,
    dashboard_id STRING,
    created_by_user_id STRING,
    execution_time NUMBER(8,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.2 Dashboard Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_dashboard (
    dashboard_id STRING,
    dashboard_name STRING,
    dashboard_type STRING,
    widget_count NUMBER(4,0),
    data_refresh_rate STRING,
    access_permissions STRING,
    customization_level STRING,
    export_options STRING,
    filter_capabilities STRING,
    alert_configuration STRING,
    is_public BOOLEAN,
    is_real_time BOOLEAN,
    owner_user_id STRING,
    account_id STRING,
    view_count NUMBER(10,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.3 Metric Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_metric (
    metric_id STRING,
    metric_name STRING,
    metric_type STRING,
    measurement_unit STRING,
    calculation_method STRING,
    data_source STRING,
    update_frequency STRING,
    target_value NUMBER(15,4),
    current_value NUMBER(15,4),
    trend_direction STRING,
    alert_threshold NUMBER(15,4),
    is_kpi BOOLEAN,
    is_active BOOLEAN,
    dashboard_id STRING,
    report_id STRING,
    variance_percentage NUMBER(7,4),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.4 Event Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_event (
    event_id STRING,
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
    is_system_event BOOLEAN,
    is_user_event BOOLEAN,
    user_id STRING,
    meeting_id STRING,
    session_id STRING,
    error_code STRING,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.5 Usage Summary Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_usage_summary (
    summary_id STRING,
    summary_period STRING,
    summary_type STRING,
    total_meetings NUMBER(12,0),
    total_participants NUMBER(15,0),
    total_duration NUMBER(15,0),
    peak_concurrent_users NUMBER(10,0),
    storage_consumed NUMBER(18,0),
    bandwidth_usage NUMBER(18,0),
    feature_utilization STRING,
    growth_metrics STRING,
    is_monthly_summary BOOLEAN,
    is_daily_summary BOOLEAN,
    account_id STRING,
    period_start_date DATE,
    period_end_date DATE,
    average_meeting_duration NUMBER(10,2),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.6 Quality Metric Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_quality_metric (
    quality_metric_id STRING,
    metric_name STRING,
    measurement_type STRING,
    quality_score NUMBER(5,2),
    measurement_timestamp TIMESTAMP_NTZ,
    sample_size NUMBER(10,0),
    geographic_region STRING,
    network_type STRING,
    device_category STRING,
    issue_count NUMBER(8,0),
    resolution_status STRING,
    is_real_time_metric BOOLEAN,
    is_aggregated_metric BOOLEAN,
    meeting_id STRING,
    session_id STRING,
    participant_id STRING,
    threshold_breach BOOLEAN,
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.7 Integration Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_integration (
    integration_id STRING,
    integration_name STRING,
    integration_type STRING,
    api_version STRING,
    authentication_method STRING,
    data_sync_frequency STRING,
    integration_status STRING,
    configuration_settings STRING,
    usage_volume NUMBER(12,0),
    error_rate NUMBER(5,4),
    performance_metrics STRING,
    is_active BOOLEAN,
    is_bidirectional BOOLEAN,
    account_id STRING,
    last_sync_timestamp TIMESTAMP_NTZ,
    sync_success_rate NUMBER(5,2),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.2.8 API Call Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_api_call (
    api_call_id STRING,
    api_endpoint STRING,
    request_method STRING,
    request_timestamp TIMESTAMP_NTZ,
    response_time NUMBER(8,0),
    response_status STRING,
    request_size NUMBER(10,0),
    response_size NUMBER(10,0),
    authentication_token STRING,
    rate_limit_status STRING,
    error_message STRING,
    is_successful BOOLEAN,
    is_rate_limited BOOLEAN,
    user_id STRING,
    integration_id STRING,
    request_id STRING,
    http_status_code NUMBER(3,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

### 1.3 Data Lineage and Quality Tables

#### 1.3.1 Data Lineage Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_data_lineage (
    lineage_id STRING,
    source_table STRING,
    source_column STRING,
    target_table STRING,
    target_column STRING,
    transformation_rule STRING,
    data_flow_direction STRING,
    processing_timestamp TIMESTAMP_NTZ,
    batch_id STRING,
    pipeline_name STRING,
    transformation_type STRING,
    is_direct_mapping BOOLEAN,
    is_calculated_field BOOLEAN,
    dependency_level NUMBER(3,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

#### 1.3.2 Data Quality Metrics Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_data_quality_metrics (
    quality_check_id STRING,
    table_name STRING,
    column_name STRING,
    quality_dimension STRING,
    check_type STRING,
    check_result STRING,
    quality_score NUMBER(5,2),
    threshold_value NUMBER(15,4),
    actual_value NUMBER(15,4),
    check_timestamp TIMESTAMP_NTZ,
    batch_id STRING,
    rule_definition STRING,
    is_passed BOOLEAN,
    is_critical_check BOOLEAN,
    error_count NUMBER(10,0),
    total_records NUMBER(15,0),
    record_hash STRING,
    data_quality_score NUMBER(5,2),
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING,
    source_file_name STRING
);
```

### 1.4 Audit Table

#### 1.4.1 Enhanced Bronze Layer Audit Table
```sql
CREATE TABLE IF NOT EXISTS Bronze.bz_audit (
    record_id NUMBER AUTOINCREMENT,
    audit_id STRING,
    source_table STRING,
    operation_type STRING,
    records_processed NUMBER(15,0),
    records_successful NUMBER(15,0),
    records_failed NUMBER(15,0),
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER(10,0),
    status STRING,
    batch_id STRING,
    pipeline_name STRING,
    source_file_name STRING,
    file_size NUMBER(15,0),
    checksum STRING,
    error_details STRING,
    is_full_load BOOLEAN,
    is_incremental_load BOOLEAN,
    data_quality_score NUMBER(5,2),
    record_hash STRING
);
```

## 2. Enhanced Bronze Layer Implementation Notes

### 2.1 Enhanced Data Type Specifications
1. **STRING**: Used for all text-based fields with variable length requirements
2. **NUMBER(precision,scale)**: Used with precise specifications for numeric fields
   - **NUMBER(5,2)**: For percentages and small decimal values (e.g., 999.99)
   - **NUMBER(10,0)**: For integer counts and durations
   - **NUMBER(15,2)**: For monetary values and large decimal numbers
   - **NUMBER(18,0)**: For very large integer values like storage sizes
3. **BOOLEAN**: Used for true/false flag fields and categorical indicators
4. **DATE**: Used for date-only fields without time components
5. **TIMESTAMP_NTZ**: Used for date and time fields without timezone information

### 2.2 Enhanced Metadata Columns
1. **load_timestamp**: Records when data was initially loaded into the Bronze layer
2. **update_timestamp**: Records when data was last modified in the Bronze layer
3. **source_system**: Identifies the originating system for data lineage tracking
4. **source_file_name**: Tracks the specific source file for detailed lineage
5. **record_hash**: SHA-256 hash for change detection and data integrity
6. **data_quality_score**: Numeric score (0-100) indicating data quality assessment
7. **batch_id**: Unique identifier for processing batch tracking

### 2.3 Enhanced Table Features
1. **Unique ID Fields**: Every table now has a primary identifier field
2. **Relationship Fields**: Foreign key references without constraints for data relationships
3. **Boolean Flags**: Categorical indicators for improved filtering and analysis
4. **Precise Numeric Types**: Optimized NUMBER specifications for performance
5. **Change Detection**: Record hash fields enable efficient change data capture
6. **Quality Monitoring**: Data quality scores support automated quality assessment

### 2.4 Data Lineage and Quality Enhancement
1. **Data Lineage Table**: Tracks data flow and transformations across the platform
2. **Data Quality Metrics Table**: Monitors and records quality check results
3. **Enhanced Audit Table**: Comprehensive processing and quality tracking
4. **Batch Processing**: Improved tracking of data processing batches

### 2.5 Snowflake Performance Optimizations
1. **Precise Data Types**: Optimized storage and query performance
2. **Boolean Indexing**: Efficient filtering on categorical fields
3. **Clustering Recommendations**: Tables can be clustered on:
   - Time-based columns (load_timestamp, event_timestamp)
   - ID fields for join optimization
   - Status and type fields for filtering
4. **Micro-partitioning**: Leverages Snowflake's automatic optimization

### 2.6 Enhanced Data Loading Considerations
1. **Change Detection**: Record hash enables efficient incremental loading
2. **Quality Assessment**: Automated quality scoring during ingestion
3. **Batch Tracking**: Comprehensive processing lineage and monitoring
4. **Error Handling**: Enhanced audit capabilities for troubleshooting
5. **File-level Lineage**: Source file tracking for detailed data provenance

### 2.7 Advanced Analytics Support
1. **Relationship Mapping**: Foreign key fields support advanced analytics
2. **Boolean Analytics**: Categorical analysis and segmentation capabilities
3. **Quality Analytics**: Data quality trend analysis and monitoring
4. **Performance Metrics**: Processing time and efficiency tracking

### 2.8 Compliance and Governance
1. **Data Lineage**: Full traceability from source to target
2. **Quality Monitoring**: Automated quality assessment and reporting
3. **Audit Trail**: Comprehensive processing and change tracking
4. **Data Integrity**: Hash-based validation and verification

## 3. API Cost

**apiCost: 8756.000000**