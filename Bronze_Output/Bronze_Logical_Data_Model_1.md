_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Bronze Layer Logical Data Model for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. PII Classification

### 1.1 High Risk PII Fields
- **email_address**: Direct personal identifier used for communication
- **phone_number**: Direct personal contact information
- **full_name**: Direct personal identifier
- **ip_address**: Can be used to identify location and individual
- **device_id**: Unique device identifier that can track individual usage
- **message_content**: May contain sensitive personal or business information

### 1.2 Medium Risk PII Fields
- **user_id**: Internal identifier that can be linked to personal data
- **participant_name**: Display name that may contain personal information
- **organization_name**: May reveal employment information
- **meeting_topic**: May contain sensitive business or personal information
- **event_description**: May contain personal or sensitive information
- **geolocation**: Location-based personal information

### 1.3 Low Risk PII Fields
- **timezone**: General location indicator
- **language_preference**: Personal preference data
- **role**: Job function information

## 2. Bronze Layer Logical Model

### 2.1 Bz_User_Account
**Description**: Raw user account data from Zoom platform

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| user_id | VARCHAR(50) | Unique user identifier | Medium |
| email_address | VARCHAR(255) | User email address | High |
| full_name | VARCHAR(100) | User full name | High |
| display_name | VARCHAR(100) | User display name | Medium |
| phone_number | VARCHAR(20) | User phone number | High |
| timezone | VARCHAR(50) | User timezone | Low |
| language_preference | VARCHAR(10) | User language setting | Low |
| account_type | VARCHAR(20) | Type of account (basic