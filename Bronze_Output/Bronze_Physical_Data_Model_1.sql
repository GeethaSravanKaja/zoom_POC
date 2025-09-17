_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Physical Data Model for Zoom Platform Analytics Systems using Snowflake SQL DDL scripts
## *Version*: 1 
## *Updated on*: 
_____________________________________________

-- =====================================================
-- BRONZE LAYER PHYSICAL DATA MODEL
-- Zoom Platform Analytics Systems
-- Snowflake SQL DDL Scripts
-- =====================================================

-- 1. Bronze Layer DDL Script
-- =====================================================

-- 1.1 Users Table
CREATE TABLE IF NOT EXISTS Bronze.bz_users (
    user_id STRING,
    user_email STRING,
    user_name STRING,
    user_type STRING,
    department STRING,
    status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.2 Meetings Table
CREATE TABLE IF NOT EXISTS Bronze.bz_meetings (
    meeting_id STRING,
    host_id STRING,
    meeting_topic STRING,
    start_time TIMESTAMP_NTZ,
    duration NUMBER,
    status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.3 Meeting Participants Table
CREATE TABLE IF NOT EXISTS Bronze.bz_meeting_participants (
    participant_id STRING,
    meeting_id STRING,
    user_id STRING,
    join_time TIMESTAMP_NTZ,
    duration NUMBER,
    role STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.4 Webinars Table
CREATE TABLE IF NOT EXISTS Bronze.bz_webinars (
    webinar_id STRING,
    host_id STRING,
    webinar_topic STRING,
    start_time TIMESTAMP_NTZ,
    duration NUMBER,
    status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.5 Recordings Table
CREATE TABLE IF NOT EXISTS Bronze.bz_recordings (
    recording_id STRING,
    meeting_id STRING,
    file_type STRING,
    file_size NUMBER,
    play_url STRING,
    status STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.6 Chat Messages Table
CREATE TABLE IF NOT EXISTS Bronze.bz_chat_messages (
    message_id STRING,
    meeting_id STRING,
    sender_id STRING,
    message_content STRING,
    message_timestamp TIMESTAMP_NTZ,
    message_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.7 Phone Usage Table
CREATE TABLE IF NOT EXISTS Bronze.bz_phone_usage (
    call_id STRING,
    user_id STRING,
    caller_number STRING,
    call_start_time TIMESTAMP_NTZ,
    duration NUMBER,
    call_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.8 Dashboard Usage Table
CREATE TABLE IF NOT EXISTS Bronze.bz_dashboard_usage (
    session_id STRING,
    user_id STRING,
    dashboard_name STRING,
    access_timestamp TIMESTAMP_NTZ,
    session_duration NUMBER,
    device_type STRING,
    load_timestamp TIMESTAMP_NTZ,
    update_timestamp TIMESTAMP_NTZ,
    source_system STRING
);

-- 1.9 Audit Table
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_table (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);

-- =====================================================
-- 2. BRONZE LAYER TABLE DESCRIPTIONS
-- =====================================================

-- 2.1 Bronze.bz_users
--     Purpose: Stores raw user information from Zoom platform
--     Contains: User identifiers, contact information, organizational data
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.2 Bronze.bz_meetings
--     Purpose: Stores raw meeting data from Zoom platform
--     Contains: Meeting identifiers, scheduling information, status
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.3 Bronze.bz_meeting_participants
--     Purpose: Stores raw meeting participation data
--     Contains: Participant details, attendance information, roles
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.4 Bronze.bz_webinars
--     Purpose: Stores raw webinar information from Zoom platform
--     Contains: Webinar identifiers, scheduling information, status
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.5 Bronze.bz_recordings
--     Purpose: Stores raw recording metadata from Zoom platform
--     Contains: Recording identifiers, file information, access URLs
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.6 Bronze.bz_chat_messages
--     Purpose: Stores raw chat message data from meetings
--     Contains: Message content, sender information, timestamps
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.7 Bronze.bz_phone_usage
--     Purpose: Stores raw phone usage data from Zoom phone service
--     Contains: Call details, duration, participant information
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.8 Bronze.bz_dashboard_usage
--     Purpose: Stores raw dashboard usage analytics data
--     Contains: Session information, access patterns, device details
--     Metadata: Standard Bronze layer metadata columns for tracking

-- 2.9 Bronze.bz_audit_table
--     Purpose: Tracks data processing activities and status
--     Contains: Processing metadata, status tracking, performance metrics
--     Features: Auto-incrementing record ID for unique tracking

-- =====================================================
-- 3. BRONZE LAYER DESIGN PRINCIPLES
-- =====================================================

-- 3.1 Data Storage Approach
--     • Raw data stored as-is without transformation
--     • All source columns preserved with original data types
--     • No business logic applied at Bronze layer
--     • Snowflake micro-partitioned storage utilized

-- 3.2 Metadata Strategy
--     • load_timestamp: When data was first loaded
--     • update_timestamp: When data was last updated
--     • source_system: Identifies the source system
--     • Enables data lineage and audit capabilities

-- 3.3 Naming Conventions
--     • Table prefix: 'bz_' for Bronze layer identification
--     • Schema: 'Bronze' for layer organization
--     • Column names: Descriptive and consistent
--     • No constraints: Optimized for Snowflake architecture

-- 3.4 Snowflake Optimization
--     • No primary keys, foreign keys, or constraints
--     • Appropriate Snowflake data types used
--     • CREATE TABLE IF NOT EXISTS for idempotent operations
--     • Compatible with Snowflake SQL standards

-- =====================================================
-- 4. DATA TYPE MAPPING
-- =====================================================

-- 4.1 Snowflake Data Types Used
--     • STRING: Variable length text data (up to 16MB)
--     • NUMBER: Numeric data with precision and scale
--     • TIMESTAMP_NTZ: Timestamp without timezone
--     • BOOLEAN: True/false values (if needed)
--     • DATE: Date-only values (if needed)

-- 4.2 Metadata Column Standards
--     • load_timestamp: TIMESTAMP_NTZ for consistency
--     • update_timestamp: TIMESTAMP_NTZ for consistency
--     • source_system: STRING for flexibility
--     • record_id: NUMBER AUTOINCREMENT for audit table

-- =====================================================
-- 5. IMPLEMENTATION NOTES
-- =====================================================

-- 5.1 Deployment Instructions
--     1. Execute DDL scripts in sequence
--     2. Verify table creation in Bronze schema
--     3. Configure data ingestion processes
--     4. Implement monitoring and alerting

-- 5.2 Performance Considerations
--     • Tables will auto-cluster based on usage patterns
--     • Consider manual clustering for large tables
--     • Monitor query performance and adjust as needed
--     • Utilize Snowflake's automatic optimization features

-- 5.3 Maintenance Requirements
--     • Regular monitoring of data loads
--     • Audit table cleanup procedures
--     • Performance monitoring and optimization
--     • Data retention policy implementation

-- =====================================================
-- 6. API COST
-- =====================================================

-- apiCost: 0.000125