_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze layer logical data model for Zoom Platform Analytics Systems in medallion architecture
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Logical Data Model - Zoom Platform Analytics Systems

## 1. PII Classification

### Direct PII Fields
| Column Name | Table | Reason for PII Classification |
|-------------|-------|------------------------------|
| email_address | Bz_User_Account | Direct identifier that can be used to contact or locate specific individuals |
| phone_number | Bz_User_Account | Direct contact identifier that can be used to reach specific individuals |
| user_display_name | Bz_User_Account | Personal identifier that directly identifies an individual |
| participant_name | Bz_Meeting_Participant | Personal identifier that directly identifies meeting participants |
| sender_name | Bz_Chat_Communication | Personal identifier that directly identifies message senders |
| presenter_name | Bz_Screen_Share_Session | Personal identifier that directly identifies content presenters |
| host_assignment | Bz_Breakout_Room | Personal identifier that directly identifies room hosts |
| account_manager_name | Bz_Organization | Personal identifier that directly identifies account managers |
| user_involved | Bz_Security_Event | Personal identifier that directly identifies users in security events |
| presenter_names | Bz_Webinar_Event | Personal identifiers that directly identify webinar presenters |
| host_name | Bz_Meeting_Session | Personal identifier that directly identifies meeting hosts |

### Quasi-PII Fields
| Column Name | Table | Reason for PII Classification |
|-------------|-------|------------------------------|
| department_name | Bz_User_Account | Can identify individuals in small departments when combined with other data |
| job_title | Bz_User_Account | Can identify individuals with unique titles within organizations |
| meeting_title | Bz_Meeting_Session | May contain personal information or identify specific individuals |
| meeting_topic | Bz_Meeting_Session | May contain personal information or identify meeting participants |
| room_topic | Bz_Breakout_Room | May contain personal information or identify room participants |
| recording_title | Bz_Recording_Asset | May contain personal information or identify specific individuals |
| event_description | Bz_Security_Event | May contain personal information in security event descriptions |

### Sensitive PII Fields
| Column Name | Table | Reason for PII Classification |
|-------------|-------|------------------------------|
| geographic_location | Bz_Meeting_Participant | Location data that can identify where individuals are located |
| billing_address | Bz_Organization | Physical address information that identifies location |
| message_content | Bz_Chat_Communication | Personal communication content that may contain sensitive information |
| profile_picture_url | Bz_User_Account | Personal image identifier that can be used to identify individuals |
| primary_contact_email | Bz_Organization | Contact information that can be used to reach specific individuals |

## 2. Bronze Layer Logical Model

### 2.1 Bz_User_Account
**Description**: Raw user account information from Zoom platform containing user profiles and account settings

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| user_display_name | VARCHAR(255) | Display name of the user as shown in Zoom interface |
| email_address | VARCHAR(320) | Primary email address for user identification and communication |
| account_status | VARCHAR(50) | Current status of the user account (active