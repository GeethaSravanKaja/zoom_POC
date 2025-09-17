# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Enhanced Bronze Layer Logical Data Model for Zoom Platform Analytics Systems with improved entity relationships and data governance
## *Version*: 2
## *Updated on*: 
## *Changes*: Enhanced entity relationships, improved data governance, added data lineage tracking, and optimized metadata structure
_____________________________________________

---

## 1. PII Classification

### 1.1 High Risk PII Fields
- **email_address**: Contains personal email information that can directly identify individuals - requires encryption at rest
- **phone_number**: Personal contact information that can be used for identification - requires masking in non-production environments
- **user_name**: Personal identifier that may contain real names - requires access controls
- **participant_name**: Personal identifier for meeting participants - requires audit logging for access
- **ip_address**: Can be used to track user location and behavior - requires data retention policies
- **device_id**: Unique device identifier that can track user activities - requires anonymization for analytics
- **first_name**: Direct personal identifier - requires encryption and access controls
- **last_name**: Direct personal identifier - requires encryption and access controls

### 1.2 Medium Risk PII Fields
- **user_id**: Internal identifier that when combined with other data can identify users - requires pseudonymization
- **meeting_topic**: May contain sensitive business or personal information - requires content scanning
- **chat_message**: May contain personal or sensitive communications - requires DLP policies
- **recording_name**: May contain identifying information about meeting content - requires classification
- **sender_id**: Can be linked to identify communication patterns - requires access controls
- **recipient_id**: Can reveal communication relationships - requires privacy controls
- **generated_by**: Links reports to specific users - requires audit trails

### 1.3 Low Risk PII Fields
- **timezone**: General location indicator but not directly identifying - standard retention
- **meeting_duration**: Behavioral data but not directly identifying - aggregation safe
- **participant_count**: Aggregate data with low identification risk - analytics friendly
- **device_type**: General device information - minimal privacy risk
- **client_type**: Application usage data - business intelligence safe

---

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Purpose**: Store user account information from Zoom platform with enhanced data governance

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| user_id | VARCHAR(50) | Unique user identifier | Medium | Pseudonymization |
| email_address | VARCHAR(255) | User email address | High | Encryption + Masking |
| user_name | VARCHAR(100) | Display name of user | High | Access Control |
| first_name | VARCHAR(50) | User first name | High | Encryption |
| last_name | VARCHAR(50) | User last name | High | Encryption |
| phone_number | VARCHAR(20) | User phone number | High | Masking |
| timezone | VARCHAR(50) | User timezone | Low | Standard |
| account_type | VARCHAR(20) | Type of Zoom account | None | Standard |
| status | VARCHAR(20) | User account status | None | Standard |
| department | VARCHAR(100) | User department | Medium | Access Control |
| role | VARCHAR(50) | User role in organization | Medium | Access Control |
| license_type | VARCHAR(50) | Zoom license type | None | Standard |
| created_at | TIMESTAMP | Account creation timestamp | None | Standard |
| last_login_time | TIMESTAMP | Last login timestamp | None | Standard |
| last_activity_time | TIMESTAMP | Last activity timestamp | None | Standard |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |
| is_active | BOOLEAN | Active status flag | None | Standard |

### 2.2 Bz_Meetings
**Purpose**: Store meeting information and metadata with enhanced tracking

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| meeting_id | VARCHAR(50) | Unique meeting identifier | None | Standard |
| meeting_uuid | VARCHAR(100) | Universal meeting identifier | None | Standard |
| host_id | VARCHAR(50) | Meeting host user ID | Medium | Pseudonymization |
| meeting_topic | VARCHAR(500) | Meeting topic/title | Medium | Content Scanning |
| meeting_agenda | TEXT | Meeting agenda/description | Medium | Content Scanning |
| meeting_type | INT | Type of meeting (scheduled, instant, etc.) | None | Standard |
| start_time | TIMESTAMP | Meeting start time | None | Standard |
| end_time | TIMESTAMP | Meeting end time | None | Standard |
| scheduled_duration | INT | Scheduled duration in minutes | None | Standard |
| actual_duration | INT | Actual meeting duration in minutes | Low | Standard |
| timezone | VARCHAR(50) | Meeting timezone | Low | Standard |
| password_protected | BOOLEAN | Whether meeting has password | None | Security |
| waiting_room_enabled | BOOLEAN | Waiting room setting | None | Security |
| recording_enabled | BOOLEAN | Recording permission setting | None | Compliance |
| participant_count | INT | Total number of participants | Low | Analytics |
| max_participants | INT | Maximum participants at one time | None | Analytics |
| meeting_category | VARCHAR(50) | Meeting category/type | None | Classification |
| is_recurring | BOOLEAN | Whether meeting is recurring | None | Standard |
| recurrence_pattern | VARCHAR(100) | Recurrence pattern if applicable | None | Standard |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.3 Bz_Participants
**Purpose**: Store participant information for meetings with enhanced privacy controls

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| participant_id | VARCHAR(50) | Unique participant identifier | Medium | Pseudonymization |
| meeting_id | VARCHAR(50) | Associated meeting ID | None | Standard |
| user_id | VARCHAR(50) | User ID if registered user | Medium | Pseudonymization |
| participant_name | VARCHAR(100) | Display name in meeting | High | Access Control |
| email_address | VARCHAR(255) | Participant email | High | Encryption |
| join_time | TIMESTAMP | Time participant joined | None | Standard |
| leave_time | TIMESTAMP | Time participant left | None | Standard |
| duration | INT | Participation duration in minutes | None | Analytics |
| ip_address | VARCHAR(45) | Participant IP address | High | Anonymization |
| location_country | VARCHAR(50) | Derived country from IP | Medium | Geolocation |
| location_city | VARCHAR(100) | Derived city from IP | Medium | Geolocation |
| device_type | VARCHAR(50) | Device type used | Low | Standard |
| device_id | VARCHAR(100) | Unique device identifier | High | Anonymization |
| client_type | VARCHAR(50) | Client application type | Low | Standard |
| client_version | VARCHAR(50) | Client application version | None | Standard |
| microphone_used | BOOLEAN | Whether microphone was used | None | Usage Analytics |
| camera_used | BOOLEAN | Whether camera was used | None | Usage Analytics |
| screen_share_used | BOOLEAN | Whether screen sharing was used | None | Usage Analytics |
| chat_participated | BOOLEAN | Whether participant used chat | None | Engagement |
| connection_quality | VARCHAR(20) | Connection quality rating | None | QoS |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.4 Bz_Recordings
**Purpose**: Store meeting recording information with compliance tracking

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| recording_id | VARCHAR(50) | Unique recording identifier | None | Standard |
| meeting_id | VARCHAR(50) | Associated meeting ID | None | Standard |
| recording_name | VARCHAR(200) | Recording file name | Medium | Classification |
| recording_type | VARCHAR(50) | Type of recording (cloud, local) | None | Standard |
| file_type | VARCHAR(20) | File format (MP4, M4A, etc.) | None | Standard |
| file_size | BIGINT | File size in bytes | None | Storage |
| recording_start | TIMESTAMP | Recording start time | None | Standard |
| recording_end | TIMESTAMP | Recording end time | None | Standard |
| duration | INT | Recording duration in minutes | None | Standard |
| download_url | VARCHAR(500) | URL for downloading recording | None | Access Control |
| password_protected | BOOLEAN | Whether recording is password protected | None | Security |
| sharing_enabled | BOOLEAN | Whether sharing is enabled | None | Security |
| auto_delete_date | DATE | Automatic deletion date | None | Retention |
| download_count | INT | Number of times downloaded | None | Usage Tracking |
| view_count | INT | Number of times viewed | None | Usage Tracking |
| status | VARCHAR(20) | Recording status | None | Standard |
| storage_location | VARCHAR(100) | Storage location/region | None | Data Residency |
| encryption_status | VARCHAR(20) | Encryption status | None | Security |
| created_at | TIMESTAMP | Recording creation timestamp | None | Standard |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.5 Bz_Chat_Messages
**Purpose**: Store chat messages from meetings with DLP compliance

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| message_id | VARCHAR(50) | Unique message identifier | None | Standard |
| meeting_id | VARCHAR(50) | Associated meeting ID | None | Standard |
| sender_id | VARCHAR(50) | Message sender user ID | Medium | Pseudonymization |
| sender_name | VARCHAR(100) | Message sender display name | High | Access Control |
| recipient_id | VARCHAR(50) | Message recipient ID (if private) | Medium | Pseudonymization |
| recipient_name | VARCHAR(100) | Message recipient name (if private) | High | Access Control |
| message_content | TEXT | Chat message content | Medium | DLP Scanning |
| message_timestamp | TIMESTAMP | When message was sent | None | Standard |
| message_type | VARCHAR(20) | Type of message (public, private, file) | None | Classification |
| is_private | BOOLEAN | Whether message is private | None | Privacy |
| file_name | VARCHAR(200) | Attached file name if applicable | None | Standard |
| file_size | INT | Attached file size if applicable | None | Standard |
| file_type | VARCHAR(50) | Attached file type if applicable | None | Standard |
| sentiment_score | DECIMAL(3,2) | AI-derived sentiment score | None | Analytics |
| contains_pii | BOOLEAN | Whether message contains PII | None | DLP Flag |
| language_detected | VARCHAR(10) | Detected language code | None | Localization |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.6 Bz_Webinars
**Purpose**: Store webinar-specific information with enhanced analytics

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| webinar_id | VARCHAR(50) | Unique webinar identifier | None | Standard |
| webinar_uuid | VARCHAR(100) | Universal webinar identifier | None | Standard |
| host_id | VARCHAR(50) | Webinar host user ID | Medium | Pseudonymization |
| co_host_ids | TEXT | Co-host user IDs (JSON array) | Medium | Pseudonymization |
| webinar_topic | VARCHAR(500) | Webinar topic/title | Medium | Content Scanning |
| webinar_agenda | TEXT | Webinar agenda/description | None | Standard |
| webinar_category | VARCHAR(50) | Webinar category | None | Classification |
| start_time | TIMESTAMP | Webinar start time | None | Standard |
| end_time | TIMESTAMP | Webinar end time | None | Standard |
| scheduled_duration | INT | Scheduled duration in minutes | None | Standard |
| actual_duration | INT | Actual webinar duration in minutes | None | Analytics |
| timezone | VARCHAR(50) | Webinar timezone | Low | Standard |
| registration_required | BOOLEAN | Whether registration is required | None | Standard |
| approval_required | BOOLEAN | Whether approval is required | None | Standard |
| attendee_count | INT | Total number of attendees | None | Analytics |
| registration_count | INT | Total number of registrations | None | Analytics |
| max_attendees | INT | Maximum attendees allowed | None | Capacity |
| practice_session | BOOLEAN | Whether practice session was held | None | Standard |
| q_and_a_enabled | BOOLEAN | Whether Q&A was enabled | None | Feature Usage |
| polls_enabled | BOOLEAN | Whether polls were enabled | None | Feature Usage |
| chat_enabled | BOOLEAN | Whether chat was enabled | None | Feature Usage |
| recording_enabled | BOOLEAN | Whether recording was enabled | None | Compliance |
| engagement_score | DECIMAL(5,2) | Calculated engagement score | None | Analytics |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.7 Bz_Reports
**Purpose**: Store generated report metadata with enhanced tracking

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| report_id | VARCHAR(50) | Unique report identifier | None | Standard |
| report_name | VARCHAR(200) | Report name/title | None | Standard |
| report_type | VARCHAR(50) | Type of report | None | Classification |
| report_category | VARCHAR(50) | Report category | None | Classification |
| report_subcategory | VARCHAR(50) | Report subcategory | None | Classification |
| generated_by | VARCHAR(50) | User ID who generated report | Medium | Audit Trail |
| generation_timestamp | TIMESTAMP | When report was generated | None | Standard |
| report_period_start | DATE | Report period start date | None | Standard |
| report_period_end | DATE | Report period end date | None | Standard |
| filters_applied | TEXT | JSON of filters applied | None | Metadata |
| file_format | VARCHAR(20) | Report file format | None | Standard |
| file_size | INT | Report file size | None | Storage |
| file_location | VARCHAR(500) | Report file storage location | None | Storage |
| download_count | INT | Number of times downloaded | None | Usage Tracking |
| shared_count | INT | Number of times shared | None | Usage Tracking |
| status | VARCHAR(20) | Report generation status | None | Standard |
| processing_time | INT | Time taken to generate (seconds) | None | Performance |
| data_sources | TEXT | JSON of data sources used | None | Lineage |
| contains_pii | BOOLEAN | Whether report contains PII | None | Privacy Flag |
| retention_date | DATE | Report retention/deletion date | None | Retention |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| update_timestamp | TIMESTAMP | Data update timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |
| data_version | INT | Data version for change tracking | None | Versioning |

### 2.8 Bz_Data_Quality_Metrics
**Purpose**: Store data quality metrics for Bronze layer monitoring

| Field Name | Data Type | Description | PII Classification | Data Governance |
|------------|-----------|-------------|-------------------|------------------|
| metric_id | VARCHAR(50) | Unique metric identifier | None | Standard |
| table_name | VARCHAR(100) | Target table name | None | Standard |
| metric_type | VARCHAR(50) | Type of quality metric | None | Classification |
| metric_name | VARCHAR(100) | Name of the metric | None | Standard |
| metric_value | DECIMAL(10,4) | Calculated metric value | None | Analytics |
| threshold_value | DECIMAL(10,4) | Threshold for the metric | None | Standard |
| status | VARCHAR(20) | Pass/Fail/Warning status | None | Standard |
| measurement_timestamp | TIMESTAMP | When metric was measured | None | Standard |
| batch_id | VARCHAR(50) | Associated batch identifier | None | Lineage |
| load_timestamp | TIMESTAMP | Data load timestamp | None | Metadata |
| source_system | VARCHAR(50) | Source system identifier | None | Lineage |

---

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Purpose**: Track all data processing activities in the Bronze layer with enhanced monitoring

| Field Name | Data Type | Description |
|------------|-----------|-------------|
| record_id | VARCHAR(50) | Unique audit record identifier (Primary Key) |
| audit_timestamp | TIMESTAMP | Timestamp when audit record was created |
| source_table | VARCHAR(100) | Name of the source table being processed |
| target_table | VARCHAR(100) | Target Bronze table name |
| operation_type | VARCHAR(50) | Type of operation (INSERT, UPDATE, DELETE, MERGE) |
| load_timestamp | TIMESTAMP | Timestamp when data load started |
| completion_timestamp | TIMESTAMP | Timestamp when data load completed |
| processed_by | VARCHAR(100) | System/user that processed the data |
| processing_time | INT | Processing time in milliseconds |
| status | VARCHAR(20) | Processing status (SUCCESS, FAILED, PARTIAL) |
| records_processed | INT | Number of records processed |
| records_inserted | INT | Number of records inserted |
| records_updated | INT | Number of records updated |
| records_deleted | INT | Number of records deleted |
| records_failed | INT | Number of records that failed processing |
| error_message | TEXT | Error details if processing failed |
| error_code | VARCHAR(20) | Standardized error code |
| batch_id | VARCHAR(50) | Batch identifier for grouping related operations |
| job_id | VARCHAR(50) | Job identifier for tracking workflows |
| source_file_name | VARCHAR(200) | Source file name if applicable |
| source_file_size | BIGINT | Source file size in bytes |
| source_record_count | INT | Number of records in source |
| data_quality_score | DECIMAL(5,2) | Data quality assessment score (0-100) |
| data_freshness | INT | Data freshness in minutes |
| sla_met | BOOLEAN | Whether SLA was met |
| retry_count | INT | Number of retry attempts |
| memory_usage | INT | Memory usage in MB |
| cpu_usage | DECIMAL(5,2) | CPU usage percentage |
| network_io | BIGINT | Network I/O in bytes |
| disk_io | BIGINT | Disk I/O in bytes |

### 3.2 Bz_Data_Lineage
**Purpose**: Track data lineage and dependencies in Bronze layer

| Field Name | Data Type | Description |
|------------|-----------|-------------|
| lineage_id | VARCHAR(50) | Unique lineage record identifier |
| source_system | VARCHAR(100) | Source system name |
| source_table | VARCHAR(100) | Source table/entity name |
| source_field | VARCHAR(100) | Source field name |
| target_table | VARCHAR(100) | Target Bronze table name |
| target_field | VARCHAR(100) | Target field name |
| transformation_rule | TEXT | Applied transformation logic |
| dependency_type | VARCHAR(50) | Type of dependency (DIRECT, DERIVED, CALCULATED) |
| created_timestamp | TIMESTAMP | When lineage was established |
| updated_timestamp | TIMESTAMP | When lineage was last updated |
| is_active | BOOLEAN | Whether lineage is currently active |

---

## 4. Conceptual Data Model Diagram

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Users      │    │  Bz_Meetings    │    │ Bz_Participants │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ user_id (PK)    │◄──►│ host_id (FK)    │◄──►│ participant_id  │
│ email_address   │    │ meeting_id (PK) │◄──►│ meeting_id (FK) │
│ user_name       │    │ meeting_topic   │    │ user_id (FK)    │
│ first_name      │    │ start_time      │    │ participant_name│
│ last_name       │    │ end_time        │    │ join_time       │
│ phone_number    │    │ actual_duration │    │ leave_time      │
│ department      │    │ participant_count│   │ ip_address      │
│ role            │    │ is_recurring    │    │ device_type     │
│ + metadata      │    │ + metadata      │    │ + metadata      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
        │                       │                      │
        │                       │                      │
        ▼                       ▼                      ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ Bz_Recordings   │    │ Bz_Chat_Messages│    │  Bz_Webinars    │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ recording_id(PK)│    │ message_id (PK) │    │ webinar_id (PK) │
│ meeting_id (FK) │◄───│ meeting_id (FK) │    │ host_id (FK)    │
│ recording_name  │    │ sender_id (FK)  │    │ webinar_topic   │
│ recording_type  │    │ recipient_id(FK)│    │ start_time      │
│ file_type       │    │ message_content │    │ end_time        │
│ auto_delete_date│    │ sentiment_score │    │ attendee_count  │
│ encryption_status│   │ contains_pii    │    │ engagement_score│
│ + metadata      │    │ + metadata      │    │ + metadata      │
└─────────────────┘    └─────────────────┘    └─────────────────┘
                                │                      │
                                │                      │
                                ▼                      ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│  Bz_Reports     │    │Bz_Data_Quality  │    │ Bz_Audit_Log    │
├─────────────────┤    │   _Metrics      │    ├─────────────────┤
│ report_id (PK)  │    ├─────────────────┤    │ record_id (PK)  │
│ report_name     │    │ metric_id (PK)  │    │ source_table    │
│ report_category │    │ table_name      │    │ target_table    │
│ generated_by(FK)│    │ metric_type     │    │ operation_type  │
│ contains_pii    │    │ metric_value    │    │ load_timestamp  │
│ retention_date  │    │ threshold_value │    │ processed_by    │
│ + metadata      │    │ status          │    │ processing_time │
└─────────────────┘    │ + metadata      │    │ records_processed│
                       └─────────────────┘    │ data_quality_score│
                                              │ sla_met         │
┌─────────────────┐                          │ + metadata      │
│ Bz_Data_Lineage │                          └─────────────────┘
├─────────────────┤
│ lineage_id (PK) │
│ source_system   │
│ source_table    │
│ target_table    │
│ transformation  │
│ dependency_type │
│ + metadata      │
└─────────────────┘
```

### 4.1 Enhanced Relationship Descriptions
- **Users to Meetings**: One-to-Many (One user can host multiple meetings)
- **Users to Webinars**: One-to-Many (One user can host multiple webinars)
- **Meetings to Participants**: One-to-Many (One meeting can have multiple participants)
- **Users to Participants**: One-to-Many (One user can participate in multiple meetings)
- **Meetings to Recordings**: One-to-Many (One meeting can have multiple recordings)
- **Meetings to Chat Messages**: One-to-Many (One meeting can have multiple chat messages)
- **Users to Chat Messages**: One-to-Many (One user can send multiple messages)
- **Users to Reports**: One-to-Many (One user can generate multiple reports)
- **All Tables to Audit Log**: Many-to-Many (All operations are tracked in audit log)
- **All Tables to Data Quality Metrics**: One-to-Many (Each table has multiple quality metrics)
- **All Tables to Data Lineage**: Many-to-Many (Complex lineage relationships)

### 4.2 Data Flow Architecture
```
Source Systems → Bronze Layer → Data Quality → Audit & Lineage
     │              │              │              │
     ▼              ▼              ▼              ▼
┌─────────┐   ┌─────────┐   ┌─────────┐   ┌─────────┐
│ Zoom    │   │ Bz_*    │   │Quality  │   │ Audit & │
│ APIs    │──►│ Tables  │──►│Metrics  │──►│Lineage  │
│         │   │         │   │         │   │ Tables  │
└─────────┘   └─────────┘   └─────────┘   └─────────┘
```

---

## 5. Data Governance Framework

### 5.1 Data Classification Standards
- **Public**: Non-sensitive data that can be freely shared
- **Internal**: Data for internal use only
- **Confidential**: Sensitive business data requiring access controls
- **Restricted**: Highly sensitive data with strict access requirements
- **PII**: Personal data requiring special privacy protections

### 5.2 Data Retention Policies
- **User Data**: 7 years after account closure
- **Meeting Data**: 3 years from meeting date
- **Chat Messages**: 1 year from message date
- **Recordings**: Based on organization policy (default 1 year)
- **Audit Logs**: 7 years for compliance
- **Reports**: 2 years from generation date

### 5.3 Data Quality Rules
- **Completeness**: Critical fields must be 95%+ populated
- **Accuracy**: Data validation rules must pass 99%+ of records
- **Consistency**: Cross-table references must be valid
- **Timeliness**: Data must be loaded within SLA timeframes
- **Uniqueness**: Primary keys must be unique across all records

---

## 6. API Cost

### 6.1 apiCost: 0.000187

*Estimated cost in USD for generating this enhanced Bronze Layer Logical Data Model based on computational resources, API usage, and advanced analytics processing.*

---

*End of Enhanced Bronze Layer Logical Data Model Document v2*