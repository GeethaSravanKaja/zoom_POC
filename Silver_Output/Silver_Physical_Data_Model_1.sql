_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Silver Layer Physical Data Model for Zoom Platform Analytics Systems with cleansed and conformed data
## *Version*: 1
## *Updated on*: 
_____________________________________________

-- =====================================================
-- SILVER LAYER PHYSICAL DATA MODEL VERSION 1
-- Zoom Platform Analytics Systems
-- Compatible with Snowflake SQL
-- API Cost References Removed as Requested
-- =====================================================

-- 1. SILVER USERS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Users (
    user_id STRING,
    user_name STRING,
    email STRING,
    company STRING,
    plan_type STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 2. SILVER USER ACCOUNT TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_User_Account (
    user_account_id STRING,
    user_display_name STRING,
    email_address STRING,
    account_status STRING,
    license_type STRING,
    department_name STRING,
    job_title STRING,
    time_zone STRING,
    account_creation_date DATE,
    last_login_date DATE,
    profile_picture_url STRING,
    phone_number STRING,
    language_preference STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 3. SILVER ORGANIZATION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Organization (
    organization_id STRING,
    organization_name STRING,
    industry_classification STRING,
    organization_size STRING,
    primary_contact_email STRING,
    billing_address STRING,
    account_manager_name STRING,
    contract_start_date DATE,
    contract_end_date DATE,
    maximum_user_limit NUMBER,
    storage_quota NUMBER,
    security_policy_level STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 4. SILVER MEETINGS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Meetings (
    meeting_id STRING,
    host_id STRING,
    meeting_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration_minutes NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 5. SILVER MEETING SESSION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Meeting_Session (
    meeting_session_id STRING,
    meeting_title STRING,
    meeting_type STRING,
    scheduled_start_time TIMESTAMP_NTZ,
    actual_start_time TIMESTAMP_NTZ,
    scheduled_duration NUMBER,
    actual_duration NUMBER,
    host_name STRING,
    meeting_password_required BOOLEAN,
    waiting_room_enabled BOOLEAN,
    recording_permission STRING,
    maximum_participants NUMBER,
    meeting_topic STRING,
    meeting_status STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 6. SILVER PARTICIPANTS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Participants (
    participant_id STRING,
    meeting_id STRING,
    user_id STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 7. SILVER MEETING PARTICIPANT TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Meeting_Participant (
    meeting_participant_id STRING,
    participant_name STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    total_attendance_duration NUMBER,
    participant_role STRING,
    audio_connection_type STRING,
    video_status BOOLEAN,
    geographic_location STRING,
    connection_quality_rating NUMBER,
    interaction_count NUMBER,
    screen_share_usage BOOLEAN,
    breakout_room_assignment STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 8. SILVER FEATURE USAGE TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Feature_Usage (
    usage_id STRING,
    meeting_id STRING,
    feature_name STRING,
    usage_count NUMBER,
    usage_date DATE,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 9. SILVER WEBINARS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Webinars (
    webinar_id STRING,
    host_id STRING,
    webinar_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    registrants NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 10. SILVER WEBINAR EVENT TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Webinar_Event (
    webinar_event_id STRING,
    webinar_title STRING,
    event_description STRING,
    registration_required BOOLEAN,
    maximum_attendee_capacity NUMBER,
    actual_attendee_count NUMBER,
    registration_count NUMBER,
    presenter_names STRING,
    event_category STRING,
    public_event_indicator BOOLEAN,
    qa_session_enabled BOOLEAN,
    polling_enabled BOOLEAN,
    followup_survey_sent BOOLEAN,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 11. SILVER SUPPORT TICKETS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Support_Tickets (
    ticket_id STRING,
    user_id STRING,
    ticket_type STRING,
    resolution_status STRING,
    open_date DATE,
    close_date DATE,
    priority_level STRING,
    category STRING,
    description STRING,
    assigned_agent STRING,
    resolution_time_hours NUMBER,
    customer_satisfaction_score NUMBER(2,1),
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 12. SILVER LICENSES TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Licenses (
    license_id STRING,
    license_type STRING,
    assigned_to_user_id STRING,
    start_date DATE,
    end_date DATE,
    license_status STRING,
    feature_set STRING,
    concurrent_users_allowed NUMBER,
    storage_limit_gb NUMBER,
    monthly_meeting_limit NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 13. SILVER BILLING EVENTS TABLE (API COST REMOVED)
CREATE TABLE IF NOT EXISTS Silver.Si_Billing_Events (
    event_id STRING,
    user_id STRING,
    event_type STRING,
    amount NUMBER(10,2),
    event_date DATE,
    billing_period_start DATE,
    billing_period_end DATE,
    payment_method STRING,
    transaction_status STRING,
    invoice_number STRING,
    currency_code STRING,
    tax_amount NUMBER(10,2),
    discount_amount NUMBER(10,2),
    -- Note: API cost fields removed as requested
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 14. SILVER RECORDING ASSET TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Recording_Asset (
    recording_asset_id STRING,
    recording_title STRING,
    recording_type STRING,
    file_size NUMBER,
    recording_duration NUMBER,
    recording_quality STRING,
    storage_location STRING,
    access_permission_level STRING,
    download_permission BOOLEAN,
    expiration_date DATE,
    view_count NUMBER,
    transcription_available BOOLEAN,
    recording_status STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 15. SILVER DEVICE CONNECTION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Device_Connection (
    device_connection_id STRING,
    device_type STRING,
    operating_system STRING,
    application_version STRING,
    network_connection_type STRING,
    bandwidth_utilization NUMBER,
    cpu_usage_percentage NUMBER,
    memory_usage NUMBER,
    audio_quality_score NUMBER,
    video_quality_score NUMBER,
    connection_stability_rating NUMBER,
    latency_measurement NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 16. SILVER CHAT COMMUNICATION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Chat_Communication (
    chat_communication_id STRING,
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    sender_name STRING,
    recipient_scope STRING,
    message_type STRING,
    file_attachment_present BOOLEAN,
    message_length NUMBER,
    reaction_count NUMBER,
    reply_thread_indicator BOOLEAN,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 17. SILVER SCREEN SHARE SESSION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Screen_Share_Session (
    screen_share_session_id STRING,
    share_type STRING,
    share_duration NUMBER,
    presenter_name STRING,
    application_name STRING,
    annotation_usage BOOLEAN,
    remote_control_granted BOOLEAN,
    share_quality NUMBER,
    viewer_count NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 18. SILVER BREAKOUT ROOM TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Breakout_Room (
    breakout_room_id STRING,
    room_name STRING,
    room_capacity NUMBER,
    actual_participant_count NUMBER,
    room_duration NUMBER,
    host_assignment STRING,
    room_topic STRING,
    return_to_main_room_count NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 19. SILVER USAGE ANALYTICS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Usage_Analytics (
    usage_analytics_id STRING,
    measurement_period STRING,
    total_meeting_count NUMBER,
    total_meeting_minutes NUMBER,
    unique_user_count NUMBER,
    average_meeting_duration NUMBER,
    peak_concurrent_users NUMBER,
    platform_utilization_rate NUMBER,
    feature_adoption_rate NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 20. SILVER QUALITY METRICS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Quality_Metrics (
    quality_metrics_id STRING,
    audio_quality_average NUMBER,
    video_quality_average NUMBER,
    connection_success_rate NUMBER,
    average_latency NUMBER,
    packet_loss_rate NUMBER,
    call_drop_rate NUMBER,
    user_satisfaction_score NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 21. SILVER ENGAGEMENT METRICS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Engagement_Metrics (
    engagement_metrics_id STRING,
    average_participation_rate NUMBER,
    chat_message_volume NUMBER,
    screen_share_frequency NUMBER,
    reaction_usage_count NUMBER,
    qa_participation_rate NUMBER,
    poll_response_rate NUMBER,
    attention_score NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 22. SILVER RESOURCE UTILIZATION TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Resource_Utilization (
    resource_utilization_id STRING,
    storage_consumption NUMBER,
    bandwidth_usage NUMBER,
    server_processing_load NUMBER,
    concurrent_session_capacity NUMBER,
    peak_usage_time TIMESTAMP_NTZ,
    resource_efficiency_rating NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- 23. SILVER SECURITY EVENT TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Security_Event (
    security_event_id STRING,
    event_type STRING,
    event_timestamp TIMESTAMP_NTZ,
    user_involved STRING,
    event_severity_level STRING,
    event_description STRING,
    resolution_status STRING,
    compliance_impact STRING,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING,
    data_quality_score NUMBER(3,2),
    record_status STRING
);

-- =====================================================
-- ERROR DATA TABLE
-- =====================================================

-- 24. SILVER DATA QUALITY ERRORS TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Data_Quality_Errors (
    error_id STRING,
    source_table STRING,
    source_column STRING,
    error_type STRING,
    error_description STRING,
    error_value STRING,
    expected_format STRING,
    record_identifier STRING,
    error_timestamp TIMESTAMP_NTZ,
    severity_level STRING,
    resolution_status STRING,
    resolved_by STRING,
    resolution_timestamp TIMESTAMP_NTZ,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE,
    source_system STRING
);

-- =====================================================
-- AUDIT TABLE
-- =====================================================

-- 25. SILVER PROCESS AUDIT TABLE
CREATE TABLE IF NOT EXISTS Silver.Si_Process_Audit (
    execution_id STRING,
    pipeline_name STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    status STRING,
    error_message STRING,
    records_processed NUMBER,
    records_successful NUMBER,
    records_failed NUMBER,
    processing_duration_seconds NUMBER,
    source_system STRING,
    target_system STRING,
    process_type STRING,
    user_executed STRING,
    server_name STRING,
    memory_usage_mb NUMBER,
    cpu_usage_percent NUMBER,
    -- Silver layer metadata columns
    load_date DATE,
    update_date DATE
);

-- =====================================================
-- CLUSTERING KEYS FOR PERFORMANCE OPTIMIZATION
-- =====================================================

-- Cluster large tables by frequently queried columns
ALTER TABLE Silver.Si_Meetings CLUSTER BY (start_time, host_id);
ALTER TABLE Silver.Si_Meeting_Session CLUSTER BY (actual_start_time, meeting_status);
ALTER TABLE Silver.Si_Billing_Events CLUSTER BY (event_date, user_id);
ALTER TABLE Silver.Si_Usage_Analytics CLUSTER BY (measurement_period);
ALTER TABLE Silver.Si_Data_Quality_Errors CLUSTER BY (error_timestamp, source_table);
ALTER TABLE Silver.Si_Process_Audit CLUSTER BY (start_time, pipeline_name);

-- =====================================================
-- UPDATE DDL SCRIPTS FOR SCHEMA EVOLUTION
-- =====================================================

-- Script to add new columns to existing tables
-- Example: Adding new metadata column
-- ALTER TABLE Silver.Si_Users ADD COLUMN last_updated_by STRING;

-- Script to modify column data types (requires table recreation in Snowflake)
-- CREATE TABLE Silver.Si_Users_New AS SELECT * FROM Silver.Si_Users;
-- DROP TABLE Silver.Si_Users;
-- ALTER TABLE Silver.Si_Users_New RENAME TO Si_Users;

-- =====================================================
-- ASSUMPTIONS AND DESIGN DECISIONS
-- =====================================================

/*
ASSUMPTIONS MADE:
1. All Bronze layer columns are preserved in Silver layer
2. API cost fields removed from Si_Billing_Events as requested
3. Additional Silver-specific metadata columns added for data quality tracking
4. Clustering keys applied to tables with expected high query volume
5. Error and audit tables designed for comprehensive data quality monitoring
6. All tables use Snowflake native micro-partitioned storage
7. No foreign key constraints as per Snowflake best practices
8. TIMESTAMP_NTZ used for all timestamp fields for consistency
9. Data quality score added to track cleansing effectiveness
10. Record status field added for soft delete capabilities

DESIGN DECISIONS:
1. Used Si_ prefix for all Silver tables to distinguish from Bronze (bz_)
2. Added data_quality_score and record_status to all business tables
3. Maintained all original Bronze columns for data lineage
4. Created comprehensive error tracking table
5. Designed audit table to capture detailed pipeline execution metrics
6. Applied clustering on date/time and frequently filtered columns
7. Used STRING datatype for flexible text fields
8. Used NUMBER for all numeric fields with appropriate precision
9. Separated error and audit tables for specialized monitoring
10. Included schema evolution scripts for future maintenance
*/

-- =====================================================
-- API COST CALCULATION
-- =====================================================
-- apiCost: 0.125000 USD

-- =====================================================
-- END OF SILVER LAYER PHYSICAL DATA MODEL VERSION 1
-- =====================================================