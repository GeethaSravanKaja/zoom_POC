# Bronze Layer Data Mapping - Zoom Platform Analytics Systems

_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Updated on*: 
## *Description*: Comprehensive Bronze Layer Data Mapping for Medallion Architecture Implementation in Snowflake - Zoom Platform Analytics Systems
## *Version*: 1
_____________________________________________

## Executive Summary

This document provides a comprehensive data mapping specification for the Bronze layer implementation in a Medallion architecture for Zoom Platform Analytics Systems. The Bronze layer serves as the raw data ingestion layer, preserving the original structure and content of source data while establishing the foundation for downstream Silver and Gold layer transformations.

## Architecture Overview

**Medallion Architecture Layers:**
- **Bronze Layer (Raw)**: Ingests and stores raw data with minimal transformation
- **Silver Layer (Refined)**: Cleaned and validated data
- **Gold Layer (Curated)**: Business-ready aggregated data

**Target Platform**: Snowflake Data Cloud
**Source System**: Zoom Platform Analytics Systems
**Data Processing Pattern**: ELT (Extract, Load, Transform)

## Bronze Layer Data Mapping

### Table 1: Users Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_users | user_id | Source | users | user_id | 1-1 Mapping |
| Bronze | bz_users | email_address | Source | users | email_address | 1-1 Mapping |
| Bronze | bz_users | user_name | Source | users | user_name | 1-1 Mapping |
| Bronze | bz_users | first_name | Source | users | first_name | 1-1 Mapping |
| Bronze | bz_users | last_name | Source | users | last_name | 1-1 Mapping |
| Bronze | bz_users | phone_number | Source | users | phone_number | 1-1 Mapping |
| Bronze | bz_users | timezone | Source | users | timezone | 1-1 Mapping |
| Bronze | bz_users | account_type | Source | users | account_type | 1-1 Mapping |
| Bronze | bz_users | status | Source | users | status | 1-1 Mapping |
| Bronze | bz_users | created_at | Source | users | created_at | 1-1 Mapping |
| Bronze | bz_users | last_login_time | Source | users | last_login_time | 1-1 Mapping |
| Bronze | bz_users | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_users | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_users | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 2: Meetings Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_meetings | meeting_id | Source | meetings | meeting_id | 1-1 Mapping |
| Bronze | bz_meetings | meeting_uuid | Source | meetings | meeting_uuid | 1-1 Mapping |
| Bronze | bz_meetings | host_id | Source | meetings | host_id | 1-1 Mapping |
| Bronze | bz_meetings | meeting_topic | Source | meetings | meeting_topic | 1-1 Mapping |
| Bronze | bz_meetings | meeting_type | Source | meetings | meeting_type | 1-1 Mapping |
| Bronze | bz_meetings | start_time | Source | meetings | start_time | 1-1 Mapping |
| Bronze | bz_meetings | end_time | Source | meetings | end_time | 1-1 Mapping |
| Bronze | bz_meetings | duration | Source | meetings | duration | 1-1 Mapping |
| Bronze | bz_meetings | timezone | Source | meetings | timezone | 1-1 Mapping |
| Bronze | bz_meetings | password_protected | Source | meetings | password_protected | 1-1 Mapping |
| Bronze | bz_meetings | waiting_room_enabled | Source | meetings | waiting_room_enabled | 1-1 Mapping |
| Bronze | bz_meetings | recording_enabled | Source | meetings | recording_enabled | 1-1 Mapping |
| Bronze | bz_meetings | participant_count | Source | meetings | participant_count | 1-1 Mapping |
| Bronze | bz_meetings | max_participants | Source | meetings | max_participants | 1-1 Mapping |
| Bronze | bz_meetings | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_meetings | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_meetings | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 3: Participants Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_participants | participant_id | Source | participants | participant_id | 1-1 Mapping |
| Bronze | bz_participants | meeting_id | Source | participants | meeting_id | 1-1 Mapping |
| Bronze | bz_participants | user_id | Source | participants | user_id | 1-1 Mapping |
| Bronze | bz_participants | participant_name | Source | participants | participant_name | 1-1 Mapping |
| Bronze | bz_participants | email_address | Source | participants | email_address | 1-1 Mapping |
| Bronze | bz_participants | join_time | Source | participants | join_time | 1-1 Mapping |
| Bronze | bz_participants | leave_time | Source | participants | leave_time | 1-1 Mapping |
| Bronze | bz_participants | duration | Source | participants | duration | 1-1 Mapping |
| Bronze | bz_participants | ip_address | Source | participants | ip_address | 1-1 Mapping |
| Bronze | bz_participants | device_type | Source | participants | device_type | 1-1 Mapping |
| Bronze | bz_participants | device_id | Source | participants | device_id | 1-1 Mapping |
| Bronze | bz_participants | client_type | Source | participants | client_type | 1-1 Mapping |
| Bronze | bz_participants | microphone_used | Source | participants | microphone_used | 1-1 Mapping |
| Bronze | bz_participants | camera_used | Source | participants | camera_used | 1-1 Mapping |
| Bronze | bz_participants | screen_share_used | Source | participants | screen_share_used | 1-1 Mapping |
| Bronze | bz_participants | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_participants | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_participants | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 4: Recordings Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_recordings | recording_id | Source | recordings | recording_id | 1-1 Mapping |
| Bronze | bz_recordings | meeting_id | Source | recordings | meeting_id | 1-1 Mapping |
| Bronze | bz_recordings | recording_name | Source | recordings | recording_name | 1-1 Mapping |
| Bronze | bz_recordings | recording_type | Source | recordings | recording_type | 1-1 Mapping |
| Bronze | bz_recordings | file_type | Source | recordings | file_type | 1-1 Mapping |
| Bronze | bz_recordings | file_size | Source | recordings | file_size | 1-1 Mapping |
| Bronze | bz_recordings | recording_start | Source | recordings | recording_start | 1-1 Mapping |
| Bronze | bz_recordings | recording_end | Source | recordings | recording_end | 1-1 Mapping |
| Bronze | bz_recordings | duration | Source | recordings | duration | 1-1 Mapping |
| Bronze | bz_recordings | download_url | Source | recordings | download_url | 1-1 Mapping |
| Bronze | bz_recordings | password_protected | Source | recordings | password_protected | 1-1 Mapping |
| Bronze | bz_recordings | status | Source | recordings | status | 1-1 Mapping |
| Bronze | bz_recordings | created_at | Source | recordings | created_at | 1-1 Mapping |
| Bronze | bz_recordings | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_recordings | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_recordings | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 5: Chat Messages Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_chat_messages | message_id | Source | chat_messages | message_id | 1-1 Mapping |
| Bronze | bz_chat_messages | meeting_id | Source | chat_messages | meeting_id | 1-1 Mapping |
| Bronze | bz_chat_messages | sender_id | Source | chat_messages | sender_id | 1-1 Mapping |
| Bronze | bz_chat_messages | sender_name | Source | chat_messages | sender_name | 1-1 Mapping |
| Bronze | bz_chat_messages | recipient_id | Source | chat_messages | recipient_id | 1-1 Mapping |
| Bronze | bz_chat_messages | message_content | Source | chat_messages | message_content | 1-1 Mapping |
| Bronze | bz_chat_messages | message_timestamp | Source | chat_messages | message_timestamp | 1-1 Mapping |
| Bronze | bz_chat_messages | message_type | Source | chat_messages | message_type | 1-1 Mapping |
| Bronze | bz_chat_messages | file_name | Source | chat_messages | file_name | 1-1 Mapping |
| Bronze | bz_chat_messages | file_size | Source | chat_messages | file_size | 1-1 Mapping |
| Bronze | bz_chat_messages | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_chat_messages | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_chat_messages | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 6: Webinars Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_webinars | webinar_id | Source | webinars | webinar_id | 1-1 Mapping |
| Bronze | bz_webinars | webinar_uuid | Source | webinars | webinar_uuid | 1-1 Mapping |
| Bronze | bz_webinars | host_id | Source | webinars | host_id | 1-1 Mapping |
| Bronze | bz_webinars | webinar_topic | Source | webinars | webinar_topic | 1-1 Mapping |
| Bronze | bz_webinars | webinar_agenda | Source | webinars | webinar_agenda | 1-1 Mapping |
| Bronze | bz_webinars | start_time | Source | webinars | start_time | 1-1 Mapping |
| Bronze | bz_webinars | end_time | Source | webinars | end_time | 1-1 Mapping |
| Bronze | bz_webinars | duration | Source | webinars | duration | 1-1 Mapping |
| Bronze | bz_webinars | timezone | Source | webinars | timezone | 1-1 Mapping |
| Bronze | bz_webinars | registration_required | Source | webinars | registration_required | 1-1 Mapping |
| Bronze | bz_webinars | attendee_count | Source | webinars | attendee_count | 1-1 Mapping |
| Bronze | bz_webinars | registration_count | Source | webinars | registration_count | 1-1 Mapping |
| Bronze | bz_webinars | max_attendees | Source | webinars | max_attendees | 1-1 Mapping |
| Bronze | bz_webinars | practice_session | Source | webinars | practice_session | 1-1 Mapping |
| Bronze | bz_webinars | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_webinars | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_webinars | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 7: Reports Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_reports | report_id | Source | reports | report_id | 1-1 Mapping |
| Bronze | bz_reports | report_name | Source | reports | report_name | 1-1 Mapping |
| Bronze | bz_reports | report_type | Source | reports | report_type | 1-1 Mapping |
| Bronze | bz_reports | report_category | Source | reports | report_category | 1-1 Mapping |
| Bronze | bz_reports | generated_by | Source | reports | generated_by | 1-1 Mapping |
| Bronze | bz_reports | generation_timestamp | Source | reports | generation_timestamp | 1-1 Mapping |
| Bronze | bz_reports | report_period_start | Source | reports | report_period_start | 1-1 Mapping |
| Bronze | bz_reports | report_period_end | Source | reports | report_period_end | 1-1 Mapping |
| Bronze | bz_reports | file_format | Source | reports | file_format | 1-1 Mapping |
| Bronze | bz_reports | file_size | Source | reports | file_size | 1-1 Mapping |
| Bronze | bz_reports | download_count | Source | reports | download_count | 1-1 Mapping |
| Bronze | bz_reports | status | Source | reports | status | 1-1 Mapping |
| Bronze | bz_reports | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_reports | update_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_reports | source_system | System | N/A | 'Zoom_Platform' | System Generated |

### Table 8: Audit Log Data Mapping

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|-------------------|
| Bronze | bz_audit_log | record_id | System | N/A | SEQUENCE | System Generated |
| Bronze | bz_audit_log | source_table | System | N/A | TABLE_NAME | System Generated |
| Bronze | bz_audit_log | load_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |
| Bronze | bz_audit_log | processed_by | System | N/A | USER() | System Generated |
| Bronze | bz_audit_log | processing_time | System | N/A | EXECUTION_TIME | System Generated |
| Bronze | bz_audit_log | status | System | N/A | PROCESS_STATUS | System Generated |
| Bronze | bz_audit_log | records_processed | System | N/A | ROW_COUNT | System Generated |
| Bronze | bz_audit_log | records_failed | System | N/A | ERROR_COUNT | System Generated |
| Bronze | bz_audit_log | error_message | System | N/A | ERROR_DETAILS | System Generated |
| Bronze | bz_audit_log | batch_id | System | N/A | BATCH_IDENTIFIER | System Generated |
| Bronze | bz_audit_log | source_file_name | System | N/A | FILE_NAME | System Generated |
| Bronze | bz_audit_log | target_table | System | N/A | TARGET_TABLE_NAME | System Generated |
| Bronze | bz_audit_log | data_quality_score | System | N/A | DQ_SCORE | System Generated |
| Bronze | bz_audit_log | created_timestamp | System | N/A | CURRENT_TIMESTAMP | System Generated |

## API Cost Reporting

### apiCost: 0.000175

*Estimated cost in USD for generating this Bronze Layer Data Mapping based on computational resources and API usage for this specific task.*

---

*End of Bronze Layer Data Mapping Document*