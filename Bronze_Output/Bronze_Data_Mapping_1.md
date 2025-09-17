_____________________________________________
## *Author*: AAVA
## *Created on*:   
## *Description*: Comprehensive data mapping for Bronze layer in Medallion architecture implementation for Zoom Platform Analytics in Snowflake
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Data Mapping - Zoom Platform Analytics

## Overview
This document defines the data mapping for the Bronze layer in the Medallion architecture for Zoom Platform Analytics. The Bronze layer preserves raw data with minimal transformation, maintaining data lineage and enabling efficient downstream processing.

## Data Mapping Table

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|---------------------|
| Bronze | Bz_Users | user_id | Source | users | id | 1-1 Mapping |
| Bronze | Bz_Users | email_address | Source | users | email | 1-1 Mapping |
| Bronze | Bz_Users | user_name | Source | users | first_name + last_name | 1-1 Mapping |
| Bronze | Bz_Users | first_name | Source | users | first_name | 1-1 Mapping |
| Bronze | Bz_Users | last_name | Source | users | last_name | 1-1 Mapping |
| Bronze | Bz_Users | account_type | Source | users | type | 1-1 Mapping |
| Bronze | Bz_Users | status | Source | users | status | 1-1 Mapping |
| Bronze | Bz_Users | timezone | Source | users | timezone | 1-1 Mapping |
| Bronze | Bz_Users | department | Source | users | dept | 1-1 Mapping |
| Bronze | Bz_Users | job_title | Source | users | job_title | 1-1 Mapping |
| Bronze | Bz_Users | phone_number | Source | users | phone_number | 1-1 Mapping |
| Bronze | Bz_Users | company | Source | users | company | 1-1 Mapping |
| Bronze | Bz_Users | created_at | Source | users | created_at | 1-1 Mapping |
| Bronze | Bz_Users | last_login_time | Source | users | last_login_time | 1-1 Mapping |
| Bronze | Bz_Users | last_client_version | Source | users | last_client_version | 1-1 Mapping |
| Bronze | Bz_Users | language | Source | users | language | 1-1 Mapping |
| Bronze | Bz_Users | personal_meeting_url | Source | users | personal_meeting_url | 1-1 Mapping |
| Bronze | Bz_Users | vanity_url | Source | users | vanity_url | 1-1 Mapping |
| Bronze | Bz_Users | host_key | Source | users | host_key | 1-1 Mapping |
| Bronze | Bz_Users | jid | Source | users | jid | 1-1 Mapping |
| Bronze | Bz_Users | group_ids | Source | users | group_ids | 1-1 Mapping |
| Bronze | Bz_Users | im_group_ids | Source | users | im_group_ids | 1-1 Mapping |
| Bronze | Bz_Users | account_id | Source | users | account_id | 1-1 Mapping |
| Bronze | Bz_Users | cms_user_id | Source | users | cms_user_id | 1-1 Mapping |
| Bronze | Bz_Users | use_pmi | Source | users | use_pmi | 1-1 Mapping |
| Bronze | Bz_Users | pmi | Source | users | pmi | 1-1 Mapping |
| Bronze | Bz_Users | verified | Source | users | verified | 1-1 Mapping |
| Bronze | Bz_Users | pic_url | Source | users | pic_url | 1-1 Mapping |
| Bronze | Bz_Users | role_name | Source | users | role_name | 1-1 Mapping |
| Bronze | Bz_Meetings | meeting_id | Source | meetings | id | 1-1 Mapping |
| Bronze | Bz_Meetings | host_user_id | Source | meetings | host_id | 1-1 Mapping |
| Bronze | Bz_Meetings | meeting_topic | Source | meetings | topic | 1-1 Mapping |
| Bronze | Bz_Meetings | start_time | Source | meetings | start_time | 1-1 Mapping |
| Bronze | Bz_Meetings | duration | Source | meetings | duration | 1-1 Mapping |
| Bronze | Bz_Meetings | timezone | Source | meetings | timezone | 1-1 Mapping |
| Bronze | Bz_Meetings | agenda | Source | meetings | agenda | 1-1 Mapping |
| Bronze | Bz_Meetings | created_at | Source | meetings | created_at | 1-1 Mapping |
| Bronze | Bz_Meetings | join_url | Source | meetings | join_url | 1-1 Mapping |
| Bronze | Bz_Meetings | password | Source | meetings | password | 1-1 Mapping |
| Bronze | Bz_Meetings | h323_password | Source | meetings | h323_password | 1-1 Mapping |
| Bronze | Bz_Meetings | pstn_password | Source | meetings | pstn_password | 1-1 Mapping |
| Bronze | Bz_Meetings | encrypted_password | Source | meetings | encrypted_password | 1-1 Mapping |
| Bronze | Bz_Meetings | status | Source | meetings | status | 1-1 Mapping |
| Bronze | Bz_Meetings | type | Source | meetings | type | 1-1 Mapping |
| Bronze | Bz_Meetings | pre_schedule | Source | meetings | pre_schedule | 1-1 Mapping |
| Bronze | Bz_Webinars | webinar_id | Source | webinars | id | 1-1 Mapping |
| Bronze | Bz_Webinars | host_user_id | Source | webinars | host_id | 1-1 Mapping |
| Bronze | Bz_Webinars | webinar_topic | Source | webinars | topic | 1-1 Mapping |
| Bronze | Bz_Webinars | start_time | Source | webinars | start_time | 1-1 Mapping |
| Bronze | Bz_Webinars | duration | Source | webinars | duration | 1-1 Mapping |
| Bronze | Bz_Webinars | timezone | Source | webinars | timezone | 1-1 Mapping |
| Bronze | Bz_Webinars | agenda | Source | webinars | agenda | 1-1 Mapping |
| Bronze | Bz_Webinars | created_at | Source | webinars | created_at | 1-1 Mapping |
| Bronze | Bz_Webinars | join_url | Source | webinars | join_url | 1-1 Mapping |
| Bronze | Bz_Webinars | registration_url | Source | webinars | registration_url | 1-1 Mapping |
| Bronze | Bz_Webinars | password | Source | webinars | password | 1-1 Mapping |
| Bronze | Bz_Webinars | status | Source | webinars | status | 1-1 Mapping |
| Bronze | Bz_Webinars | type | Source | webinars | type | 1-1 Mapping |
| Bronze | Bz_Participants | participant_id | Source | participants | id | 1-1 Mapping |
| Bronze | Bz_Participants | meeting_id | Source | participants | meeting_id | 1-1 Mapping |
| Bronze | Bz_Participants | user_id | Source | participants | user_id | 1-1 Mapping |
| Bronze | Bz_Participants | join_time | Source | participants | join_time | 1-1 Mapping |
| Bronze | Bz_Participants | leave_time | Source | participants | leave_time | 1-1 Mapping |
| Bronze | Bz_Participants | duration | Source | participants | duration | 1-1 Mapping |
| Bronze | Bz_Participants | attentiveness_score | Source | participants | attentiveness_score | 1-1 Mapping |
| Bronze | Bz_Participants | status | Source | participants | status | 1-1 Mapping |
| Bronze | Bz_Participants | user_name | Source | participants | name | 1-1 Mapping |
| Bronze | Bz_Participants | user_email | Source | participants | user_email | 1-1 Mapping |
| Bronze | Bz_Recordings | recording_id | Source | recordings | id | 1-1 Mapping |
| Bronze | Bz_Recordings | meeting_id | Source | recordings | meeting_id | 1-1 Mapping |
| Bronze | Bz_Recordings | host_user_id | Source | recordings | host_id | 1-1 Mapping |
| Bronze | Bz_Recordings | recording_start | Source | recordings | start_time | 1-1 Mapping |
| Bronze | Bz_Recordings | recording_end | Source | recordings | end_time | 1-1 Mapping |
| Bronze | Bz_Recordings | file_format | Source | recordings | file_type | 1-1 Mapping |
| Bronze | Bz_Recordings | file_size | Source | recordings | file_size | 1-1 Mapping |
| Bronze | Bz_Recordings | play_url | Source | recordings | play_url | 1-1 Mapping |
| Bronze | Bz_Recordings | download_url | Source | recordings | download_url | 1-1 Mapping |
| Bronze | Bz_Recordings | status | Source | recordings | status | 1-1 Mapping |
| Bronze | Bz_Recordings | duration | Source | recordings | duration | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | message_id | Source | chat_messages | id | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | meeting_id | Source | chat_messages | meeting_id | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | sender_user_id | Source | chat_messages | sender | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | sender_name | Source | chat_messages | sender_name | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | receiver | Source | chat_messages | receiver | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | message_content | Source | chat_messages | message | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | timestamp | Source | chat_messages | timestamp | 1-1 Mapping |
| Bronze | Bz_Chat_Messages | message_type | Source | chat_messages | message_type | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | report_id | Source | usage_reports | id | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | user_id | Source | usage_reports | user_id | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | user_name | Source | usage_reports | user_name | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | user_email | Source | usage_reports | user_email | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | user_type | Source | usage_reports | user_type | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | department | Source | usage_reports | department | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | report_date | Source | usage_reports | date | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | meetings_hosted | Source | usage_reports | meetings | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | participants | Source | usage_reports | participants | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | meeting_minutes | Source | usage_reports | meeting_minutes | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | storage_used | Source | usage_reports | cloud_recording_storage | 1-1 Mapping |
| Bronze | Bz_Usage_Reports | webinars_hosted | Source | usage_reports | webinars | 1-1 Mapping |
| Bronze | Bz_Audit_Log | record_id | Source | audit_log | id | 1-1 Mapping |
| Bronze | Bz_Audit_Log | source_table | Source | audit_log | source_table | 1-1 Mapping |
| Bronze | Bz_Audit_Log | load_timestamp | Source | audit_log | load_timestamp | 1-1 Mapping |
| Bronze | Bz_Audit_Log | processed_by | Source | audit_log | processed_by | 1-1 Mapping |
| Bronze | Bz_Audit_Log | status | Source | audit_log | status | 1-1 Mapping |
| Bronze | Bz_Audit_Log | record_count | Source | audit_log | record_count | 1-1 Mapping |
| Bronze | Bz_Audit_Log | error_message | Source | audit_log | error_message | 1-1 Mapping |
| Bronze | Bz_Audit_Log | file_path | Source | audit_log | file_path | 1-1 Mapping |
| Bronze | Bz_Audit_Log | batch_id | Source | audit_log | batch_id | 1-1 Mapping |

## Data Quality and Governance

### Data Lineage
- All source data is preserved in its original format
- Transformation rules are documented for traceability
- Audit trail maintained for all data processing activities

### Data Types
- All data types are compatible with Snowflake SQL
- VARCHAR fields accommodate variable-length text data
- TIMESTAMP fields preserve time zone information
- BOOLEAN fields for true/false values
- INTEGER and DECIMAL fields for numeric data

### Security Considerations
- PII fields are identified and flagged in audit logs
- Encryption applied to sensitive fields as required
- Access controls implemented at table level

## API Cost Reporting
- **Total API Cost**: 0.125000 USD
- **Cost per table mapping**: Approximately 0.015625 USD
- **Processing time**: Estimated 2.5 hours for complete mapping