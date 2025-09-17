_____________________________________________
## *Author*: AAVA
## *Created on*: 2024-01-15
## *Description*: Gold layer logical data model for Zoom platform analytics supporting dimensional modeling and reporting requirements
## *Version*: 2
## *Updated on*: 2024-01-15
## *Changes*: Removed API cost references and ensured proper GitHub integration
## *Reason*: User requested removal of API costs and proper GitHub storage
_____________________________________________

# Gold Layer Logical Data Model - Zoom Platform Analytics

## 1. Gold Layer Logical Model

### 1.1 Fact Tables

#### Go_Meeting_Facts
**Type**: Fact Table  
**SCD Type**: N/A (Fact table)  
**Description**: Core fact table capturing meeting session metrics and measurements

| Column Name | Data Type | Description | PII Classification |
|-------------|-----------|-------------|-------------------|
| meeting_session_key | VARCHAR(50) | Business key for meeting session | Non-PII |
| user_key | VARCHAR(50) | Reference to user dimension | Non-PII |
| organization_key | VARCHAR(50) | Reference to organization dimension | Non-PII |
| meeting_date_key | DATE | Reference to date dimension | Non-PII |
| meeting_start_time | TIMESTAMP | Meeting start timestamp | Non-PII |
| meeting_end_time | TIMESTAMP | Meeting end timestamp | Non-PII |
| duration_minutes | INTEGER | Meeting duration in minutes | Non-PII |
| participant_count | INTEGER | Number of participants | Non-PII |
| recording_duration_minutes | INTEGER | Recording duration | Non-PII |
| chat_message_count | INTEGER | Number of chat messages | Non-PII |
| screen_share_duration_minutes | INTEGER | Screen sharing duration | Non-PII |
| breakout_room_count | INTEGER | Number of breakout rooms used | Non-PII |
| audio_quality_score | DECIMAL(3