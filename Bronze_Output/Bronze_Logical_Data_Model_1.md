_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze layer logical data model for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

| Column Name | Reason for PII Classification                          |
|-------------|-------------------------------------------------------|
| User_Name   | Contains personal names that can identify individuals directly |
| Email       | Contains personal email addresses which are unique identifiers and can be used to contact individuals |
| Company     | May reveal employer or organizational affiliation which can be used to identify individuals in specific contexts |

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Description**: Contains user account information from the Zoom platform

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| User_Name        | VARCHAR(255) | Full name of the user as displayed in the platform |
| Email            | VARCHAR(255) | Primary email address for user identification and communication |
| Company          | VARCHAR(255) | Company or organization the user is affiliated with  |
| Plan_Type        | VARCHAR(50) | Subscription plan type of the user (Free, Pro, Business, Enterprise) |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.2 Bz_Meetings
**Description**: Contains meeting session information and details

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Meeting_Topic    | VARCHAR(255) | Topic or subject of the meeting                    |
| Start_Time       | DATETIME | Start time of the meeting                             |
| End_Time         | DATETIME | End time of the meeting                               |
| Duration_Minutes | INT | Duration of the meeting in minutes                    |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.3 Bz_Participants
**Description**: Contains participant information for meeting attendance

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Join_Time        | DATETIME | Time participant joined the meeting                   |
| Leave_Time       | DATETIME | Time participant left the meeting                     |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.4 Bz_Feature_Usage
**Description**: Contains information about feature utilization during meetings

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Feature_Name     | VARCHAR(100) | Name of the feature used (Screen Sharing, Chat, Recording, etc.) |
| Usage_Count      | INT | Number of times the feature was used                  |
| Usage_Date       | DATE | Date when the feature usage was recorded              |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.5 Bz_Webinars
**Description**: Contains webinar event information and registration details

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Webinar_Topic    | VARCHAR(255) | Topic or subject of the webinar                    |
| Start_Time       | DATETIME | Start time of the webinar                             |
| End_Time         | DATETIME | End time of the webinar                               |
| Registrants      | INT | Number of registrants for the webinar                 |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.6 Bz_Support_Tickets
**Description**: Contains support ticket information and resolution tracking

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Ticket_Type      | VARCHAR(100) | Type or category of the support ticket (Audio Issue, Video Issue, etc.) |
| Resolution_Status| VARCHAR(50) | Status of ticket resolution (Open, In Progress, Closed, etc.) |
| Open_Date        | DATE | Date when the ticket was opened                       |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.7 Bz_Licenses
**Description**: Contains license assignment and management information

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| License_Type     | VARCHAR(50) | Type of license assigned (Pro, Business, Enterprise, Education) |
| Start_Date       | DATE | License start date                                    |
| End_Date         | DATE | License end date                                      |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

### 2.8 Bz_Billing_Events
**Description**: Contains billing transaction and financial event information

| Column Name      | Data Type | Business Description                                  |
|------------------|-----------|-------------------------------------------------------|
| Event_Type       | VARCHAR(100) | Type of billing event (Subscription Fee, Renewal, etc.) |
| Amount           | DECIMAL(10,2) | Amount associated with the billing event          |
| Event_Date       | DATE | Date when the billing event occurred                  |
| load_timestamp   | TIMESTAMP | Timestamp when the record was loaded into Bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated           |
| source_system    | VARCHAR(50) | Source system from which data was ingested (Zoom)    |

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Description**: Tracks data processing and loading activities across all Bronze layer tables

| Field           | Data Type | Description                                         |
|-----------------|-----------|-----------------------------------------------------|
| record_id       | VARCHAR(50) | Unique identifier for the audit record            |
| source_table    | VARCHAR(100) | Name of the source table being audited           |
| load_timestamp  | TIMESTAMP | Timestamp when the data was loaded                 |
| processed_by    | VARCHAR(100) | Identifier of the process or user who processed data |
| processing_time | INT | Time taken to process the record (in seconds)       |
| status          | VARCHAR(50) | Status of the processing (success, failure, warning) |

## 4. Conceptual Data Model Diagram

### 4.1 Block Diagram Format

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Users      │    │  Bz_Meetings    │    │  Bz_Webinars    │
│                 │    │                 │    │                 │
│ • User_Name     │    │ • Meeting_Topic │    │ • Webinar_Topic │
│ • Email         │    │ • Start_Time    │    │ • Start_Time    │
│ • Company       │    │ • End_Time      │    │ • End_Time      │
│ • Plan_Type     │    │ • Duration_Min  │    │ • Registrants   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         │              ┌─────────────────┐              │
         │              │ Bz_Participants │              │
         │              │                 │              │
         │              │ • Join_Time     │              │
         │              │ • Leave_Time    │              │
         │              └─────────────────┘              │
         │                       │                       │
         │              ┌─────────────────┐              │
         │              │ Bz_Feature_Usage│              │
         │              │                 │              │
         │              │ • Feature_Name  │              │
         │              │ • Usage_Count   │              │
         │              │ • Usage_Date    │              │
         │              └─────────────────┘              │
         │                                                │
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│Bz_Support_Tickets│    │  Bz_Licenses    │    │Bz_Billing_Events│
│                 │    │                 │    │                 │
│ • Ticket_Type   │    │ • License_Type  │    │ • Event_Type    │
│ • Resolution_St │    │ • Start_Date    │    │ • Amount        │
│ • Open_Date     │    │ • End_Date      │    │ • Event_Date    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
```

### 4.2 Table Relationships

**Note**: In the Bronze layer, primary and foreign key relationships are not maintained as per medallion architecture principles. However, the logical relationships from the source system are:

1. **Bz_Users** connects to **Bz_Meetings** via Host relationship
2. **Bz_Users** connects to **Bz_Webinars** via Host relationship  
3. **Bz_Meetings** connects to **Bz_Participants** via Meeting participation
4. **Bz_Users** connects to **Bz_Participants** via User participation
5. **Bz_Meetings** connects to **Bz_Feature_Usage** via Meeting feature utilization
6. **Bz_Users** connects to **Bz_Support_Tickets** via User support requests
7. **Bz_Users** connects to **Bz_Licenses** via License assignment
8. **Bz_Users** connects to **Bz_Billing_Events** via User billing activities

These relationships are maintained through data lineage and processing logic rather than enforced constraints in the Bronze layer.