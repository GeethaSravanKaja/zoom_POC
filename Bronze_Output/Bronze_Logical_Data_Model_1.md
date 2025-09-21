_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Logical Data Model for Zoom Platform Analytics Systems supporting medallion architecture implementation
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

### 1.1 Identified PII Fields

| Table Name | Column Name | PII Classification | Reason for PII Classification |
|------------|-------------|-------------------|------------------------------|
| Bz_Users | User_Name | **High Sensitivity PII** | Contains full personal names that can directly identify individuals |
| Bz_Users | Email | **High Sensitivity PII** | Email addresses are unique personal identifiers that can be used to contact and identify individuals |
| Bz_Users | Company | **Medium Sensitivity PII** | Company affiliation can be used in combination with other data to identify individuals |
| Bz_Meetings | Meeting_Topic | **Low Sensitivity PII** | May contain sensitive business information or personal references |
| Bz_Support_Tickets | Ticket_Type | **Low Sensitivity PII** | May reveal personal technical issues or business-sensitive information |
| Bz_Webinars | Webinar_Topic | **Low Sensitivity PII** | May contain business-sensitive or personal information |

## 2. Bronze Layer Logical Model

### 2.1 Bz_Users
**Description**: Bronze layer table containing user account information mirrored from source Users table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| User_Name | VARCHAR(255) | The full name of the user account holder |
| Email | VARCHAR(255) | The unique email address associated with the user account |
| Company | VARCHAR(255) | The company or organization associated with the user |
| Plan_Type | VARCHAR(50) | The subscription plan type (Free, Pro, Business, Enterprise) |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.2 Bz_Meetings
**Description**: Bronze layer table containing meeting session information mirrored from source Meetings table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Meeting_Topic | VARCHAR(255) | The name or topic of the meeting session |
| Start_Time | DATETIME | The timestamp when the meeting began |
| End_Time | DATETIME | The timestamp when the meeting concluded |
| Duration_Minutes | INT | The duration of the meeting in minutes |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.3 Bz_Participants
**Description**: Bronze layer table containing meeting participant information mirrored from source Participants table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Join_Time | DATETIME | The timestamp when the participant joined the meeting |
| Leave_Time | DATETIME | The timestamp when the participant left the meeting |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.4 Bz_Feature_Usage
**Description**: Bronze layer table containing feature usage information mirrored from source Feature_Usage table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Feature_Name | VARCHAR(100) | The name of the feature used (Screen Sharing, Chat, Recording, etc.) |
| Usage_Count | INT | The number of times the feature was used during the meeting |
| Usage_Date | DATE | The date the feature was used |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.5 Bz_Webinars
**Description**: Bronze layer table containing webinar information mirrored from source Webinars table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Webinar_Topic | VARCHAR(255) | The topic or title of the webinar |
| Start_Time | DATETIME | The timestamp when the webinar began |
| End_Time | DATETIME | The timestamp when the webinar ended |
| Registrants | INT | The total number of users who registered for the webinar |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.6 Bz_Support_Tickets
**Description**: Bronze layer table containing support ticket information mirrored from source Support_Tickets table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Ticket_Type | VARCHAR(100) | The category of the support issue (Audio Issue, Video Issue, etc.) |
| Resolution_Status | VARCHAR(50) | The current status of the support ticket (Open, In Progress, etc.) |
| Open_Date | DATE | The date the ticket was opened |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.7 Bz_Licenses
**Description**: Bronze layer table containing license information mirrored from source Licenses table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| License_Type | VARCHAR(50) | The type of license granted (Pro, Business, Enterprise, Education) |
| Start_Date | DATE | The date the license became active |
| End_Date | DATE | The date the license expires |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

### 2.8 Bz_Billing_Events
**Description**: Bronze layer table containing billing event information mirrored from source Billing_Events table

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| Event_Type | VARCHAR(100) | The type of billing event (Subscription Fee, Renewal, etc.) |
| Amount | DECIMAL(10, 2) | The monetary value of the billing event |
| Event_Date | DATE | The date the billing event occurred |
| load_timestamp | TIMESTAMP | Timestamp when the record was loaded into the bronze layer |
| update_timestamp | TIMESTAMP | Timestamp when the record was last updated |
| source_system | VARCHAR(100) | Source system identifier (e.g., 'Zoom_Platform') |

## 3. Audit Table Design

### 3.1 Bz_Audit_Log
**Description**: Audit table to track data processing activities across all bronze layer tables

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| record_id | VARCHAR(100) | Unique identifier for the audit record |
| source_table | VARCHAR(100) | Name of the source table being processed |
| load_timestamp | TIMESTAMP | Timestamp when the data load process began |
| processed_by | VARCHAR(100) | Identifier of the process or user that performed the operation |
| processing_time | INT | Duration of the processing operation in seconds |
| status | VARCHAR(50) | Status of the processing operation (SUCCESS, FAILED, IN_PROGRESS) |

## 4. Conceptual Data Model Diagram

### 4.1 Table Relationships in Block Diagram Format

```
┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Users      │    │   Bz_Meetings   │    │ Bz_Participants │
│                 │    │                 │    │                 │
│ • User_Name     │────│ • Meeting_Topic │────│ • Join_Time     │
│ • Email         │    │ • Start_Time    │    │ • Leave_Time    │
│ • Company       │    │ • End_Time      │    │                 │
│ • Plan_Type     │    │ • Duration_Min  │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       
         │                       │                       
         │              ┌─────────────────┐              
         │              │ Bz_Feature_Usage│              
         │              │                 │              
         └──────────────│ • Feature_Name  │              
                        │ • Usage_Count   │              
                        │ • Usage_Date    │              
                        └─────────────────┘              

┌─────────────────┐    ┌─────────────────┐    ┌─────────────────┐
│   Bz_Webinars   │    │ Bz_Support_Tick │    │   Bz_Licenses   │
│                 │    │                 │    │                 │
│ • Webinar_Topic │    │ • Ticket_Type   │    │ • License_Type  │
│ • Start_Time    │    │ • Resolution_St │    │ • Start_Date    │
│ • End_Time      │    │ • Open_Date     │    │ • End_Date      │
│ • Registrants   │    │                 │    │                 │
└─────────────────┘    └─────────────────┘    └─────────────────┘
         │                       │                       │
         │                       │                       │
         │              ┌─────────────────┐              │
         │              │ Bz_Billing_Evnt │              │
         │              │                 │              │
         └──────────────│ • Event_Type    │──────────────┘
                        │ • Amount        │              
                        │ • Event_Date    │              
                        └─────────────────┘              
```

### 4.2 Relationship Descriptions

| Parent Table | Child Table | Connection Logic | Key Field Concept |
|--------------|-------------|------------------|-------------------|
| Bz_Users | Bz_Meetings | Users host meetings | User identity linking |
| Bz_Meetings | Bz_Participants | Meetings contain participants | Meeting session linking |
| Bz_Meetings | Bz_Feature_Usage | Features used in meetings | Meeting session linking |
| Bz_Users | Bz_Webinars | Users host webinars | User identity linking |
| Bz_Users | Bz_Support_Tickets | Users create support tickets | User identity linking |
| Bz_Users | Bz_Licenses | Licenses assigned to users | User identity linking |
| Bz_Users | Bz_Billing_Events | Billing events associated with users | User identity linking |

**Note**: In the Bronze layer, actual foreign key relationships are not enforced as this layer focuses on raw data ingestion. The relationships shown represent logical connections that will be established in Silver and Gold layers of the medallion architecture.