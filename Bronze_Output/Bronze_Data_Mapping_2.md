_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Data Mapping for Zoom Platform Analytics Systems - Medallion Architecture Implementation
## *Version*: 2 
## *Updated on*: 
_____________________________________________

# Bronze Layer Data Mapping - Zoom Platform Analytics Systems

## Overview

This document provides a comprehensive data mapping between the Zoom Platform Analytics source systems and the Bronze layer in our Medallion architecture implementation on Snowflake. The Bronze layer serves as the raw data ingestion layer, preserving the original structure and format of source data while adding essential metadata for data lineage and governance.

## Mapping Principles

- **Transformation Rule:** 1-1 Mapping (Raw data preservation)
- **Data Format:** Original source format maintained
- **Metadata Enhancement:** Standard metadata columns added
- **Validation:** Basic data type and format validation only

## Data Mapping Table

| Target Layer | Target Table | Target Field | Source Layer | Source Table | Source Field | Transformation Rule |
|--------------|--------------|--------------|--------------|--------------|--------------|---------------------|
| Bronze | bz_user | user_name | Source | User | User Name | 1-1 Mapping |
| Bronze | bz_user | email_address | Source | User | Email Address | 1-1 Mapping |
| Bronze | bz_user | user_type | Source | User | User Type | 1-1 Mapping |
| Bronze | bz_user | department | Source | User | Department | 1-1 Mapping |
| Bronze | bz_user | location | Source | User | Location | 1-1 Mapping |
| Bronze | bz_user | license_type | Source | User | License Type | 1-1 Mapping |
| Bronze | bz_user | status | Source | User | Status | 1-1 Mapping |
| Bronze | bz_user | registration_date | Source | User | Registration Date | 1-1 Mapping |
| Bronze | bz_user | last_login_date | Source | User | Last Login Date | 1-1 Mapping |
| Bronze | bz_user | time_zone | Source | User | Time Zone | 1-1 Mapping |
| Bronze | bz_user | language_preference | Source | User | Language Preference | 1-1 Mapping |
| Bronze | bz_user | role | Source | User | Role | 1-1 Mapping |
| Bronze | bz_user | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_user | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_user | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_account | account_name | Source | Account | Account Name | 1-1 Mapping |
| Bronze | bz_account | account_type | Source | Account | Account Type | 1-1 Mapping |
| Bronze | bz_account | subscription_plan | Source | Account | Subscription Plan | 1-1 Mapping |
| Bronze | bz_account | billing_address | Source | Account | Billing Address | 1-1 Mapping |
| Bronze | bz_account | contract_start_date | Source | Account | Contract Start Date | 1-1 Mapping |
| Bronze | bz_account | contract_end_date | Source | Account | Contract End Date | 1-1 Mapping |
| Bronze | bz_account | account_manager | Source | Account | Account Manager | 1-1 Mapping |
| Bronze | bz_account | industry | Source | Account | Industry | 1-1 Mapping |
| Bronze | bz_account | company_size | Source | Account | Company Size | 1-1 Mapping |
| Bronze | bz_account | payment_status | Source | Account | Payment Status | 1-1 Mapping |
| Bronze | bz_account | feature_set | Source | Account | Feature Set | 1-1 Mapping |
| Bronze | bz_account | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_account | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_account | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_meeting | meeting_topic | Source | Meeting | Meeting Topic | 1-1 Mapping |
| Bronze | bz_meeting | meeting_type | Source | Meeting | Meeting Type | 1-1 Mapping |
| Bronze | bz_meeting | start_time | Source | Meeting | Start Time | 1-1 Mapping |
| Bronze | bz_meeting | end_time | Source | Meeting | End Time | 1-1 Mapping |
| Bronze | bz_meeting | duration | Source | Meeting | Duration | 1-1 Mapping |
| Bronze | bz_meeting | host_name | Source | Meeting | Host Name | 1-1 Mapping |
| Bronze | bz_meeting | meeting_password | Source | Meeting | Meeting Password | 1-1 Mapping |
| Bronze | bz_meeting | waiting_room | Source | Meeting | Waiting Room | 1-1 Mapping |
| Bronze | bz_meeting | recording_permission | Source | Meeting | Recording Permission | 1-1 Mapping |
| Bronze | bz_meeting | maximum_participants | Source | Meeting | Maximum Participants | 1-1 Mapping |
| Bronze | bz_meeting | actual_participants | Source | Meeting | Actual Participants | 1-1 Mapping |
| Bronze | bz_meeting | meeting_status | Source | Meeting | Meeting Status | 1-1 Mapping |
| Bronze | bz_meeting | time_zone | Source | Meeting | Time Zone | 1-1 Mapping |
| Bronze | bz_meeting | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_meeting | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_meeting | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_participant | participant_name | Source | Participant | Participant Name | 1-1 Mapping |
| Bronze | bz_participant | email_address | Source | Participant | Email Address | 1-1 Mapping |
| Bronze | bz_participant | join_time | Source | Participant | Join Time | 1-1 Mapping |
| Bronze | bz_participant | leave_time | Source | Participant | Leave Time | 1-1 Mapping |
| Bronze | bz_participant | duration | Source | Participant | Duration | 1-1 Mapping |
| Bronze | bz_participant | participant_type | Source | Participant | Participant Type | 1-1 Mapping |
| Bronze | bz_participant | connection_type | Source | Participant | Connection Type | 1-1 Mapping |
| Bronze | bz_participant | location | Source | Participant | Location | 1-1 Mapping |
| Bronze | bz_participant | audio_status | Source | Participant | Audio Status | 1-1 Mapping |
| Bronze | bz_participant | video_status | Source | Participant | Video Status | 1-1 Mapping |
| Bronze | bz_participant | screen_share | Source | Participant | Screen Share | 1-1 Mapping |
| Bronze | bz_participant | chat_activity | Source | Participant | Chat Activity | 1-1 Mapping |
| Bronze | bz_participant | attention_score | Source | Participant | Attention Score | 1-1 Mapping |
| Bronze | bz_participant | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_participant | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_participant | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_recording | recording_name | Source | Recording | Recording Name | 1-1 Mapping |
| Bronze | bz_recording | recording_type | Source | Recording | Recording Type | 1-1 Mapping |
| Bronze | bz_recording | file_size | Source | Recording | File Size | 1-1 Mapping |
| Bronze | bz_recording | duration | Source | Recording | Duration | 1-1 Mapping |
| Bronze | bz_recording | storage_location | Source | Recording | Storage Location | 1-1 Mapping |
| Bronze | bz_recording | access_permission | Source | Recording | Access Permission | 1-1 Mapping |
| Bronze | bz_recording | download_count | Source | Recording | Download Count | 1-1 Mapping |
| Bronze | bz_recording | creation_date | Source | Recording | Creation Date | 1-1 Mapping |
| Bronze | bz_recording | expiration_date | Source | Recording | Expiration Date | 1-1 Mapping |
| Bronze | bz_recording | encryption_status | Source | Recording | Encryption Status | 1-1 Mapping |
| Bronze | bz_recording | transcription_status | Source | Recording | Transcription Status | 1-1 Mapping |
| Bronze | bz_recording | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_recording | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_recording | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_room | room_name | Source | Room | Room Name | 1-1 Mapping |
| Bronze | bz_room | room_type | Source | Room | Room Type | 1-1 Mapping |
| Bronze | bz_room | capacity | Source | Room | Capacity | 1-1 Mapping |
| Bronze | bz_room | location | Source | Room | Location | 1-1 Mapping |
| Bronze | bz_room | equipment_list | Source | Room | Equipment List | 1-1 Mapping |
| Bronze | bz_room | booking_status | Source | Room | Booking Status | 1-1 Mapping |
| Bronze | bz_room | utilization_rate | Source | Room | Utilization Rate | 1-1 Mapping |
| Bronze | bz_room | technical_specifications | Source | Room | Technical Specifications | 1-1 Mapping |
| Bronze | bz_room | maintenance_schedule | Source | Room | Maintenance Schedule | 1-1 Mapping |
| Bronze | bz_room | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_room | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_room | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_device | device_name | Source | Device | Device Name | 1-1 Mapping |
| Bronze | bz_device | device_type | Source | Device | Device Type | 1-1 Mapping |
| Bronze | bz_device | operating_system | Source | Device | Operating System | 1-1 Mapping |
| Bronze | bz_device | zoom_client_version | Source | Device | Zoom Client Version | 1-1 Mapping |
| Bronze | bz_device | network_connection | Source | Device | Network Connection | 1-1 Mapping |
| Bronze | bz_device | audio_device | Source | Device | Audio Device | 1-1 Mapping |
| Bronze | bz_device | video_device | Source | Device | Video Device | 1-1 Mapping |
| Bronze | bz_device | performance_metrics | Source | Device | Performance Metrics | 1-1 Mapping |
| Bronze | bz_device | last_update | Source | Device | Last Update | 1-1 Mapping |
| Bronze | bz_device | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_device | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_device | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_session | session_start_time | Source | Session | Session Start Time | 1-1 Mapping |
| Bronze | bz_session | session_end_time | Source | Session | Session End Time | 1-1 Mapping |
| Bronze | bz_session | session_duration | Source | Session | Session Duration | 1-1 Mapping |
| Bronze | bz_session | session_type | Source | Session | Session Type | 1-1 Mapping |
| Bronze | bz_session | ip_address | Source | Session | IP Address | 1-1 Mapping |
| Bronze | bz_session | geographic_location | Source | Session | Geographic Location | 1-1 Mapping |
| Bronze | bz_session | device_information | Source | Session | Device Information | 1-1 Mapping |
| Bronze | bz_session | connection_quality | Source | Session | Connection Quality | 1-1 Mapping |
| Bronze | bz_session | activities_performed | Source | Session | Activities Performed | 1-1 Mapping |
| Bronze | bz_session | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_session | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_session | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_report | report_name | Source | Report | Report Name | 1-1 Mapping |
| Bronze | bz_report | report_type | Source | Report | Report Type | 1-1 Mapping |
| Bronze | bz_report | generation_date | Source | Report | Generation Date | 1-1 Mapping |
| Bronze | bz_report | report_period | Source | Report | Report Period | 1-1 Mapping |
| Bronze | bz_report | report_format | Source | Report | Report Format | 1-1 Mapping |
| Bronze | bz_report | recipient_list | Source | Report | Recipient List | 1-1 Mapping |
| Bronze | bz_report | data_sources | Source | Report | Data Sources | 1-1 Mapping |
| Bronze | bz_report | refresh_frequency | Source | Report | Refresh Frequency | 1-1 Mapping |
| Bronze | bz_report | report_size | Source | Report | Report Size | 1-1 Mapping |
| Bronze | bz_report | delivery_method | Source | Report | Delivery Method | 1-1 Mapping |
| Bronze | bz_report | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_report | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_report | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_dashboard | dashboard_name | Source | Dashboard | Dashboard Name | 1-1 Mapping |
| Bronze | bz_dashboard | dashboard_type | Source | Dashboard | Dashboard Type | 1-1 Mapping |
| Bronze | bz_dashboard | widget_count | Source | Dashboard | Widget Count | 1-1 Mapping |
| Bronze | bz_dashboard | data_refresh_rate | Source | Dashboard | Data Refresh Rate | 1-1 Mapping |
| Bronze | bz_dashboard | access_permissions | Source | Dashboard | Access Permissions | 1-1 Mapping |
| Bronze | bz_dashboard | customization_level | Source | Dashboard | Customization Level | 1-1 Mapping |
| Bronze | bz_dashboard | export_options | Source | Dashboard | Export Options | 1-1 Mapping |
| Bronze | bz_dashboard | filter_capabilities | Source | Dashboard | Filter Capabilities | 1-1 Mapping |
| Bronze | bz_dashboard | alert_configuration | Source | Dashboard | Alert Configuration | 1-1 Mapping |
| Bronze | bz_dashboard | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_dashboard | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_dashboard | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_metric | metric_name | Source | Metric | Metric Name | 1-1 Mapping |
| Bronze | bz_metric | metric_type | Source | Metric | Metric Type | 1-1 Mapping |
| Bronze | bz_metric | measurement_unit | Source | Metric | Measurement Unit | 1-1 Mapping |
| Bronze | bz_metric | calculation_method | Source | Metric | Calculation Method | 1-1 Mapping |
| Bronze | bz_metric | data_source | Source | Metric | Data Source | 1-1 Mapping |
| Bronze | bz_metric | update_frequency | Source | Metric | Update Frequency | 1-1 Mapping |
| Bronze | bz_metric | target_value | Source | Metric | Target Value | 1-1 Mapping |
| Bronze | bz_metric | current_value | Source | Metric | Current Value | 1-1 Mapping |
| Bronze | bz_metric | trend_direction | Source | Metric | Trend Direction | 1-1 Mapping |
| Bronze | bz_metric | alert_threshold | Source | Metric | Alert Threshold | 1-1 Mapping |
| Bronze | bz_metric | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_metric | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_metric | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_event | event_name | Source | Event | Event Name | 1-1 Mapping |
| Bronze | bz_event | event_type | Source | Event | Event Type | 1-1 Mapping |
| Bronze | bz_event | event_timestamp | Source | Event | Event Timestamp | 1-1 Mapping |
| Bronze | bz_event | event_source | Source | Event | Event Source | 1-1 Mapping |
| Bronze | bz_event | event_severity | Source | Event | Event Severity | 1-1 Mapping |
| Bronze | bz_event | event_description | Source | Event | Event Description | 1-1 Mapping |
| Bronze | bz_event | user_context | Source | Event | User Context | 1-1 Mapping |
| Bronze | bz_event | system_context | Source | Event | System Context | 1-1 Mapping |
| Bronze | bz_event | event_outcome | Source | Event | Event Outcome | 1-1 Mapping |
| Bronze | bz_event | correlation_information | Source | Event | Correlation Information | 1-1 Mapping |
| Bronze | bz_event | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_event | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_event | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_usage_summary | summary_period | Source | Usage_Summary | Summary Period | 1-1 Mapping |
| Bronze | bz_usage_summary | summary_type | Source | Usage_Summary | Summary Type | 1-1 Mapping |
| Bronze | bz_usage_summary | total_meetings | Source | Usage_Summary | Total Meetings | 1-1 Mapping |
| Bronze | bz_usage_summary | total_participants | Source | Usage_Summary | Total Participants | 1-1 Mapping |
| Bronze | bz_usage_summary | total_duration | Source | Usage_Summary | Total Duration | 1-1 Mapping |
| Bronze | bz_usage_summary | peak_concurrent_users | Source | Usage_Summary | Peak Concurrent Users | 1-1 Mapping |
| Bronze | bz_usage_summary | storage_consumed | Source | Usage_Summary | Storage Consumed | 1-1 Mapping |
| Bronze | bz_usage_summary | bandwidth_usage | Source | Usage_Summary | Bandwidth Usage | 1-1 Mapping |
| Bronze | bz_usage_summary | feature_utilization | Source | Usage_Summary | Feature Utilization | 1-1 Mapping |
| Bronze | bz_usage_summary | growth_metrics | Source | Usage_Summary | Growth Metrics | 1-1 Mapping |
| Bronze | bz_usage_summary | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_usage_summary | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_usage_summary | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_quality_metric | metric_name | Source | Quality_Metric | Metric Name | 1-1 Mapping |
| Bronze | bz_quality_metric | measurement_type | Source | Quality_Metric | Measurement Type | 1-1 Mapping |
| Bronze | bz_quality_metric | quality_score | Source | Quality_Metric | Quality Score | 1-1 Mapping |
| Bronze | bz_quality_metric | measurement_timestamp | Source | Quality_Metric | Measurement Timestamp | 1-1 Mapping |
| Bronze | bz_quality_metric | sample_size | Source | Quality_Metric | Sample Size | 1-1 Mapping |
| Bronze | bz_quality_metric | geographic_region | Source | Quality_Metric | Geographic Region | 1-1 Mapping |
| Bronze | bz_quality_metric | network_type | Source | Quality_Metric | Network Type | 1-1 Mapping |
| Bronze | bz_quality_metric | device_category | Source | Quality_Metric | Device Category | 1-1 Mapping |
| Bronze | bz_quality_metric | issue_count | Source | Quality_Metric | Issue Count | 1-1 Mapping |
| Bronze | bz_quality_metric | resolution_status | Source | Quality_Metric | Resolution Status | 1-1 Mapping |
| Bronze | bz_quality_metric | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_quality_metric | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_quality_metric | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_integration | integration_name | Source | Integration | Integration Name | 1-1 Mapping |
| Bronze | bz_integration | integration_type | Source | Integration | Integration Type | 1-1 Mapping |
| Bronze | bz_integration | api_version | Source | Integration | API Version | 1-1 Mapping |
| Bronze | bz_integration | authentication_method | Source | Integration | Authentication Method | 1-1 Mapping |
| Bronze | bz_integration | data_sync_frequency | Source | Integration | Data Sync Frequency | 1-1 Mapping |
| Bronze | bz_integration | integration_status | Source | Integration | Integration Status | 1-1 Mapping |
| Bronze | bz_integration | configuration_settings | Source | Integration | Configuration Settings | 1-1 Mapping |
| Bronze | bz_integration | usage_volume | Source | Integration | Usage Volume | 1-1 Mapping |
| Bronze | bz_integration | error_rate | Source | Integration | Error Rate | 1-1 Mapping |
| Bronze | bz_integration | performance_metrics | Source | Integration | Performance Metrics | 1-1 Mapping |
| Bronze | bz_integration | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_integration | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_integration | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_api_call | api_endpoint | Source | API_Call | API Endpoint | 1-1 Mapping |
| Bronze | bz_api_call | request_method | Source | API_Call | Request Method | 1-1 Mapping |
| Bronze | bz_api_call | request_timestamp | Source | API_Call | Request Timestamp | 1-1 Mapping |
| Bronze | bz_api_call | response_time | Source | API_Call | Response Time | 1-1 Mapping |
| Bronze | bz_api_call | response_status | Source | API_Call | Response Status | 1-1 Mapping |
| Bronze | bz_api_call | request_size | Source | API_Call | Request Size | 1-1 Mapping |
| Bronze | bz_api_call | response_size | Source | API_Call | Response Size | 1-1 Mapping |
| Bronze | bz_api_call | authentication_token | Source | API_Call | Authentication Token | 1-1 Mapping |
| Bronze | bz_api_call | rate_limit_status | Source | API_Call | Rate Limit Status | 1-1 Mapping |
| Bronze | bz_api_call | error_message | Source | API_Call | Error Message | 1-1 Mapping |
| Bronze | bz_api_call | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_api_call | update_timestamp | System | Metadata | Update Timestamp | 1-1 Mapping |
| Bronze | bz_api_call | source_system | System | Metadata | Source System | 1-1 Mapping |
| Bronze | bz_audit | record_id | System | Audit | Record ID | 1-1 Mapping |
| Bronze | bz_audit | source_table | System | Audit | Source Table | 1-1 Mapping |
| Bronze | bz_audit | load_timestamp | System | Metadata | Load Timestamp | 1-1 Mapping |
| Bronze | bz_audit | processed_by | System | Audit | Processed By | 1-1 Mapping |
| Bronze | bz_audit | processing_time | System | Audit | Processing Time | 1-1 Mapping |
| Bronze | bz_audit | status | System | Audit | Status | 1-1 Mapping |

## API Cost Calculation

**apiCost: 5070.000000**

Estimated monthly API cost for Bronze layer data ingestion: $5,070.00