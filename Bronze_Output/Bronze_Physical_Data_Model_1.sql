_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Physical Data Model for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

-- =====================================================
-- 1. Bronze Layer DDL Script
-- =====================================================

-- 1.1 Core Business Tables from Process Model
-- =====================================================

-- 1.1.1 Users Table
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

-- 1.1.2 Meetings Table  
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

-- 1.1.3 Participants Table
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

-- 1.1.4 Feature Usage Table
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

-- 1.1.5 Webinars Table
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

-- 1.1.6 Support Tickets Table
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

-- 1.1.7 Licenses Table
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

-- 1.1.8 Billing Events Table
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

-- 1.2 Extended Conceptual Model Tables
-- =====================================================

-- 1.2.1 User Account (Extended)
CREATE TABLE IF NOT EXISTS Bronze.bz_user_accounts (
    user_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.2 Organization
CREATE TABLE IF NOT EXISTS Bronze.bz_organizations (
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.3 Meeting Session (Extended)
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_sessions (
    meeting_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.4 Webinar Event (Extended)
CREATE TABLE IF NOT EXISTS Bronze.bz_webinar_events (
    webinar_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.5 Meeting Participant (Extended)
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_participants (
    participant_id STRING,
    meeting_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.6 Recording Asset
CREATE TABLE IF NOT EXISTS Bronze.bz_recording_assets (
    recording_id STRING,
    meeting_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.7 Device Connection
CREATE TABLE IF NOT EXISTS Bronze.bz_device_connections (
    connection_id STRING,
    meeting_id STRING,
    participant_id STRING,
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
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.8 Chat Communication
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_communications (
    message_id STRING,
    meeting_id STRING,
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    sender_name STRING,
    recipient_scope STRING,
    message_type STRING,
    file_attachment_present BOOLEAN,
    message_length NUMBER,
    reaction_count NUMBER,
    reply_thread_indicator BOOLEAN,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.9 Screen Share Session
CREATE TABLE IF NOT EXISTS Bronze.bz_screen_share_sessions (
    share_session_id STRING,
    meeting_id STRING,
    share_type STRING,
    share_duration NUMBER,
    presenter_name STRING,
    application_name STRING,
    annotation_usage BOOLEAN,
    remote_control_granted BOOLEAN,
    share_quality NUMBER,
    viewer_count NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2.10 Breakout Room
CREATE TABLE IF NOT EXISTS Bronze.bz_breakout_rooms (
    room_id STRING,
    meeting_id STRING,
    room_name STRING,
    room_capacity NUMBER,
    actual_participant_count NUMBER,
    room_duration NUMBER,
    host_assignment STRING,
    room_topic STRING,
    return_to_main_room_count NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3 Analytics and Metrics Tables
-- =====================================================

-- 1.3.1 Usage Analytics
CREATE TABLE IF NOT EXISTS Bronze.bz_usage_analytics (
    analytics_id STRING,
    measurement_period STRING,
    total_meeting_count NUMBER,
    total_meeting_minutes NUMBER,
    unique_user_count NUMBER,
    average_meeting_duration NUMBER,
    peak_concurrent_users NUMBER,
    platform_utilization_rate NUMBER,
    feature_adoption_rate NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3.2 Quality Metrics
CREATE TABLE IF NOT EXISTS Bronze.bz_quality_metrics (
    metrics_id STRING,
    meeting_id STRING,
    audio_quality_average NUMBER,
    video_quality_average NUMBER,
    connection_success_rate NUMBER,
    average_latency NUMBER,
    packet_loss_rate NUMBER,
    call_drop_rate NUMBER,
    user_satisfaction_score NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3.3 Engagement Metrics
CREATE TABLE IF NOT EXISTS Bronze.bz_engagement_metrics (
    engagement_id STRING,
    meeting_id STRING,
    average_participation_rate NUMBER,
    chat_message_volume NUMBER,
    screen_share_frequency NUMBER,
    reaction_usage_count NUMBER,
    qa_participation_rate NUMBER,
    poll_response_rate NUMBER,
    attention_score NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3.4 Resource Utilization
CREATE TABLE IF NOT EXISTS Bronze.bz_resource_utilization (
    utilization_id STRING,
    organization_id STRING,
    measurement_date DATE,
    storage_consumption NUMBER,
    bandwidth_usage NUMBER,
    server_processing_load NUMBER,
    concurrent_session_capacity NUMBER,
    peak_usage_time TIMESTAMP_NTZ,
    resource_efficiency_rating NUMBER,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3.5 Security Event
CREATE TABLE IF NOT EXISTS Bronze.bz_security_events (
    event_id STRING,
    event_type STRING,
    event_timestamp TIMESTAMP_NTZ,
    user_involved STRING,
    event_severity_level STRING,
    event_description STRING,
    resolution_status STRING,
    compliance_impact STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3.6 Billing Transaction (Extended)
CREATE TABLE IF NOT EXISTS Bronze.bz_billing_transactions (
    transaction_id STRING,
    user_id STRING,
    organization_id STRING,
    transaction_type STRING,
    transaction_amount NUMBER(10,2),
    transaction_date DATE,
    billing_period STRING,
    payment_method STRING,
    transaction_status STRING,
    invoice_number STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.4 Audit Table
-- =====================================================

-- 1.4.1 Audit Table for Data Lineage and Processing Tracking
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_table (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);