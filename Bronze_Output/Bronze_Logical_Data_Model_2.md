_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Logical Data Model for Zoom Platform Analytics Systems supporting comprehensive data ingestion and processing
## *Version*: 2
## *Changes*: Comprehensive rewrite covering all 16 source tables with complete field mappings
## *Reason*: User requested complete coverage of all tables specified in source data structure
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

### 1.1 High Risk PII Fields
| Field Name | Table | Classification Reason |
|------------|-------|----------------------|
| user_email | Bz_User_Account | Direct personal identifier - email addresses can uniquely identify individuals |
| user_name | Bz_User_Account | Personal name information that can identify specific individuals |
| phone_number | Bz_User_Account | Direct contact information that can be used to identify and contact individuals |
| profile_picture_url | Bz_User_Account | Biometric-adjacent data that could be used for facial recognition |
| participant_name | Bz_Meeting_Participant | Personal name information of meeting attendees |
| participant_email | Bz_Meeting_Participant | Direct personal identifier for meeting participants |
| chat_sender_name | Bz_Chat_Communication | Personal identifier in chat communications |
| chat_content | Bz_Chat_Communication | May contain personal information