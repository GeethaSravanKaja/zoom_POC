_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Comprehensive Silver layer logical data model for Zoom platform analytics with standardized data types and quality controls
## *Version*: 1
## *Updated on*: 
_____________________________________________

# Silver Layer Logical Data Model for Zoom Platform Analytics Systems

## 1. Silver Layer Logical Model

### 1.1 Core Business Entities

#### Si_Users
**Description:** Standardized user profile and demographic information

1. **user_name** - VARCHAR(255) - Full display name of the user
2. **email_address** - VARCHAR(320) - Primary email address for user identification
3. **user_type** - VARCHAR(50) - Classification of user role (basic