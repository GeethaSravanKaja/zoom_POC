_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Comprehensive Bronze Layer Physical Data Model for Zoom Platform Analytics Systems with Snowflake SQL compatibility
## *Version*: 1 
## *Updated on*: 
_____________________________________________

-- =====================================================
-- BRONZE LAYER PHYSICAL DATA MODEL
-- Zoom Platform Analytics Systems
-- Compatible with Snowflake SQL
-- =====================================================

-- 1. USER ACCOUNT TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_user_account (
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

-- 2. ORGANIZATION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_organization (
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

-- 3. MEETING SESSION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_session (
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

-- 4. WEBINAR EVENT TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_webinar_event (
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

-- 5. MEETING PARTICIPANT TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_participant (
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
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 6. RECORDING ASSET TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_recording_asset (
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

-- 7. DEVICE CONNECTION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_device_connection (
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

-- 8. CHAT COMMUNICATION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_communication (
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

-- 9. SCREEN SHARE SESSION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_screen_share_session (
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

-- 10. BREAKOUT ROOM TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_breakout_room (
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

-- 11. USAGE ANALYTICS TABLE
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

-- 12. QUALITY METRICS TABLE
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

-- 13. ENGAGEMENT METRICS TABLE
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

-- 14. RESOURCE UTILIZATION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_resource_utilization (
    storage_consumption NUMBER,
    bandwidth_usage NUMBER,
    server_processing_load NUMBER,
    concurrent_session_capacity NUMBER,
    peak_usage_time TIMESTAMP_NTZ,
    resource_efficiency_rating NUMBER,
    -- Metadata columns
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 15. SECURITY EVENT TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_security_event (
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

-- 16. BILLING TRANSACTION TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_transaction (
    transaction_type STRING,
    transaction_amount NUMBER,
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

-- 17. AUDIT TABLE
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_table (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);

-- =====================================================
-- END OF BRONZE LAYER PHYSICAL DATA MODEL
-- =====================================================