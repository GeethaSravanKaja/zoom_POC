_____________________________________________
## *Author*: AAVA
## *Created on*:   
## *Description*: Bronze Layer Logical Data Model for Zoom Platform Analytics Systems supporting comprehensive data ingestion and processing
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Bronze Layer Logical Data Model - Zoom Platform Analytics Systems

## 1. PII Classification

### Direct PII (High Risk)
**Reason**: These fields directly identify individuals and pose high privacy risk if exposed

- **User Display Name** - Direct personal identifier that can be used to identify individuals
- **Email Address** - Unique personal identifier with high identification potential
- **Profile Picture URL** - Biometric identifier that can reveal personal appearance
- **Phone Number** - Direct contact information that identifies individuals
- **Primary Contact Email** - Personal identifier for organizational contacts
- **Billing Address** - Physical location data that identifies individuals/organizations
- **Account Manager Name** - Personal identifier of staff members
- **Host Name** - Direct identifier of meeting organizers
- **Presenter Names** - Direct identifiers of webinar presenters
- **Participant Name** - Direct identifier of meeting attendees
- **Message Content** - Personal communication content that may contain sensitive information
- **Sender Name** - Direct identifier of message senders
- **User Involved** - Direct identifier in security events

### Quasi-PII (Medium Risk)
**Reason**: These fields can be combined with other data to identify individuals or reveal personal patterns

- **Department Name** - Organizational data that can narrow identification scope
- **Job Title** - Professional data that combined with other fields can identify individuals
- **Time Zone** - Location indicator that can reveal geographic patterns
- **Language Preference** - Personal preference that can indicate cultural/geographic background
- **Geographic Location** - Location data that can reveal personal patterns
- **Meeting Title** - Content data that may reveal business or personal information
- **Meeting Topic** - Content data that may contain sensitive business information
- **Webinar Title** - Content data that may reveal organizational activities
- **Event Description** - Content data that may contain sensitive information
- **Recording Title** - Content data that may reveal meeting purposes
- **Application Name** - Usage data that may reveal work patterns or sensitive applications
- **Room Topic** - Content data that may contain sensitive discussion topics

## 2. Bronze Layer Logical Model

### 2.1 Bz_User_Account
**Description**: Raw user account data from Zoom platform capturing individual user profiles and settings

| Column Name | Data Type | Description |
|-------------|-----------|-------------|
| user_display_name | VARCHAR(255) | Display name of the user as shown in Zoom interface |
| email_address | VARCHAR(320) | Primary email address for user identification and communication |
| account_status | VARCHAR(50) | Current status indicating active