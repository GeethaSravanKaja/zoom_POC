_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Physical Data Model for Zoom Platform Analytics Systems with Snowflake DDL scripts
## *Version*: 1
## *Updated on*: 
_____________________________________________

-- =============================================
-- BRONZE LAYER DDL SCRIPTS
-- Zoom Platform Analytics Systems
-- =============================================

-- 1. User Data Table
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 2. Account Data Table
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
    company_size NUMBER,
    payment_status STRING,
    feature_set STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 3. Meeting Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting (
    meeting_id STRING,
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 4. Participant Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_participant (
    participant_id STRING,
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
    meeting_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 5. Recording Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_recording (
    recording_id STRING,
    recording_name STRING,
    recording_type STRING,
    file_size NUMBER,
    duration NUMBER,
    storage_location STRING,
    access_permission STRING,
    download_count NUMBER,
    creation_date TIMESTAMP_NTZ,
    expiration_date DATE,
    encryption_status STRING,
    transcription_status STRING,
    meeting_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 6. Room Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_room (
    room_id STRING,
    room_name STRING,
    room_type STRING,
    capacity NUMBER,
    location STRING,
    equipment_list STRING,
    booking_status STRING,
    utilization_rate NUMBER,
    technical_specifications STRING,
    maintenance_schedule STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 7. Device Data Table
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
    user_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 8. Session Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_session (
    session_id STRING,
    session_start_time TIMESTAMP_NTZ,
    session_end_time TIMESTAMP_NTZ,
    session_duration NUMBER,
    session_type STRING,
    ip_address STRING,
    geographic_location STRING,
    device_information STRING,
    connection_quality STRING,
    activities_performed STRING,
    user_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 9. Report Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_report (
    report_id STRING,
    report_name STRING,
    report_type STRING,
    generation_date TIMESTAMP_NTZ,
    report_period STRING,
    report_format STRING,
    recipient_list STRING,
    data_sources STRING,
    refresh_frequency STRING,
    report_size NUMBER,
    delivery_method STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 10. Dashboard Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_dashboard (
    dashboard_id STRING,
    dashboard_name STRING,
    dashboard_type STRING,
    widget_count NUMBER,
    data_refresh_rate STRING,
    access_permissions STRING,
    customization_level STRING,
    export_options STRING,
    filter_capabilities STRING,
    alert_configuration STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 11. Metric Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_metric (
    metric_id STRING,
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 12. Event Data Table
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 13. Usage Summary Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_usage_summary (
    summary_id STRING,
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
    account_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 14. Quality Metric Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_quality_metric (
    quality_metric_id STRING,
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
    meeting_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 15. Integration Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_integration (
    integration_id STRING,
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
    account_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 16. API Call Data Table
CREATE TABLE IF NOT EXISTS Bronze.bz_api_call (
    api_call_id STRING,
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
    integration_id STRING,
    user_id STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 17. Audit Log Table
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_log (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING,
    source_system STRING,
    record_count NUMBER,
    error_message STRING,
    data_quality_score NUMBER
);

-- =============================================
-- API COST CALCULATION
-- =============================================
-- apiCost: 0.000000