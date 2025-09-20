_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Comprehensive Bronze Layer Logical Data Model for Zoom Platform Analytics Systems integrating conceptual entities and source data structures
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

| Column Name       | Reason for PII Classification                                  |
|-------------------|----------------------------------------------------------------|
| User_Name         | Personal name of the user - directly identifies an individual |
| Email             | Email address is personally identifiable information that can be used to contact and identify individuals |
| Company           | May reveal employer or organizational affiliation which can be used to identify individuals |
| Host_ID           | Refers to a user hosting meetings/webinars - indirect identifier linking to personal data |
| Participant_ID    | Identifies individual participants in meetings - indirect identifier linking to personal data |
| User_ID           | Unique identifier for users that can be linked to individuals - direct identifier |
| Assigned_To_User_ID| Links license to a specific user - indirect identifier linking to personal data |
| Ticket_ID         | Identifies support tickets linked to users - indirect identifier that can reveal user issues |
| Event_ID          | Billing event linked to user - indirect identifier that can reveal financial information |

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Description:** Bronze layer table containing user account information from the source Users table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| User_Name         | Full name of the user               | VARCHAR(255)       |
| Email             | User email address                  | VARCHAR(255)       |
| Company           | Company or organization name        | VARCHAR(255)       |
| Plan_Type         | Subscription plan type              | VARCHAR(50)        |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.2 Bz_Meetings
**Description:** Bronze layer table containing meeting session information from the source Meetings table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Meeting_Topic     | Topic or title of the meeting       | VARCHAR(255)       |
| Start_Time        | Meeting start timestamp             | DATETIME           |
| End_Time          | Meeting end timestamp               | DATETIME           |
| Duration_Minutes  | Duration of meeting in minutes      | INT                |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.3 Bz_Participants
**Description:** Bronze layer table containing meeting participant information from the source Participants table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Join_Time         | Timestamp when participant joined meeting | DATETIME      |
| Leave_Time        | Timestamp when participant left meeting | DATETIME       |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.4 Bz_Feature_Usage
**Description:** Bronze layer table containing feature usage information from the source Feature_Usage table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Feature_Name      | Name of the feature used            | VARCHAR(100)       |
| Usage_Count       | Number of times feature was used    | INT                |
| Usage_Date        | Date of feature usage               | DATE               |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.5 Bz_Webinars
**Description:** Bronze layer table containing webinar event information from the source Webinars table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Webinar_Topic     | Topic or title of the webinar       | VARCHAR(255)       |
| Start_Time        | Webinar start timestamp             | DATETIME           |
| End_Time          | Webinar end timestamp               | DATETIME           |
| Registrants       | Number of registrants               | INT                |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.6 Bz_Support_Tickets
**Description:** Bronze layer table containing support ticket information from the source Support_Tickets table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Ticket_Type       | Type/category of support ticket     | VARCHAR(100)       |
| Resolution_Status | Status of ticket resolution         | VARCHAR(50)        |
| Open_Date         | Date ticket was opened              | DATE               |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.7 Bz_Licenses
**Description:** Bronze layer table containing license information from the source Licenses table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| License_Type      | Type of license                     | VARCHAR(50)        |
| Start_Date        | License start date                  | DATE               |
| End_Date          | License end date                    | DATE               |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

### 2.8 Bz_Billing_Events
**Description:** Bronze layer table containing billing event information from the source Billing_Events table

| Column Name       | Description                          | Data Type          |
|-------------------|------------------------------------|--------------------|  
| Event_Type        | Type of billing event               | VARCHAR(100)       |
| Amount            | Monetary amount of event            | DECIMAL(10,2)      |
| Event_Date        | Date of billing event               | DATE               |
| load_timestamp    | Timestamp when record was loaded into Bronze layer | TIMESTAMP |
| update_timestamp  | Timestamp when record was last updated in Bronze layer | TIMESTAMP |
| source_system     | Source system identifier (Zoom Platform) | VARCHAR(100) |

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Description:** Audit table to track data processing and changes across all Bronze layer tables

| Field Name       | Description                                      | Data Type          |
|------------------|------------------------------------------------|--------------------|  
| record_id        | Unique identifier for audit record              | VARCHAR(50)        |
| source_table     | Name of the source Bronze table                 | VARCHAR(100)       |
| load_timestamp   | Timestamp when the record was loaded            | TIMESTAMP          |
| processed_by     | Identifier of the process or user processing data| VARCHAR(100)      |
| processing_time  | Duration taken to process the record (milliseconds) | INT           |
| status           | Processing status (SUCCESS, FAILED, PENDING)   | VARCHAR(50)        |

## 4. Conceptual Data Model Diagram

**Block Diagram Format - Table Relationships:**

```
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│   Bz_Users      │◄──────┤ Bz_Participants │──────►│   Bz_Meetings   │
│ (User details)  │       │ (Meeting users) │       │(Meeting sessions)│
└─────────────────┘       └─────────────────┘       └─────────────────┘
         ▲                          ▲                          ▲
         │                          │                          │
         │                          │                          │
┌─────────────────┐       ┌─────────────────┐       ┌─────────────────┐
│Bz_Support_Tickets│       │ Bz_Feature_Usage│       │   Bz_Webinars   │
│ (User tickets)  │       │(Meeting features)│       │(Webinar events) │
└─────────────────┘       └─────────────────┘       └─────────────────┘
         ▲                                                     ▲
         │                                                     │
┌─────────────────┐                                 ┌─────────────────┐
│   Bz_Licenses   │                                 │ Bz_Billing_Events│
│ (User licenses) │                                 │ (User billing)  │
└─────────────────┘                                 └─────────────────┘
```

**Key Relationships:**
- Bz_Users connects to Bz_Participants via User_ID (One-to-Many)
- Bz_Meetings connects to Bz_Participants via Meeting_ID (One-to-Many)  
- Bz_Users connects to Bz_Support_Tickets via User_ID (One-to-Many)
- Bz_Users connects to Bz_Licenses via Assigned_To_User_ID (One-to-Many)
- Bz_Users connects to Bz_Billing_Events via User_ID (One-to-Many)
- Bz_Users connects to Bz_Webinars via Host_ID (One-to-Many)
- Bz_Meetings connects to Bz_Feature_Usage via Meeting_ID (One-to-Many)

**Design Rationale:**
1. **Raw Data Preservation:** Bronze layer mirrors source data structure exactly to maintain data fidelity
2. **Metadata Addition:** Standard metadata columns added for data lineage and audit purposes
3. **PII Classification:** Sensitive data identified for compliance and governance requirements
4. **Naming Convention:** Consistent 'Bz_' prefix clearly identifies Bronze layer tables
5. **No Constraints:** Primary and foreign key constraints removed to allow flexible data ingestion
6. **Audit Trail:** Comprehensive audit table design enables tracking of all data processing activities