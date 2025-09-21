_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Physical Data Model DDL Scripts for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer DDL Scripts

## 1. Bronze Layer Tables

### 1.1 Users Table
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

### 1.2 Meetings Table
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

### 1.3 Participants Table
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

### 1.4 Feature Usage Table
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

### 1.5 Webinars Table
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

### 1.6 Support Tickets Table
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

### 1.7 Licenses Table
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

### 1.8 Billing Events Table
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

## 2. Audit Table

### 2.1 Bronze Layer Audit Table
CREATE TABLE IF NOT EXISTS Bronze.bz_audit_log (
    record_id NUMBER AUTOINCREMENT,
    source_table STRING,
    load_timestamp TIMESTAMP_NTZ,
    processed_by STRING,
    processing_time NUMBER,
    status STRING
);