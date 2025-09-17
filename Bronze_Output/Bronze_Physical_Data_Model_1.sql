_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Physical Data Model for Zoom Platform Analytics Systems using Snowflake SQL
## *Version*: 1
## *Updated on*: 
_____________________________________________

-- =====================================================
-- BRONZE LAYER DDL SCRIPT
-- Zoom Platform Analytics Systems - Physical Data Model
-- Target Platform: Snowflake
-- Architecture: Medallion (Bronze Layer)
-- =====================================================

-- 1. **Bronze.bz_users** - Store user account information
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
    created_at TIMESTAMP_NTZ,
    last_login_time TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 2. **Bronze.bz_meetings** - Store meeting information
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_id STRING,
    meeting_uuid STRING,
    host_id STRING,
    meeting_topic STRING,
    meeting_type NUMBER,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration NUMBER,
    timezone STRING,
    password_protected BOOLEAN,
    waiting_room_enabled BOOLEAN,
    recording_enabled BOOLEAN,
    participant_count NUMBER,
    max_participants NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 3. **Bronze.bz_participants** - Store participant information
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
    device_type STRING,
    device_id STRING,
    client_type STRING,
    microphone_used BOOLEAN,
    camera_used BOOLEAN,
    screen_share_used BOOLEAN,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 4. **Bronze.bz_recordings** - Store meeting recording information
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
    status STRING,
    created_at TIMESTAMP_NTZ,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 5. **Bronze.bz_chat_messages** - Store chat messages
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_messages (
    message_id STRING,
    meeting_id STRING,
    sender_id STRING,
    sender_name STRING,
    recipient_id STRING,
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    message_type STRING,
    file_name STRING,
    file_size NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 6. **Bronze.bz_webinars** - Store webinar information
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_id STRING,
    webinar_uuid STRING,
    host_id STRING,
    webinar_topic STRING,
    webinar_agenda STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration NUMBER,
    timezone STRING,
    registration_required BOOLEAN,
    attendee_count NUMBER,
    registration_count NUMBER,
    max_attendees NUMBER,
    practice_session BOOLEAN,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 7. **Bronze.bz_reports** - Store report metadata
CREATE TABLE IF NOT EXISTS Bronze.bz_reports (
    report_id STRING,
    report_name STRING,
    report_type STRING,
    report_category STRING,
    generated_by STRING,
    generation_timestamp TIMESTAMP_NTZ,
    report_period_start DATE,
    report_period_end DATE,
    file_format STRING,
    file_size NUMBER,
    download_count NUMBER,
    status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 8. **Bronze.bz_audit_log** - Track data processing activities (Enhanced Audit Table)
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_log (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING,
    records_processed NUMBER,
    records_failed NUMBER,
    error_message STRING,
    batch_id STRING,
    source_file_name STRING,
    target_table STRING,
    data_quality_score NUMBER,
    created_timestamp TIMESTAMP_NTZ
);

-- =====================================================
-- BRONZE LAYER STORAGE SPECIFICATIONS
-- =====================================================

/*
1. **Storage Format**: Snowflake's default micro-partitioned storage
   - Automatic compression and optimization
   - Columnar storage for analytical workloads
   - No external format configuration required

2. **Data Types Mapping**:
   - VARCHAR -> STRING (Snowflake native)
   - INT/BIGINT -> NUMBER (Snowflake native)
   - TEXT -> STRING (Snowflake native)
   - DECIMAL -> NUMBER (Snowflake native)
   - TIMESTAMP -> TIMESTAMP_NTZ (without timezone)
   - BOOLEAN -> BOOLEAN (Snowflake native)
   - DATE -> DATE (Snowflake native)

3. **Bronze Layer Design Principles**:
   - Raw data storage as-is from source systems
   - No primary keys, foreign keys, or constraints
   - No indexes or clustering keys (Bronze layer)
   - Metadata columns for data lineage tracking
   - Audit table for processing monitoring

4. **Metadata Columns** (included in all tables):
   - load_timestamp: When data was loaded into Bronze
   - update_timestamp: When data was last updated
   - source_system: Originating system identifier

5. **Audit Table Features**:
   - AUTOINCREMENT record_id for unique identification
   - Comprehensive tracking of data processing activities
   - Error handling and data quality metrics
   - Batch processing support
*/

-- =====================================================
-- API COST
-- =====================================================

-- apiCost: 0.000000