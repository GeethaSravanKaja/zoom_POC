_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Comprehensive Silver layer logical data model for Zoom platform analytics with standardized data types and quality controls
## *Version*: 2
## *Updated on*: 
## *Changes*: Added/clarified table and column descriptions, ensured all data types are present, updated conceptual data model diagram to block format, and improved markdown formatting with numbered bullet marks.
## *Reason*: Requested update to improve clarity and completeness per user instructions.
_____________________________________________

# Silver Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. Silver Layer Logical Model

### 1.1 Core Business Entities

#### Si_Users
**Description:** Standardized user profile and demographic information

1. **user_name** - VARCHAR(255) - Full display name of the user
2. **email_address** - VARCHAR(320) - Primary email address for user identification
3. **user_type** - VARCHAR(50) - Classification of user role (basic, licensed, admin)
4. **account_status** - VARCHAR(20) - Status of user account (active, inactive, suspended)
5. **created_date** - DATE - Date when the user account was created

#### Si_Meetings
**Description:** Standardized meeting details and attributes

1. **meeting_topic** - VARCHAR(255) - Title or subject of the meeting
2. **start_time** - DATETIME - Scheduled start time of the meeting
3. **end_time** - DATETIME - Scheduled end time of the meeting
4. **duration_minutes** - INT - Total duration of the meeting in minutes
5. **host_email** - VARCHAR(320) - Email address of the meeting host
6. **meeting_type** - VARCHAR(50) - Type of meeting (scheduled, recurring, webinar)

#### Si_Participants
**Description:** Standardized participant details for meetings

1. **participant_name** - VARCHAR(255) - Full name of the participant
2. **participant_email** - VARCHAR(320) - Email address of the participant
3. **join_time** - DATETIME - Time when participant joined the meeting
4. **leave_time** - DATETIME - Time when participant left the meeting
5. **duration_minutes** - INT - Duration participant was in the meeting

#### Si_Error_Audit
**Description:** Data structure for error data from data quality checks and process audit data from pipeline execution

1. **error_type** - VARCHAR(100) - Type of error encountered
2. **error_description** - VARCHAR(255) - Detailed description of the error
3. **audit_event** - VARCHAR(100) - Type of audit event (validation, process)
4. **event_timestamp** - DATETIME - Timestamp of the audit event
5. **related_table** - VARCHAR(100) - Table related to the error or audit event

---

## 2. Conceptual Data Model Diagram (Block Format)

```
+-------------+         +---------------+         +------------------+
| Si_Users    |         | Si_Meetings   |         | Si_Participants  |
+-------------+         +---------------+         +------------------+
| user_name   |         | meeting_topic |         | participant_name |
| email_addr  |         | start_time    |         | participant_email|
| ...         |         | ...           |         | ...              |
+-------------+         +---------------+         +------------------+
      |                        |                          |
      |                        |                          |
      +------------------------+--------------------------+
                               |
                         +-------------------+
                         | Si_Error_Audit    |
                         +-------------------+
                         | error_type        |
                         | error_description |
                         | audit_event       |
                         | event_timestamp   |
                         | related_table     |
                         +-------------------+
```

**Relationships:**
1. Si_Users connects to Si_Meetings via host_email (host_email in Si_Meetings matches email_address in Si_Users)
2. Si_Meetings connects to Si_Participants via meeting_topic (or meeting_id if present in Bronze, but omitted here per rules)
3. Si_Error_Audit can reference any table by related_table field

---

## 3. Additional Notes
1. All primary key, foreign key, unique identifiers, and ID fields have been omitted per Silver layer rules.
2. Data types have been standardized for consistency across tables.
3. Table names use the 'Si_' prefix for Silver layer consistency.
4. Error and audit data are consolidated in Si_Error_Audit for centralized monitoring.
