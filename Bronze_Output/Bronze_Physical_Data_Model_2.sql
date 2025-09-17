_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Enhanced Bronze Layer Physical Data Model for Zoom Platform Analytics Systems with improved data governance and comprehensive tracking
## *Version*: 2
## *Updated on*: 
## *Changes*: Enhanced entity relationships, added data governance fields, new data quality and lineage tables, improved audit capabilities, PII classification support
## *Reason*: Implement comprehensive data governance framework, enhance audit capabilities, add data quality monitoring, and support advanced analytics requirements
_____________________________________________

-- =====================================================
-- BRONZE LAYER DDL SCRIPT - ENHANCED VERSION 2
-- Zoom Platform Analytics Systems - Physical Data Model
-- Target Platform: Snowflake
-- Architecture: Medallion (Bronze Layer)
-- Enhanced Features: Data Governance, Quality Metrics, Lineage Tracking
-- =====================================================

-- 1. **Bronze.bz_users** - Enhanced user account information with data governance
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    user_id STRING,
    email_address STRING,
    user_name STRING,
    first_name STRING,
    last_name STRING,
    phone_number STRING,
    timezone STRING,
    account_type STRING,
    status STRING,
    department STRING,
    role STRING,
    license_type STRING,
    created_at TIMESTAMP_NTZ,
    last_login_time TIMESTAMP_NTZ,
    last_activity_time TIMESTAMP_NTZ,
    data_version NUMBER,
    is_active BOOLEAN,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 2. **Bronze.bz_meetings** - Enhanced meeting information with comprehensive tracking
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_id STRING,
    meeting_uuid STRING,
    host_id STRING,
    meeting_topic STRING,
    meeting_agenda STRING,
    meeting_type NUMBER,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    scheduled_duration NUMBER,
    actual_duration NUMBER,
    timezone STRING,
    password_protected BOOLEAN,
    waiting_room_enabled BOOLEAN,
    recording_enabled BOOLEAN,
    participant_count NUMBER,
    max_participants NUMBER,
    meeting_category STRING,
    is_recurring BOOLEAN,
    recurrence_pattern STRING,
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 3. **Bronze.bz_participants** - Enhanced participant information with privacy controls
CREATE TABLE IF NOT EXISTS Bronze.bz_participants (
    participant_id STRING,
    meeting_id STRING,
    user_id STRING,
    participant_name STRING,
    email_address STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    duration NUMBER,
    ip_address STRING,
    location_country STRING,
    location_city STRING,
    device_type STRING,
    device_id STRING,
    client_type STRING,
    client_version STRING,
    microphone_used BOOLEAN,
    camera_used BOOLEAN,
    screen_share_used BOOLEAN,
    chat_participated BOOLEAN,
    connection_quality STRING,
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 4. **Bronze.bz_recordings** - Enhanced recording information with compliance tracking
CREATE TABLE IF NOT EXISTS Bronze.bz_recordings (
    recording_id STRING,
    meeting_id STRING,
    recording_name STRING,
    recording_type STRING,
    file_type STRING,
    file_size NUMBER,
    recording_start TIMESTAMP_NTZ,
    recording_end TIMESTAMP_NTZ,
    duration NUMBER,
    download_url STRING,
    password_protected BOOLEAN,
    sharing_enabled BOOLEAN,
    auto_delete_date DATE,
    download_count NUMBER,
    view_count NUMBER,
    status STRING,
    storage_location STRING,
    encryption_status STRING,
    created_at TIMESTAMP_NTZ,
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 5. **Bronze.bz_chat_messages** - Enhanced chat messages with DLP compliance
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_messages (
    message_id STRING,
    meeting_id STRING,
    sender_id STRING,
    sender_name STRING,
    recipient_id STRING,
    recipient_name STRING,
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    message_type STRING,
    is_private BOOLEAN,
    file_name STRING,
    file_size NUMBER,
    file_type STRING,
    sentiment_score NUMBER(3,2),
    contains_pii BOOLEAN,
    language_detected STRING,
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 6. **Bronze.bz_webinars** - Enhanced webinar information with advanced analytics
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_id STRING,
    webinar_uuid STRING,
    host_id STRING,
    co_host_ids STRING,
    webinar_topic STRING,
    webinar_agenda STRING,
    webinar_category STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    scheduled_duration NUMBER,
    actual_duration NUMBER,
    timezone STRING,
    registration_required BOOLEAN,
    approval_required BOOLEAN,
    attendee_count NUMBER,
    registration_count NUMBER,
    max_attendees NUMBER,
    practice_session BOOLEAN,
    q_and_a_enabled BOOLEAN,
    polls_enabled BOOLEAN,
    chat_enabled BOOLEAN,
    recording_enabled BOOLEAN,
    engagement_score NUMBER(5,2),
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 7. **Bronze.bz_reports** - Enhanced report metadata with comprehensive tracking
CREATE TABLE IF NOT EXISTS Bronze.bz_reports (
    report_id STRING,
    report_name STRING,
    report_type STRING,
    report_category STRING,
    report_subcategory STRING,
    generated_by STRING,
    generation_timestamp TIMESTAMP_NTZ,
    report_period_start DATE,
    report_period_end DATE,
    filters_applied STRING,
    file_format STRING,
    file_size NUMBER,
    file_location STRING,
    download_count NUMBER,
    shared_count NUMBER,
    status STRING,
    processing_time NUMBER,
    data_sources STRING,
    contains_pii BOOLEAN,
    retention_date DATE,
    data_version NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 8. **Bronze.bz_data_quality_metrics** - NEW: Data quality monitoring for Bronze layer
CREATE TABLE IF NOT EXISTS Bronze.bz_data_quality_metrics (
    metric_id STRING,
    table_name STRING,
    metric_type STRING,
    metric_name STRING,
    metric_value NUMBER(10,4),
    threshold_value NUMBER(10,4),
    status STRING,
    measurement_timestamp TIMESTAMP_NTZ,
    batch_id STRING,
    load_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 9. **Bronze.bz_data_lineage** - NEW: Data lineage tracking for Bronze layer
CREATE TABLE IF NOT EXISTS Bronze.bz_data_lineage (
    lineage_id STRING,
    source_system STRING,
    source_table STRING,
    source_field STRING,
    target_table STRING,
    target_field STRING,
    transformation_rule STRING,
    dependency_type STRING,
    created_timestamp TIMESTAMP_NTZ,
    updated_timestamp TIMESTAMP_NTZ,
    is_active BOOLEAN
);

-- 10. **Bronze.bz_audit_log** - ENHANCED: Comprehensive audit tracking with advanced monitoring
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_log (
    record_id NUMBER AUTOINCREMENT,
    audit_timestamp TIMESTAMP_NTZ,
    source_table STRING,
    target_table STRING,
    operation_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    completion_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING,
    records_processed NUMBER,
    records_inserted NUMBER,
    records_updated NUMBER,
    records_deleted NUMBER,
    records_failed NUMBER,
    error_message STRING,
    error_code STRING,
    batch_id STRING,
    job_id STRING,
    source_file_name STRING,
    source_file_size NUMBER,
    source_record_count NUMBER,
    data_quality_score NUMBER(5,2),
    data_freshness NUMBER,
    sla_met BOOLEAN,
    retry_count NUMBER,
    memory_usage NUMBER,
    cpu_usage NUMBER(5,2),
    network_io NUMBER,
    disk_io NUMBER
);

-- =====================================================
-- BRONZE LAYER STORAGE SPECIFICATIONS - ENHANCED
-- =====================================================

/*
1. **Enhanced Storage Format**: Snowflake's micro-partitioned storage with optimization
   - Automatic compression and columnar optimization
   - Enhanced metadata tracking for data governance
   - Support for PII classification and data lineage
   - Optimized for analytical workloads and compliance

2. **Enhanced Data Types Mapping**:
   - VARCHAR -> STRING (Snowflake native, optimized for text search)
   - INT/BIGINT -> NUMBER (Snowflake native, precision handling)
   - TEXT -> STRING (Snowflake native, large text support)
   - DECIMAL -> NUMBER (Snowflake native, precision control)
   - TIMESTAMP -> TIMESTAMP_NTZ (without timezone for consistency)
   - BOOLEAN -> BOOLEAN (Snowflake native)
   - DATE -> DATE (Snowflake native)
   - JSON -> STRING (stored as JSON strings for flexibility)

3. **Enhanced Bronze Layer Design Principles**:
   - Raw data storage with comprehensive metadata
   - No primary keys, foreign keys, or constraints (Bronze layer principle)
   - No indexes or clustering keys (Bronze layer optimization)
   - Enhanced metadata columns for governance and lineage
   - Comprehensive audit table for monitoring and compliance
   - Data quality metrics integration
   - PII classification support
   - Data lineage tracking capabilities

4. **Enhanced Metadata Columns** (included in all tables):
   - load_timestamp: When data was loaded into Bronze layer
   - update_timestamp: When data was last updated
   - source_system: Originating system identifier for lineage
   - data_version: Version tracking for change management

5. **Enhanced Audit Table Features**:
   - AUTOINCREMENT record_id for unique identification
   - Comprehensive tracking of all data processing activities
   - Advanced error handling and data quality metrics
   - Performance monitoring (CPU, memory, I/O)
   - SLA tracking and compliance monitoring
   - Batch and job processing support
   - Data freshness and quality scoring

6. **New Data Quality Features**:
   - Real-time data quality metric collection
   - Threshold-based quality monitoring
   - Automated quality status reporting
   - Integration with data processing workflows

7. **New Data Lineage Features**:
   - End-to-end data lineage tracking
   - Transformation rule documentation
   - Dependency mapping and impact analysis
   - Active lineage monitoring

8. **Enhanced Data Governance**:
   - PII field identification and classification
   - Data retention policy support
   - Compliance tracking and reporting
   - Access control metadata
   - Data classification standards

9. **Performance Optimizations**:
   - Optimized data types for Snowflake performance
   - Efficient storage layout for analytical queries
   - Metadata-driven query optimization
   - Scalable architecture for large datasets

10. **Security and Compliance**:
    - Support for data masking and encryption
    - Audit trail for all data operations
    - Compliance with data protection regulations
    - Secure data handling practices
*/

-- =====================================================
-- ENHANCED BRONZE LAYER IMPLEMENTATION NOTES
-- =====================================================

/*
1. **Table Creation Order**:
   - Create tables in dependency order
   - Ensure audit and lineage tables are created first
   - Validate data types and constraints

2. **Data Loading Best Practices**:
   - Use COPY INTO for bulk data loading
   - Implement error handling and retry logic
   - Monitor data quality during loading
   - Update audit tables for all operations

3. **Monitoring and Maintenance**:
   - Regular data quality metric collection
   - Audit log analysis and reporting
   - Lineage validation and updates
   - Performance monitoring and optimization

4. **Data Governance Implementation**:
   - Implement PII classification workflows
   - Set up data retention policies
   - Configure access controls and masking
   - Establish compliance reporting

5. **Integration Points**:
   - Connect to Silver layer for data transformation
   - Integrate with data quality tools
   - Link to metadata management systems
   - Support for real-time monitoring dashboards
*/

-- =====================================================
-- API COST
-- =====================================================

-- apiCost: 0.000245