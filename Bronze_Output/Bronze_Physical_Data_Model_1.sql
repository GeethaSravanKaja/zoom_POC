_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Physical Data Model for Zoom Platform Analytics Systems following Snowflake SQL standards
## *Version*: 1 
## *Updated on*: 
_____________________________________________

-- =====================================================
-- BRONZE LAYER DDL SCRIPT
-- Zoom Platform Analytics Systems - Physical Data Model
-- =====================================================

-- 1. USERS TABLE
-- Stores raw user account information
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    user_id STRING,
    user_name STRING,
    email STRING,
    company STRING,
    plan_type STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 2. MEETINGS TABLE
-- Stores raw meeting session information
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_id STRING,
    host_id STRING,
    meeting_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    duration_minutes NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 3. PARTICIPANTS TABLE
-- Stores raw meeting participant information
CREATE TABLE IF NOT EXISTS Bronze.bz_participants (
    participant_id STRING,
    meeting_id STRING,
    user_id STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 4. FEATURE USAGE TABLE
-- Stores raw feature usage information
CREATE TABLE IF NOT EXISTS Bronze.bz_feature_usage (
    usage_id STRING,
    meeting_id STRING,
    feature_name STRING,
    usage_count NUMBER,
    usage_date DATE,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 5. WEBINARS TABLE
-- Stores raw webinar event information
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_id STRING,
    host_id STRING,
    webinar_topic STRING,
    start_time TIMESTAMP_NTZ,
    end_time TIMESTAMP_NTZ,
    registrants NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 6. SUPPORT TICKETS TABLE
-- Stores raw support ticket information
CREATE TABLE IF NOT EXISTS Bronze.bz_support_tickets (
    ticket_id STRING,
    user_id STRING,
    ticket_type STRING,
    resolution_status STRING,
    open_date DATE,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 7. LICENSES TABLE
-- Stores raw license information
CREATE TABLE IF NOT EXISTS Bronze.bz_licenses (
    license_id STRING,
    license_type STRING,
    assigned_to_user_id STRING,
    start_date DATE,
    end_date DATE,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 8. BILLING EVENTS TABLE
-- Stores raw billing event information
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_events (
    event_id STRING,
    user_id STRING,
    event_type STRING,
    amount NUMBER(10,2),
    event_date DATE,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 9. USER ACCOUNTS TABLE (from Conceptual Model)
-- Stores comprehensive user account information from conceptual model
CREATE TABLE IF NOT EXISTS Bronze.bz_user_accounts (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 10. ORGANIZATIONS TABLE (from Conceptual Model)
-- Stores raw organization information
CREATE TABLE IF NOT EXISTS Bronze.bz_organizations (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 11. MEETING SESSIONS TABLE (from Conceptual Model)
-- Stores comprehensive meeting session information
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_sessions (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 12. WEBINAR EVENTS TABLE (from Conceptual Model)
-- Stores comprehensive webinar event information
CREATE TABLE IF NOT EXISTS Bronze.bz_webinar_events (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 13. MEETING PARTICIPANTS TABLE (from Conceptual Model)
-- Stores comprehensive meeting participant information
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_participants (
    participant_name STRING,
    join_time TIMESTAMP_NTZ,
    leave_time TIMESTAMP_NTZ,
    total_attendance_duration NUMBER,
    participant_role STRING,
    audio_connection_type STRING,
    video_status STRING,
    geographic_location STRING,
    connection_quality_rating NUMBER,
    interaction_count NUMBER,
    screen_share_usage STRING,
    breakout_room_assignment STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 14. RECORDING ASSETS TABLE (from Conceptual Model)
-- Stores raw recording asset information
CREATE TABLE IF NOT EXISTS Bronze.bz_recording_assets (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 15. DEVICE CONNECTIONS TABLE (from Conceptual Model)
-- Stores raw device connection information
CREATE TABLE IF NOT EXISTS Bronze.bz_device_connections (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 16. CHAT COMMUNICATIONS TABLE (from Conceptual Model)
-- Stores raw chat communication information
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_communications (
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    sender_name STRING,
    recipient_scope STRING,
    message_type STRING,
    file_attachment_present BOOLEAN,
    message_length NUMBER,
    reaction_count NUMBER,
    reply_thread_indicator BOOLEAN,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 17. SCREEN SHARE SESSIONS TABLE (from Conceptual Model)
-- Stores raw screen share session information
CREATE TABLE IF NOT EXISTS Bronze.bz_screen_share_sessions (
    share_type STRING,
    share_duration NUMBER,
    presenter_name STRING,
    application_name STRING,
    annotation_usage BOOLEAN,
    remote_control_granted BOOLEAN,
    share_quality NUMBER,
    viewer_count NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 18. BREAKOUT ROOMS TABLE (from Conceptual Model)
-- Stores raw breakout room information
CREATE TABLE IF NOT EXISTS Bronze.bz_breakout_rooms (
    room_name STRING,
    room_capacity NUMBER,
    actual_participant_count NUMBER,
    room_duration NUMBER,
    host_assignment STRING,
    room_topic STRING,
    return_to_main_room_count NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 19. USAGE ANALYTICS TABLE (from Conceptual Model)
-- Stores raw usage analytics information
CREATE TABLE IF NOT EXISTS Bronze.bz_usage_analytics (
    measurement_period STRING,
    total_meeting_count NUMBER,
    total_meeting_minutes NUMBER,
    unique_user_count NUMBER,
    average_meeting_duration NUMBER,
    peak_concurrent_users NUMBER,
    platform_utilization_rate NUMBER,
    feature_adoption_rate NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 20. QUALITY METRICS TABLE (from Conceptual Model)
-- Stores raw quality metrics information
CREATE TABLE IF NOT EXISTS Bronze.bz_quality_metrics (
    audio_quality_average NUMBER,
    video_quality_average NUMBER,
    connection_success_rate NUMBER,
    average_latency NUMBER,
    packet_loss_rate NUMBER,
    call_drop_rate NUMBER,
    user_satisfaction_score NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 21. ENGAGEMENT METRICS TABLE (from Conceptual Model)
-- Stores raw engagement metrics information
CREATE TABLE IF NOT EXISTS Bronze.bz_engagement_metrics (
    average_participation_rate NUMBER,
    chat_message_volume NUMBER,
    screen_share_frequency NUMBER,
    reaction_usage_count NUMBER,
    qa_participation_rate NUMBER,
    poll_response_rate NUMBER,
    attention_score NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 22. RESOURCE UTILIZATION TABLE (from Conceptual Model)
-- Stores raw resource utilization information
CREATE TABLE IF NOT EXISTS Bronze.bz_resource_utilization (
    storage_consumption NUMBER,
    bandwidth_usage NUMBER,
    server_processing_load NUMBER,
    concurrent_session_capacity NUMBER,
    peak_usage_time STRING,
    resource_efficiency_rating NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 23. SECURITY EVENTS TABLE (from Conceptual Model)
-- Stores raw security event information
CREATE TABLE IF NOT EXISTS Bronze.bz_security_events (
    event_type STRING,
    event_timestamp TIMESTAMP_NTZ,
    user_involved STRING,
    event_severity_level STRING,
    event_description STRING,
    resolution_status STRING,
    compliance_impact STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 24. BILLING TRANSACTIONS TABLE (from Conceptual Model)
-- Stores raw billing transaction information
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_transactions (
    transaction_type STRING,
    transaction_amount NUMBER(10,2),
    transaction_date DATE,
    billing_period STRING,
    payment_method STRING,
    transaction_status STRING,
    invoice_number STRING,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 25. AUDIT TABLE
-- Stores audit information for data processing and lineage
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_table (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);

-- =====================================================
-- END OF BRONZE LAYER DDL SCRIPT
-- =====================================================

-- NOTES:
-- 1. All tables use Snowflake's default micro-partitioned storage
-- 2. No primary keys, foreign keys, or constraints are defined as per Bronze layer requirements
-- 3. All tables include standard metadata columns for data lineage tracking
-- 4. Data types are optimized for Snowflake SQL compatibility
-- 5. Tables are designed to store raw data as-is from source systems
-- 6. The audit table provides comprehensive tracking of data processing activities