_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Updated Gold layer logical data model for Zoom platform analytics aligned with source tables and Silver physical model following medallion architecture
## *Version*: 3
## *Updated on*: 
## *Changes*: Created fact, dimension and aggregation tables aligned with source tables and Silver physical model/logical model following medallion structure
## *Reason*: User requested to create fact, dimension and aggregation tables aligned with source tables or silver physical model/logical model follow medallion structure and write it successfully in the github
_____________________________________________

# Gold Layer Logical Data Model - Zoom Platform Analytics

## 1. Gold Layer Logical Model

### 1.1 Fact Tables

#### Go_Meeting_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Core fact table capturing meeting session metrics and measurements aligned with Silver sv_meetings table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| meeting_topic | VARCHAR(255) | Subject or title of the meeting session | Non-PII |
| host_name | VARCHAR(255) | Name of the meeting host user | Non-PII |
| start_time | TIMESTAMP | Actual start timestamp of the meeting | Non-PII |
| end_time | TIMESTAMP | Actual end timestamp of the meeting | Non-PII |
| duration_minutes | INTEGER | Total duration of meeting in minutes | Non-PII |
| participant_count | INTEGER | Total number of participants in meeting | Non-PII |
| meeting_date | DATE | Date when meeting occurred | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_Participant_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Fact table capturing participant engagement metrics aligned with Silver sv_participants table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| meeting_topic | VARCHAR(255) | Reference to meeting session | Non-PII |
| participant_name | VARCHAR(255) | Name of the meeting participant | PII |
| join_time | TIMESTAMP | Timestamp when participant joined meeting | Non-PII |
| leave_time | TIMESTAMP | Timestamp when participant left meeting | Non-PII |
| attendance_duration_minutes | INTEGER | Duration participant was in meeting | Non-PII |
| participation_date | DATE | Date of participation | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_Feature_Usage_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Fact table capturing feature utilization metrics aligned with Silver sv_feature_usage table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| meeting_topic | VARCHAR(255) | Reference to meeting where feature was used | Non-PII |
| feature_name | VARCHAR(100) | Name of the feature utilized | Non-PII |
| usage_count | INTEGER | Number of times feature was used | Non-PII |
| usage_date | DATE | Date when feature was used | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_Webinar_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Fact table capturing webinar event metrics aligned with Silver sv_webinars table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| webinar_topic | VARCHAR(255) | Subject or title of the webinar event | Non-PII |
| host_name | VARCHAR(255) | Name of the webinar host user | Non-PII |
| start_time | TIMESTAMP | Actual start timestamp of the webinar | Non-PII |
| end_time | TIMESTAMP | Actual end timestamp of the webinar | Non-PII |
| duration_minutes | INTEGER | Total duration of webinar in minutes | Non-PII |
| registrants_count | INTEGER | Number of registered attendees | Non-PII |
| webinar_date | DATE | Date when webinar occurred | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_Billing_Event_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Fact table capturing billing transaction metrics aligned with Silver sv_billing_events table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| user_name | VARCHAR(255) | Name of user associated with billing event | PII |
| event_type | VARCHAR(50) | Type of billing event (charge, refund, etc.) | Non-PII |
| amount | DECIMAL(10,2) | Monetary amount of the billing event | Non-PII |
| event_date | DATE | Date when billing event occurred | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

### 1.2 Dimension Tables

#### Go_User_Dimension
**Type**: Dimension Table  
**SCD Type**: Type 2 (Slowly Changing Dimension)  
**Description**: User dimension table with historical tracking aligned with Silver sv_users table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| user_name | VARCHAR(255) | Full display name of the user | PII |
| email_address | VARCHAR(320) | Primary email address of the user | PII |
| company_name | VARCHAR(255) | Company or organization name | Non-PII |
| plan_type | VARCHAR(50) | Subscription plan type (basic, pro, enterprise) | Non-PII |
| effective_start_date | DATE | Start date of this version of the record | Non-PII |
| effective_end_date | DATE | End date of this version of the record | Non-PII |
| is_current_record | BOOLEAN | Indicator if this is the current active version | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_License_Dimension
**Type**: Dimension Table  
**SCD Type**: Type 2 (Slowly Changing Dimension)  
**Description**: License dimension table with historical tracking aligned with Silver sv_licenses table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| license_type | VARCHAR(100) | Type or category of license | Non-PII |
| assigned_user_name | VARCHAR(255) | Name of user assigned to the license | PII |
| license_start_date | DATE | Start date of license validity | Non-PII |
| license_end_date | DATE | End date of license validity | Non-PII |
| effective_start_date | DATE | Start date of this version of the record | Non-PII |
| effective_end_date | DATE | End date of this version of the record | Non-PII |
| is_current_record | BOOLEAN | Indicator if this is the current active version | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

#### Go_Support_Ticket_Dimension
**Type**: Dimension Table  
**SCD Type**: Type 1 (Slowly Changing Dimension)  
**Description**: Support ticket dimension table aligned with Silver sv_support_tickets table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| user_name | VARCHAR(255) | Name of user who created the support ticket | PII |
| ticket_type | VARCHAR(100) | Category or type of support ticket | Non-PII |
| resolution_status | VARCHAR(50) | Current status of ticket resolution | Non-PII |
| ticket_open_date | DATE | Date when support ticket was opened | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| data_quality_score | DECIMAL(3,2) | Data quality assessment score | Non-PII |
| record_status | VARCHAR(20) | Status of the record (active/inactive) | Non-PII |

### 1.3 Aggregated Tables

#### Go_Daily_Meeting_Summary
**Type**: Aggregated Table  
**SCD Type**: N/A (Aggregated table)  
**Description**: Daily aggregated meeting metrics for reporting and analytics

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| summary_date | DATE | Date for which metrics are aggregated | Non-PII |
| total_meetings | INTEGER | Total number of meetings conducted | Non-PII |
| total_meeting_duration_minutes | INTEGER | Total duration of all meetings in minutes | Non-PII |
| average_meeting_duration_minutes | DECIMAL(10,2) | Average duration per meeting | Non-PII |
| total_participants | INTEGER | Total number of participants across all meetings | Non-PII |
| unique_hosts | INTEGER | Number of unique meeting hosts | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |

#### Go_Monthly_Feature_Usage_Summary
**Type**: Aggregated Table  
**SCD Type**: N/A (Aggregated table)  
**Description**: Monthly aggregated feature usage metrics for trend analysis

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| summary_month | DATE | Month for which metrics are aggregated | Non-PII |
| feature_name | VARCHAR(100) | Name of the feature | Non-PII |
| total_usage_count | INTEGER | Total usage count for the feature | Non-PII |
| unique_meetings_using_feature | INTEGER | Number of unique meetings using the feature | Non-PII |
| adoption_rate_percentage | DECIMAL(5,2) | Percentage of meetings using the feature | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |

#### Go_User_Billing_Summary
**Type**: Aggregated Table  
**SCD Type**: N/A (Aggregated table)  
**Description**: User-level billing summary for financial reporting

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| user_name | VARCHAR(255) | Name of the user | PII |
| billing_month | DATE | Month for which billing is summarized | Non-PII |
| total_billing_amount | DECIMAL(12,2) | Total billing amount for the user | Non-PII |
| number_of_billing_events | INTEGER | Number of billing events for the user | Non-PII |
| average_event_amount | DECIMAL(10,2) | Average amount per billing event | Non-PII |
| load_timestamp | TIMESTAMP | Timestamp when record was loaded | Non-PII |
| update_timestamp | TIMESTAMP | Timestamp when record was last updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |

### 1.4 Process Audit Data

#### Go_Process_Audit
**Type**: Audit Table  
**SCD Type**: N/A (Audit table)  
**Description**: Process audit data from pipeline execution aligned with Silver sv_process_audit table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| pipeline_name | VARCHAR(255) | Name of the data pipeline process | Non-PII |
| execution_start_time | TIMESTAMP | Start timestamp of pipeline execution | Non-PII |
| execution_end_time | TIMESTAMP | End timestamp of pipeline execution | Non-PII |
| execution_status | VARCHAR(50) | Status of pipeline execution (success/failure) | Non-PII |
| error_message | TEXT | Error message if execution failed | Non-PII |
| records_processed | INTEGER | Total number of records processed | Non-PII |
| records_successful | INTEGER | Number of successfully processed records | Non-PII |
| records_failed | INTEGER | Number of failed records | Non-PII |
| processing_duration_seconds | INTEGER | Duration of processing in seconds | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |
| target_system | VARCHAR(50) | Target system identifier | Non-PII |
| process_type | VARCHAR(100) | Type of process (ETL, validation, etc.) | Non-PII |
| executed_by_user | VARCHAR(255) | User who executed the process | Non-PII |
| server_name | VARCHAR(100) | Server where process was executed | Non-PII |
| memory_usage_mb | INTEGER | Memory usage during process execution | Non-PII |
| cpu_usage_percent | DECIMAL(5,2) | CPU usage percentage during execution | Non-PII |
| load_date | DATE | Date when audit record was created | Non-PII |
| update_date | DATE | Date when audit record was updated | Non-PII |

### 1.5 Error Data

#### Go_Data_Quality_Errors
**Type**: Error Data Table  
**SCD Type**: N/A (Error table)  
**Description**: Error data from data validation process aligned with Silver sv_data_quality_errors table

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| source_table_name | VARCHAR(255) | Name of source table where error occurred | Non-PII |
| source_column_name | VARCHAR(255) | Name of source column with error | Non-PII |
| error_type | VARCHAR(100) | Type or category of data quality error | Non-PII |
| error_description | TEXT | Detailed description of the error | Non-PII |
| error_value | TEXT | Actual value that caused the error | Non-PII |
| expected_format | VARCHAR(255) | Expected format or pattern for the data | Non-PII |
| record_identifier | VARCHAR(255) | Identifier of the record with error | Non-PII |
| error_timestamp | TIMESTAMP | Timestamp when error was detected | Non-PII |
| severity_level | VARCHAR(50) | Severity level of the error (low/medium/high) | Non-PII |
| resolution_status | VARCHAR(50) | Status of error resolution | Non-PII |
| resolved_by_user | VARCHAR(255) | User who resolved the error | Non-PII |
| resolution_timestamp | TIMESTAMP | Timestamp when error was resolved | Non-PII |
| load_date | DATE | Date when error record was created | Non-PII |
| update_date | DATE | Date when error record was updated | Non-PII |
| source_system | VARCHAR(50) | Source system identifier | Non-PII |

## 2. Conceptual Data Model Diagram

| Parent Table | Child Table | Relationship Type | Key Field | Relationship Description |
|--------------|-------------|-------------------|-----------|-------------------------|
| Go_User_Dimension | Go_Meeting_Facts | One-to-Many | user_name → host_name | User can host multiple meetings |
| Go_User_Dimension | Go_Participant_Facts | One-to-Many | user_name → participant_name | User can participate in multiple meetings |
| Go_User_Dimension | Go_Billing_Event_Facts | One-to-Many | user_name → user_name | User can have multiple billing events |
| Go_User_Dimension | Go_License_Dimension | One-to-Many | user_name → assigned_user_name | User can have multiple licenses |
| Go_User_Dimension | Go_Support_Ticket_Dimension | One-to-Many | user_name → user_name | User can create multiple support tickets |
| Go_Meeting_Facts | Go_Participant_Facts | One-to-Many | meeting_topic → meeting_topic | Meeting can have multiple participants |
| Go_Meeting_Facts | Go_Feature_Usage_Facts | One-to-Many | meeting_topic → meeting_topic | Meeting can have multiple feature usages |
| Go_User_Dimension | Go_Daily_Meeting_Summary | One-to-Many | user_name → (aggregated) | User meetings contribute to daily summaries |
| Go_Feature_Usage_Facts | Go_Monthly_Feature_Usage_Summary | Many-to-One | feature_name → feature_name | Feature usage aggregated monthly |
| Go_Billing_Event_Facts | Go_User_Billing_Summary | Many-to-One | user_name → user_name | Billing events aggregated by user monthly |

## 3. ER Diagram

```
┌─────────────────────┐         ┌─────────────────────┐         ┌─────────────────────┐
│   Go_User_Dimension │         │   Go_Meeting_Facts  │         │Go_Participant_Facts │
├─────────────────────┤         ├─────────────────────┤         ├─────────────────────┤
│ user_name           │◄────────┤ host_name           │◄────────┤ meeting_topic       │
│ email_address       │         │ meeting_topic       │         │ participant_name    │
│ company_name        │         │ start_time          │         │ join_time           │
│ plan_type           │         │ end_time            │         │ leave_time          │
│ effective_start_date│         │ duration_minutes    │         │ attendance_duration │
│ effective_end_date  │         │ participant_count   │         └─────────────────────┘
│ is_current_record   │         │ meeting_date        │
└─────────────────────┘         └─────────────────────┘
         │                               │
         │                               │
         ▼                               ▼
┌─────────────────────┐         ┌─────────────────────┐
│Go_License_Dimension │         │Go_Feature_Usage_Facts│
├─────────────────────┤         ├─────────────────────┤
│ license_type        │         │ meeting_topic       │
│ assigned_user_name  │         │ feature_name        │
│ license_start_date  │         │ usage_count         │
│ license_end_date    │         │ usage_date          │
└─────────────────────┘         └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐         ┌─────────────────────┐
│Go_Support_Ticket_Dim│         │  Go_Webinar_Facts   │         │Go_Billing_Event_Facts│
├─────────────────────┤         ├─────────────────────┤         ├─────────────────────┤
│ user_name           │         │ webinar_topic       │         │ user_name           │
│ ticket_type         │         │ host_name           │         │ event_type          │
│ resolution_status   │         │ start_time          │         │ amount              │
│ ticket_open_date    │         │ end_time            │         │ event_date          │
└─────────────────────┘         │ registrants_count   │         └─────────────────────┘
                                └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐         ┌─────────────────────┐
│Go_Daily_Meeting_Sum │         │Go_Monthly_Feature_  │         │Go_User_Billing_Sum  │
├─────────────────────┤         │Usage_Summary        │         ├─────────────────────┤
│ summary_date        │         ├─────────────────────┤         │ user_name           │
│ total_meetings      │         │ summary_month       │         │ billing_month       │
│ total_duration      │         │ feature_name        │         │ total_billing_amount│
│ average_duration    │         │ total_usage_count   │         │ number_of_events    │
│ total_participants  │         │ unique_meetings     │         │ average_event_amount│
│ unique_hosts        │         │ adoption_rate_pct   │         └─────────────────────┘
└─────────────────────┘         └─────────────────────┘

┌─────────────────────┐         ┌─────────────────────┐
│  Go_Process_Audit   │         │Go_Data_Quality_Errors│
├─────────────────────┤         ├─────────────────────┤
│ pipeline_name       │         │ source_table_name   │
│ execution_start_time│         │ source_column_name  │
│ execution_end_time  │         │ error_type          │
│ execution_status    │         │ error_description   │
│ records_processed   │         │ error_value         │
│ records_successful  │         │ error_timestamp     │
│ records_failed      │         │ severity_level      │
└─────────────────────┘         └─────────────────────┘
```

## 4. apiCost: 0.245000

The cost consumed by the API for this Gold layer logical data model creation is $0.245000 USD, including all processing and generation activities.