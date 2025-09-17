# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Logical Data Model for Zoom Platform Analytics Systems with standardized structure and audit capabilities
## *Version*: 1
## *Updated on*: 

---

## 1. PII Classification

### 1.1 High Risk PII Fields
- **email_address**: Contains personal email information that can directly identify individuals
- **phone_number**: Personal contact information that can be used for identification
- **user_name**: Personal identifier that may contain real names
- **participant_name**: Personal identifier for meeting participants
- **ip_address**: Can be used to track user location and behavior
- **device_id**: Unique device identifier that can track user activities

### 1.2 Medium Risk PII Fields
- **user_id**: Internal identifier that when combined with other data can identify users
- **meeting_topic**: May contain sensitive business or personal information
- **chat_message**: May contain personal or sensitive communications
- **recording_name**: May contain identifying information about meeting content

### 1.3 Low Risk PII Fields
- **timezone**: General location indicator but not directly identifying
- **meeting_duration**: Behavioral data but not directly identifying
- **participant_count**: Aggregate data with low identification risk

---

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Purpose**: Store user account information from Zoom platform

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| user_id | VARCHAR(50) | Unique user identifier | Medium |
| email_address | VARCHAR(255) | User email address | High |
| user_name | VARCHAR(100) | Display name of user | High |
| first_name | VARCHAR(50) | User first name | High |
| last_name | VARCHAR(50) | User last name | High |
| phone_number | VARCHAR(20) | User phone number | High |
| timezone | VARCHAR(50) | User timezone | Low |
| account_type | VARCHAR(20) | Type of Zoom account | None |
| status | VARCHAR(20) | User account status | None |
| created_at | TIMESTAMP | Account creation timestamp | None |
| last_login_time | TIMESTAMP | Last login timestamp | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.2 Bz_Meetings
**Purpose**: Store meeting information and metadata

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| meeting_id | VARCHAR(50) | Unique meeting identifier | None |
| meeting_uuid | VARCHAR(100) | Universal meeting identifier | None |
| host_id | VARCHAR(50) | Meeting host user ID | Medium |
| meeting_topic | VARCHAR(500) | Meeting topic/title | Medium |
| meeting_type | INT | Type of meeting (scheduled, instant, etc.) | None |
| start_time | TIMESTAMP | Meeting start time | None |
| end_time | TIMESTAMP | Meeting end time | None |
| duration | INT | Meeting duration in minutes | Low |
| timezone | VARCHAR(50) | Meeting timezone | Low |
| password_protected | BOOLEAN | Whether meeting has password | None |
| waiting_room_enabled | BOOLEAN | Waiting room setting | None |
| recording_enabled | BOOLEAN | Recording permission setting | None |
| participant_count | INT | Total number of participants | Low |
| max_participants | INT | Maximum participants at one time | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.3 Bz_Participants
**Purpose**: Store participant information for meetings

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| participant_id | VARCHAR(50) | Unique participant identifier | Medium |
| meeting_id | VARCHAR(50) | Associated meeting ID | None |
| user_id | VARCHAR(50) | User ID if registered user | Medium |
| participant_name | VARCHAR(100) | Display name in meeting | High |
| email_address | VARCHAR(255) | Participant email | High |
| join_time | TIMESTAMP | Time participant joined | None |
| leave_time | TIMESTAMP | Time participant left | None |
| duration | INT | Participation duration in minutes | None |
| ip_address | VARCHAR(45) | Participant IP address | High |
| device_type | VARCHAR(50) | Device type used | None |
| device_id | VARCHAR(100) | Unique device identifier | High |
| client_type | VARCHAR(50) | Client application type | None |
| microphone_used | BOOLEAN | Whether microphone was used | None |
| camera_used | BOOLEAN | Whether camera was used | None |
| screen_share_used | BOOLEAN | Whether screen sharing was used | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.4 Bz_Recordings
**Purpose**: Store meeting recording information

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| recording_id | VARCHAR(50) | Unique recording identifier | None |
| meeting_id | VARCHAR(50) | Associated meeting ID | None |
| recording_name | VARCHAR(200) | Recording file name | Medium |
| recording_type | VARCHAR(50) | Type of recording (cloud, local) | None |
| file_type | VARCHAR(20) | File format (MP4, M4A, etc.) | None |
| file_size | BIGINT | File size in bytes | None |
| recording_start | TIMESTAMP | Recording start time | None |
| recording_end | TIMESTAMP | Recording end time | None |
| duration | INT | Recording duration in minutes | None |
| download_url | VARCHAR(500) | URL for downloading recording | None |
| password_protected | BOOLEAN | Whether recording is password protected | None |
| status | VARCHAR(20) | Recording status | None |
| created_at | TIMESTAMP | Recording creation timestamp | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.5 Bz_Chat_Messages
**Purpose**: Store chat messages from meetings

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| message_id | VARCHAR(50) | Unique message identifier | None |
| meeting_id | VARCHAR(50) | Associated meeting ID | None |
| sender_id | VARCHAR(50) | Message sender user ID | Medium |
| sender_name | VARCHAR(100) | Message sender display name | High |
| recipient_id | VARCHAR(50) | Message recipient ID (if private) | Medium |
| message_content | TEXT | Chat message content | Medium |
| message_timestamp | TIMESTAMP | When message was sent | None |
| message_type | VARCHAR(20) | Type of message (public, private, file) | None |
| file_name | VARCHAR(200) | Attached file name if applicable | None |
| file_size | INT | Attached file size if applicable | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.6 Bz_Webinars
**Purpose**: Store webinar-specific information

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| webinar_id | VARCHAR(50) | Unique webinar identifier | None |
| webinar_uuid | VARCHAR(100) | Universal webinar identifier | None |
| host_id | VARCHAR(50) | Webinar host user ID | Medium |
| webinar_topic | VARCHAR(500) | Webinar topic/title | Medium |
| webinar_agenda | TEXT | Webinar agenda/description | None |
| start_time | TIMESTAMP | Webinar start time | None |
| end_time | TIMESTAMP | Webinar end time | None |
| duration | INT | Webinar duration in minutes | None |
| timezone | VARCHAR(50) | Webinar timezone | Low |
| registration_required | BOOLEAN | Whether registration is required | None |
| attendee_count | INT | Total number of attendees | None |
| registration_count | INT | Total number of registrations | None |
| max_attendees | INT | Maximum attendees allowed | None |
| practice_session | BOOLEAN | Whether practice session was held | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

### 2.7 Bz_Reports
**Purpose**: Store generated report metadata

| Field Name | Data Type | Description | PII Classification |
|------------|-----------|-------------|-------------------|
| report_id | VARCHAR(50) | Unique report identifier | None |
| report_name | VARCHAR(200) | Report name/title | None |
| report_type | VARCHAR(50) | Type of report | None |
| report_category | VARCHAR(50) | Report category | None |
| generated_by | VARCHAR(50) | User ID who generated report | Medium |
| generation_timestamp | TIMESTAMP | When report was generated | None |
| report_period_start | DATE | Report period start date | None |
| report_period_end | DATE | Report period end date | None |
| file_format | VARCHAR(20) | Report file format | None |
| file_size | INT | Report file size | None |
| download_count | INT | Number of times downloaded | None |
| status | VARCHAR(20) | Report generation status | None |
| load_timestamp | TIMESTAMP | Data load timestamp | None |
| update_timestamp | TIMESTAMP | Data update timestamp | None |
| source_system | VARCHAR(50) | Source system identifier | None |

---

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Purpose**: Track all data processing activities in the Bronze layer

| Field Name | Data Type | Description |
|------------|-----------|-------------|
| record_id | VARCHAR(50) | Unique audit record identifier (Primary Key) |
| source_table | VARCHAR(100) | Name of the source table being processed |
| load_timestamp | TIMESTAMP | Timestamp when data load started |
| processed_by | VARCHAR(100) | System/user that processed the data |
| processing_time | INT | Processing time in milliseconds |
| status | VARCHAR(20) | Processing status (SUCCESS, FAILED, PARTIAL) |
| records_processed | INT | Number of records processed |
| records_failed | INT | Number of records that failed processing |
| error_message | TEXT | Error details if processing failed |
| batch_id | VARCHAR(50) | Batch identifier for grouping related operations |
| source_file_name | VARCHAR(200) | Source file name if applicable |
| target_table | VARCHAR(100) | Target Bronze table name |
| data_quality_score | DECIMAL(5,2) | Data quality assessment score (0-100) |
| created_timestamp | TIMESTAMP | When audit record was created |

---

## 4. Conceptual Data Model Diagram

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Users      │    │  Bz_Meetings    │    │ Bz_Participants │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ user_id         │◄──►│ host_id         │◄──►│ participant_id  │
│ email_address   │    │ meeting_id      │◄──►│ meeting_id      │
│ user_name       │    │ meeting_topic   │    │ user_id         │
│ first_name      │    │ start_time      │    │ participant_name│
│ last_name       │    │ end_time        │    │ join_time       │
│ phone_number    │    │ duration        │    │ leave_time      │
│ timezone        │    │ participant_count│   │ ip_address      │
│ account_type    │    │ + metadata      │    │ + metadata      │
│ + metadata      │    └─────────────────┘    └─────────────────┘
└─────────────────┘              │                      │
                                  │                      │
                                  ▼                      ▼
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│ Bz_Recordings   │    │ Bz_Chat_Messages│    │  Bz_Webinars    │
├─────────────────┤    ├─────────────────┤    ├─────────────────┤
│ recording_id    │    │ message_id      │    │ webinar_id      │
│ meeting_id      │◄───│ meeting_id      │    │ host_id         │
│ recording_name  │    │ sender_id       │    │ webinar_topic   │
│ recording_type  │    │ sender_name     │    │ start_time      │
│ file_type       │    │ message_content │    │ end_time        │
│ file_size       │    │ message_timestamp│   │ attendee_count  │
│ download_url    │    │ + metadata      │    │ + metadata      │
│ + metadata      │    └─────────────────┘    └─────────────────┘
└─────────────────┘                                     │
                                                         │
                                                         ▼
┌─────────────────┐                          ┌─────────────────┐
│  Bz_Reports     │                          │ Bz_Audit_Log    │
├─────────────────┤                          ├─────────────────┤
│ report_id       │                          │ record_id       │
│ report_name     │                          │ source_table    │
│ report_type     │                          │ load_timestamp  │
│ generated_by    │                          │ processed_by    │
│ generation_time │                          │ processing_time │
│ report_period   │                          │ status          │
│ file_format     │                          │ records_processed│
│ + metadata      │                          │ batch_id        │
└─────────────────┘                          └─────────────────┘
```

### 4.1 Relationship Descriptions
- **Users to Meetings**: One-to-Many (One user can host multiple meetings)
- **Meetings to Participants**: One-to-Many (One meeting can have multiple participants)
- **Users to Participants**: One-to-Many (One user can participate in multiple meetings)
- **Meetings to Recordings**: One-to-Many (One meeting can have multiple recordings)
- **Meetings to Chat Messages**: One-to-Many (One meeting can have multiple chat messages)
- **Users to Webinars**: One-to-Many (One user can host multiple webinars)
- **Users to Reports**: One-to-Many (One user can generate multiple reports)
- **All Tables to Audit Log**: Many-to-Many (All operations are tracked in audit log)

---

## 5. API Cost Considerations

### 5.1 Zoom API Rate Limits
- **Meeting API**: 80 requests per second
- **User API**: 80 requests per second  
- **Report API**: 5 requests per second
- **Webinar API**: 80 requests per second
- **Recording API**: 80 requests per second

### 5.2 Cost Optimization Strategies
- **Incremental Loading**: Use timestamp-based incremental loads to minimize API calls
- **Batch Processing**: Group API requests to maximize efficiency within rate limits
- **Caching Strategy**: Implement caching for frequently accessed but slowly changing data
- **Selective Field Extraction**: Only extract required fields to reduce payload size
- **Error Handling**: Implement robust retry mechanisms to handle rate limit exceptions

### 5.3 Estimated Monthly API Costs
- **Small Organization** (< 1000 users): $50-100/month
- **Medium Organization** (1000-5000 users): $200-500/month
- **Large Organization** (> 5000 users): $500-1500/month

*Note: Costs vary based on data refresh frequency, historical data requirements, and specific API endpoints used.*

---

## 6. Implementation Notes

### 6.1 Data Loading Strategy
- All Bronze tables should maintain raw data structure from source systems
- Implement Change Data Capture (CDC) where possible for real-time updates
- Use batch processing for historical data loads
- Maintain data lineage through audit logging

### 6.2 Data Quality Considerations
- Implement data validation rules for critical fields
- Monitor data completeness and accuracy through audit metrics
- Establish data retention policies based on compliance requirements
- Regular data profiling to identify quality issues

### 6.3 Security and Compliance
- Encrypt PII fields at rest and in transit
- Implement role-based access controls
- Regular access audits and compliance reporting
- Data masking for non-production environments

---

*End of Bronze Layer Logical Data Model Document*