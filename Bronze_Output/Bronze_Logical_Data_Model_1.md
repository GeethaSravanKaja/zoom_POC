_____________________________________________
## *Author*: AAVA
## *Created on*:   
## *Description*: Comprehensive Bronze Logical Data Model for Zoom Platform Analytics Systems in Medallion Architecture
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

| Column Name          | Table Name           | PII Classification | Reason                                                                 |
|----------------------|----------------------|--------------------|------------------------------------------------------------------------|
| User_Name            | Bz_Users             | PII                | Identifies an individual user by their full name, which is personally identifiable information |
| Email                | Bz_Users             | PII                | Email address is a direct personal identifier that can be used to contact and identify individuals |
| Company              | Bz_Users             | PII                | Company affiliation can reveal sensitive business relationships and personal employment information |

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Table Description:** Contains user account information from the source Users table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| User_Name         | VARCHAR(255) | The full name of the user (PII)                     |
| Email             | VARCHAR(255) | The unique email address of the user (PII)          |
| Company           | VARCHAR(255) | The company associated with the user (PII)          |
| Plan_Type         | VARCHAR(50)  | The subscription plan of the user                    |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.2 Bz_Meetings
**Table Description:** Contains meeting session information from the source Meetings table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| Meeting_Topic     | VARCHAR(255) | The name or topic of the meeting                     |
| Start_Time        | DATETIME     | The timestamp when the meeting began                 |
| End_Time          | DATETIME     | The timestamp when the meeting concluded             |
| Duration_Minutes  | INT          | The duration of the meeting in minutes               |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.3 Bz_Participants
**Table Description:** Contains meeting participant information from the source Participants table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| Join_Time         | DATETIME     | The timestamp when the participant joined the meeting|
| Leave_Time        | DATETIME     | The timestamp when the participant left the meeting  |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.4 Bz_Feature_Usage
**Table Description:** Contains feature usage tracking information from the source Feature_Usage table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| Feature_Name      | VARCHAR(100) | The name of the feature used                         |
| Usage_Count       | INT          | The number of times the feature was used during the meeting |
| Usage_Date        | DATE         | The date the feature was used                        |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.5 Bz_Webinars
**Table Description:** Contains webinar event information from the source Webinars table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| Webinar_Topic     | VARCHAR(255) | The topic or title of the webinar                    |
| Start_Time        | DATETIME     | The timestamp when the webinar began                 |
| End_Time          | DATETIME     | The timestamp when the webinar ended                 |
| Registrants       | INT          | The total number of users who registered for the webinar |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.6 Bz_Support_Tickets
**Table Description:** Contains support ticket information from the source Support_Tickets table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| Ticket_Type       | VARCHAR(100) | The category of the support issue                    |
| Resolution_Status | VARCHAR(50)  | The current status of the support ticket            |
| Open_Date         | DATE         | The date the ticket was opened                       |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.7 Bz_Licenses
**Table Description:** Contains license information from the source Licenses table, excluding primary and foreign keys

| Column Name       | Data Type    | Description                                           |
|-------------------|--------------|-------------------------------------------------------|
| License_Type      | VARCHAR(50)  | The type of license granted                          |
| Start_Date        | DATE         | The date the license became active                   |
| End_Date          | DATE         | The date the license expires                         |
| load_timestamp    | TIMESTAMP    | Timestamp when data was loaded into Bronze layer     |
| update_timestamp  | TIMESTAMP    | Timestamp when data was last updated                 |
| source_system     | VARCHAR(100) | Source system identifier                             |

### 2.8 Bz_Billing_Events
**Table Description:** Contains billing event information from the source Billing_Events table, excluding primary and foreign keys

| Column Name       | Data Type       | Description                                        |
|-------------------|-----------------|----------------------------------------------------|
| Event_Type        | VARCHAR(100)    | The type of billing event                         |
| Amount            | DECIMAL(10, 2)  | The monetary value of the billing event          |
| Event_Date        | DATE            | The date the billing event occurred              |
| load_timestamp    | TIMESTAMP       | Timestamp when data was loaded into Bronze layer  |
| update_timestamp  | TIMESTAMP       | Timestamp when data was last updated              |
| source_system     | VARCHAR(100)    | Source system identifier                          |

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Table Description:** Tracks data ingestion and processing activities for all Bronze layer tables

| Column Name     | Data Type    | Description                                              |
|-----------------|--------------|----------------------------------------------------------|
| record_id       | VARCHAR(50)  | Unique identifier for the audit record                   |
| source_table    | VARCHAR(100) | Name of the source table from which data was loaded     |
| load_timestamp  | TIMESTAMP    | Timestamp when the record was loaded                     |
| processed_by    | VARCHAR(100) | Identifier of the process or user who processed the record |
| processing_time | INT          | Time taken to process the record in seconds             |
| status          | VARCHAR(50)  | Status of the processing (success, failure, warning)    |

## 4. Conceptual Data Model Diagram

**Block Diagram Format - Table Relationships:**

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Users      │    │  Bz_Meetings    │    │ Bz_Webinars     │
│                 │    │                 │    │                 │
│ • User_Name     │    │ • Meeting_Topic │    │ • Webinar_Topic │
│ • Email         │    │ • Start_Time    │    │ • Start_Time    │
│ • Company       │    │ • End_Time      │    │ • End_Time      │
│ • Plan_Type     │    │ • Duration_Min  │    │ • Registrants   │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         │              ┌─────────────────┐              │
         └──────────────│ Bz_Participants │──────────────┘
                        │                 │
                        │ • Join_Time     │
                        │ • Leave_Time    │
                        └─────────────────┘
                                 │
                                 │
                        ┌─────────────────┐
                        │Bz_Feature_Usage │
                        │                 │
                        │ • Feature_Name  │
                        │ • Usage_Count   │
                        │ • Usage_Date    │
                        └─────────────────┘

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│Bz_Support_Tickets│    │  Bz_Licenses    │    │Bz_Billing_Events│
│                 │    │                 │    │                 │
│ • Ticket_Type   │    │ • License_Type  │    │ • Event_Type    │
│ • Resolution_St │    │ • Start_Date    │    │ • Amount        │
│ • Open_Date     │    │ • End_Date      │    │ • Event_Date    │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         └───────────────────────┼───────────────────────┘
                                 │
                        ┌─────────────────┐
                        │  Bz_Audit_Log   │
                        │                 │
                        │ • record_id     │
                        │ • source_table  │
                        │ • load_timestamp│
                        │ • processed_by  │
                        │ • processing_time│
                        │ • status        │
                        └─────────────────┘
```

**Key Field Relationships:**
- Bz_Users connects to Bz_Meetings via User_Name/Email (originally Host_ID)
- Bz_Users connects to Bz_Webinars via User_Name/Email (originally Host_ID)
- Bz_Users connects to Bz_Participants via User_Name/Email (originally User_ID)
- Bz_Meetings connects to Bz_Participants via Meeting_Topic (originally Meeting_ID)
- Bz_Meetings connects to Bz_Feature_Usage via Meeting_Topic (originally Meeting_ID)
- Bz_Users connects to Bz_Support_Tickets via User_Name/Email (originally User_ID)
- Bz_Users connects to Bz_Licenses via User_Name/Email (originally Assigned_To_User_ID)
- Bz_Users connects to Bz_Billing_Events via User_Name/Email (originally User_ID)
- Bz_Audit_Log monitors all Bronze layer tables via source_table field

**Note:** Primary and foreign key fields have been removed as per Bronze layer requirements. Relationships are maintained through business key fields and can be reconstructed in Silver layer processing.