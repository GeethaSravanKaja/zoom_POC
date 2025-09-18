_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Gold layer Dimension table transformation recommendations for Zoom Platform Analytics Systems
## *Version*: 1 
## *Updated on*: 
_____________________________________________

# Gold Layer Dimension Table Transformation Recommendations

## 1. Transformation Rules for Go_User_Dimension

### 1.1 User Identity Standardization
- **Rationale**: Ensure consistent user identification and email format standardization across the platform
- **SQL Example**:
```sql
SELECT 
    CONCAT('USER_', LPAD(ROW_NUMBER() OVER (ORDER BY user_id), 10, '0')) AS user_dim_id,
    user_id,
    TRIM(UPPER(user_name)) AS user_name,
    LOWER(TRIM(email)) AS email_address,
    CASE 
        WHEN plan_type IN ('Free', 'Basic') THEN 'BASIC_USER'
        WHEN plan_type IN ('Pro', 'Professional') THEN 'PROFESSIONAL_USER'
        WHEN plan_type IN ('Business', 'Enterprise') THEN 'ENTERPRISE_USER'
        ELSE 'UNKNOWN_USER'
    END AS user_type,
    'ACTIVE' AS account_status,
    plan_type AS license_type
FROM Silver.sv_users
WHERE email IS NOT NULL AND email LIKE '%@%'
```

### 1.2 User Profile Enhancement
- **Rationale**: Derive additional user attributes from existing data and apply business rules for user categorization
- **SQL Example**:
```sql
SELECT 
    user_dim_id,
    user_id,
    user_name,
    email_address,
    user_type,
    account_status,
    license_type,
    COALESCE(UPPER(TRIM(company)), 'UNKNOWN') AS department_name,
    CASE 
        WHEN plan_type = 'Enterprise' THEN 'ADMINISTRATOR'
        WHEN plan_type = 'Business' THEN 'MANAGER'
        ELSE 'USER'
    END AS job_title,
    'UTC' AS time_zone,
    CURRENT_DATE() AS account_creation_date,
    NULL AS last_login_date,
    'EN' AS language_preference,
    NULL AS phone_number
FROM transformed_users
```

### 1.3 Data Quality Validation for Users
- **Rationale**: Implement data quality checks to ensure user dimension integrity
- **SQL Example**:
```sql
SELECT *
FROM Go_User_Dimension
WHERE email_address REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
  AND user_name IS NOT NULL
  AND LENGTH(user_name) > 0
  AND user_type IN ('BASIC_USER', 'PROFESSIONAL_USER', 'ENTERPRISE_USER')
```

## 2. Transformation Rules for Go_Organization_Dimension

### 2.1 Organization Hierarchy Creation
- **Rationale**: Create organizational structure from user company information and establish hierarchy levels
- **SQL Example**:
```sql
SELECT 
    CONCAT('ORG_', LPAD(ROW_NUMBER() OVER (ORDER BY company), 8, '0')) AS organization_dim_id,
    MD5(UPPER(TRIM(company))) AS organization_id,
    UPPER(TRIM(company)) AS organization_name,
    CASE 
        WHEN UPPER(company) LIKE '%TECH%' OR UPPER(company) LIKE '%SOFTWARE%' THEN 'TECHNOLOGY'
        WHEN UPPER(company) LIKE '%FINANCE%' OR UPPER(company) LIKE '%BANK%' THEN 'FINANCIAL_SERVICES'
        WHEN UPPER(company) LIKE '%HEALTH%' OR UPPER(company) LIKE '%MEDICAL%' THEN 'HEALTHCARE'
        WHEN UPPER(company) LIKE '%EDU%' OR UPPER(company) LIKE '%SCHOOL%' THEN 'EDUCATION'
        ELSE 'OTHER'
    END AS industry_classification,
    CASE 
        WHEN user_count <= 10 THEN 'SMALL'
        WHEN user_count <= 100 THEN 'MEDIUM'
        WHEN user_count <= 1000 THEN 'LARGE'
        ELSE 'ENTERPRISE'
    END AS organization_size
FROM (
    SELECT 
        company,
        COUNT(DISTINCT user_id) as user_count
    FROM Silver.sv_users 
    WHERE company IS NOT NULL
    GROUP BY company
) org_stats
```

### 2.2 Organization Contact and Contract Information
- **Rationale**: Establish primary contact and contract details for organizational management
- **SQL Example**:
```sql
SELECT 
    organization_dim_id,
    organization_id,
    organization_name,
    industry_classification,
    organization_size,
    first_user_email AS primary_contact_email,
    'UNKNOWN' AS billing_address,
    'SYSTEM_ASSIGNED' AS account_manager_name,
    MIN(load_date) AS contract_start_date,
    DATE_ADD(MIN(load_date), INTERVAL 1 YEAR) AS contract_end_date,
    CASE organization_size
        WHEN 'SMALL' THEN 25
        WHEN 'MEDIUM' THEN 100
        WHEN 'LARGE' THEN 500
        ELSE 1000
    END AS maximum_user_limit,
    CASE organization_size
        WHEN 'SMALL' THEN 100
        WHEN 'MEDIUM' THEN 500
        WHEN 'LARGE' THEN 2000
        ELSE 10000
    END AS storage_quota_gb,
    CASE industry_classification
        WHEN 'FINANCIAL_SERVICES' THEN 'HIGH_SECURITY'
        WHEN 'HEALTHCARE' THEN 'COMPLIANCE_REQUIRED'
        ELSE 'STANDARD'
    END AS security_policy_level
FROM organization_base ob
JOIN (
    SELECT company, MIN(email) as first_user_email, MIN(load_date) as load_date
    FROM Silver.sv_users
    WHERE company IS NOT NULL
    GROUP BY company
) contact_info ON ob.organization_name = UPPER(TRIM(contact_info.company))
```

## 3. Transformation Rules for Go_Time_Dimension

### 3.1 Comprehensive Time Dimension Population
- **Rationale**: Create a complete time dimension to support temporal analysis across all business processes
- **SQL Example**:
```sql
WITH date_range AS (
    SELECT 
        DATEADD(day, seq4(), '2020-01-01') AS date_key
    FROM TABLE(GENERATOR(ROWCOUNT => 3653)) -- 10 years of dates
)
SELECT 
    CONCAT('TIME_', TO_CHAR(date_key, 'YYYYMMDD')) AS time_dim_id,
    date_key,
    YEAR(date_key) AS year_number,
    QUARTER(date_key) AS quarter_number,
    MONTH(date_key) AS month_number,
    MONTHNAME(date_key) AS month_name,
    WEEKOFYEAR(date_key) AS week_number,
    DAYOFYEAR(date_key) AS day_of_year,
    DAY(date_key) AS day_of_month,
    DAYOFWEEK(date_key) AS day_of_week,
    DAYNAME(date_key) AS day_name,
    CASE WHEN DAYOFWEEK(date_key) IN (1, 7) THEN TRUE ELSE FALSE END AS is_weekend,
    FALSE AS is_holiday, -- To be updated with holiday calendar
    CASE 
        WHEN MONTH(date_key) >= 4 THEN YEAR(date_key)
        ELSE YEAR(date_key) - 1
    END AS fiscal_year,
    CASE 
        WHEN MONTH(date_key) IN (4, 5, 6) THEN 1
        WHEN MONTH(date_key) IN (7, 8, 9) THEN 2
        WHEN MONTH(date_key) IN (10, 11, 12) THEN 3
        ELSE 4
    END AS fiscal_quarter
FROM date_range
```

### 3.2 Holiday and Business Calendar Integration
- **Rationale**: Enhance time dimension with business calendar information for accurate reporting
- **SQL Example**:
```sql
UPDATE Go_Time_Dimension 
SET is_holiday = TRUE
WHERE (MONTH(date_key) = 1 AND DAY(date_key) = 1) -- New Year
   OR (MONTH(date_key) = 7 AND DAY(date_key) = 4) -- Independence Day
   OR (MONTH(date_key) = 12 AND DAY(date_key) = 25) -- Christmas
   OR (MONTH(date_key) = 11 AND DAY(date_key) BETWEEN 22 AND 28 AND DAYOFWEEK(date_key) = 5) -- Thanksgiving
```

## 4. Transformation Rules for Go_Device_Dimension

### 4.1 Device Classification and Standardization
- **Rationale**: Standardize device information for consistent reporting and analysis
- **SQL Example**:
```sql
SELECT 
    CONCAT('DEVICE_', LPAD(ROW_NUMBER() OVER (ORDER BY device_type, operating_system), 8, '0')) AS device_dim_id,
    MD5(CONCAT(device_type, operating_system, application_version)) AS device_connection_id,
    CASE 
        WHEN UPPER(device_type) LIKE '%DESKTOP%' OR UPPER(device_type) LIKE '%PC%' THEN 'DESKTOP'
        WHEN UPPER(device_type) LIKE '%MOBILE%' OR UPPER(device_type) LIKE '%PHONE%' THEN 'MOBILE'
        WHEN UPPER(device_type) LIKE '%TABLET%' OR UPPER(device_type) LIKE '%IPAD%' THEN 'TABLET'
        WHEN UPPER(device_type) LIKE '%WEB%' OR UPPER(device_type) LIKE '%BROWSER%' THEN 'WEB_BROWSER'
        ELSE 'UNKNOWN'
    END AS device_type,
    CASE 
        WHEN UPPER(operating_system) LIKE '%WINDOWS%' THEN 'WINDOWS'
        WHEN UPPER(operating_system) LIKE '%MAC%' OR UPPER(operating_system) LIKE '%OSX%' THEN 'MACOS'
        WHEN UPPER(operating_system) LIKE '%IOS%' THEN 'IOS'
        WHEN UPPER(operating_system) LIKE '%ANDROID%' THEN 'ANDROID'
        WHEN UPPER(operating_system) LIKE '%LINUX%' THEN 'LINUX'
        ELSE 'OTHER'
    END AS operating_system,
    application_version,
    'UNKNOWN' AS network_connection_type,
    CASE 
        WHEN device_type IN ('DESKTOP', 'WEB_BROWSER') THEN 'COMPUTER'
        WHEN device_type IN ('MOBILE', 'TABLET') THEN 'MOBILE_DEVICE'
        ELSE 'OTHER'
    END AS device_category,
    CASE 
        WHEN operating_system IN ('WINDOWS', 'MACOS', 'LINUX') THEN 'DESKTOP_OS'
        WHEN operating_system IN ('IOS', 'ANDROID') THEN 'MOBILE_OS'
        ELSE 'OTHER_OS'
    END AS platform_family
FROM (
    SELECT DISTINCT 
        'Desktop' as device_type,
        'Windows 10' as operating_system,
        '5.8.0' as application_version
    UNION ALL
    SELECT 'Mobile', 'iOS 15', '5.8.0'
    UNION ALL
    SELECT 'Tablet', 'Android 11', '5.7.5'
    UNION ALL
    SELECT 'Web Browser', 'Chrome', 'Web Client'
) device_data
```

### 4.2 Device Performance Classification
- **Rationale**: Categorize devices based on performance characteristics for quality analysis
- **SQL Example**:
```sql
SELECT 
    *,
    CASE 
        WHEN platform_family = 'DESKTOP_OS' AND operating_system IN ('WINDOWS', 'MACOS') THEN 'HIGH_PERFORMANCE'
        WHEN platform_family = 'MOBILE_OS' AND device_type = 'TABLET' THEN 'MEDIUM_PERFORMANCE'
        WHEN platform_family = 'MOBILE_OS' AND device_type = 'MOBILE' THEN 'STANDARD_PERFORMANCE'
        WHEN device_type = 'WEB_BROWSER' THEN 'VARIABLE_PERFORMANCE'
        ELSE 'UNKNOWN_PERFORMANCE'
    END AS performance_category,
    CASE 
        WHEN operating_system IN ('WINDOWS', 'MACOS') THEN TRUE
        ELSE FALSE
    END AS supports_advanced_features
FROM Go_Device_Dimension
```

## 5. Transformation Rules for Go_Geography_Dimension

### 5.1 Geographic Hierarchy and Standardization
- **Rationale**: Create standardized geographic dimension for regional analysis and reporting
- **SQL Example**:
```sql
SELECT 
    CONCAT('GEO_', LPAD(ROW_NUMBER() OVER (ORDER BY country_code), 6, '0')) AS geography_dim_id,
    country_code,
    country_name,
    region_name,
    time_zone,
    CASE 
        WHEN country_code IN ('US', 'CA', 'MX') THEN 'NORTH_AMERICA'
        WHEN country_code IN ('GB', 'DE', 'FR', 'IT', 'ES', 'NL', 'SE', 'NO', 'DK') THEN 'EUROPE'
        WHEN country_code IN ('JP', 'CN', 'KR', 'IN', 'SG', 'AU', 'NZ') THEN 'ASIA_PACIFIC'
        WHEN country_code IN ('BR', 'AR', 'CL', 'CO', 'PE') THEN 'SOUTH_AMERICA'
        WHEN country_code IN ('ZA', 'NG', 'EG', 'KE') THEN 'AFRICA'
        ELSE 'OTHER'
    END AS continent
FROM (
    SELECT 'US' as country_code, 'United States' as country_name, 'Americas' as region_name, 'America/New_York' as time_zone
    UNION ALL
    SELECT 'GB', 'United Kingdom', 'Europe', 'Europe/London'
    UNION ALL
    SELECT 'DE', 'Germany', 'Europe', 'Europe/Berlin'
    UNION ALL
    SELECT 'JP', 'Japan', 'Asia Pacific', 'Asia/Tokyo'
    UNION ALL
    SELECT 'AU', 'Australia', 'Asia Pacific', 'Australia/Sydney'
    UNION ALL
    SELECT 'CA', 'Canada', 'Americas', 'America/Toronto'
    UNION ALL
    SELECT 'FR', 'France', 'Europe', 'Europe/Paris'
    UNION ALL
    SELECT 'IN', 'India', 'Asia Pacific', 'Asia/Kolkata'
    UNION ALL
    SELECT 'BR', 'Brazil', 'Americas', 'America/Sao_Paulo'
    UNION ALL
    SELECT 'SG', 'Singapore', 'Asia Pacific', 'Asia/Singapore'
) geo_data
```

### 5.2 Regional Business Rules and Compliance
- **Rationale**: Apply regional business rules and compliance requirements based on geography
- **SQL Example**:
```sql
SELECT 
    *,
    CASE 
        WHEN continent = 'EUROPE' THEN 'GDPR_REQUIRED'
        WHEN country_code = 'US' AND region_name = 'Americas' THEN 'CCPA_APPLICABLE'
        WHEN continent = 'ASIA_PACIFIC' THEN 'APAC_PRIVACY_LAWS'
        ELSE 'STANDARD_COMPLIANCE'
    END AS compliance_requirement,
    CASE 
        WHEN continent IN ('NORTH_AMERICA', 'EUROPE') THEN 'TIER_1'
        WHEN continent IN ('ASIA_PACIFIC') THEN 'TIER_2'
        ELSE 'TIER_3'
    END AS service_tier,
    CASE 
        WHEN country_code IN ('US', 'GB', 'DE', 'JP', 'AU', 'CA', 'FR') THEN TRUE
        ELSE FALSE
    END AS primary_market
FROM Go_Geography_Dimension
```

## 6. Cross-Dimensional Data Quality Rules

### 6.1 Referential Integrity Validation
- **Rationale**: Ensure data consistency across all dimension tables
- **SQL Example**:
```sql
-- Validate User-Organization relationships
SELECT 
    u.user_dim_id,
    u.user_name,
    u.department_name,
    o.organization_name
FROM Go_User_Dimension u
LEFT JOIN Go_Organization_Dimension o 
    ON UPPER(TRIM(u.department_name)) = o.organization_name
WHERE o.organization_id IS NULL
  AND u.department_name != 'UNKNOWN'
```

### 6.2 Dimension Key Standardization
- **Rationale**: Ensure consistent key formats across all dimension tables
- **SQL Example**:
```sql
-- Standardize all dimension keys to follow consistent pattern
SELECT 
    'Dimension Key Format Validation' AS validation_type,
    COUNT(*) as total_records,
    SUM(CASE WHEN user_dim_id LIKE 'USER_%' THEN 1 ELSE 0 END) as valid_user_keys,
    SUM(CASE WHEN organization_dim_id LIKE 'ORG_%' THEN 1 ELSE 0 END) as valid_org_keys,
    SUM(CASE WHEN time_dim_id LIKE 'TIME_%' THEN 1 ELSE 0 END) as valid_time_keys
FROM (
    SELECT user_dim_id, NULL as organization_dim_id, NULL as time_dim_id FROM Go_User_Dimension
    UNION ALL
    SELECT NULL, organization_dim_id, NULL FROM Go_Organization_Dimension  
    UNION ALL
    SELECT NULL, NULL, time_dim_id FROM Go_Time_Dimension
) all_keys
```

## 7. Performance Optimization Rules

### 7.1 Dimension Table Clustering
- **Rationale**: Optimize query performance through strategic clustering
- **SQL Example**:
```sql
-- Cluster dimension tables for optimal query performance
ALTER TABLE Go_User_Dimension CLUSTER BY (user_type, license_type);
ALTER TABLE Go_Organization_Dimension CLUSTER BY (industry_classification, organization_size);
ALTER TABLE Go_Time_Dimension CLUSTER BY (year_number, quarter_number);
ALTER TABLE Go_Device_Dimension CLUSTER BY (device_category, platform_family);
ALTER TABLE Go_Geography_Dimension CLUSTER BY (continent, country_code);
```

### 7.2 Dimension Indexing Strategy
- **Rationale**: Create appropriate indexes for frequently queried dimension attributes
- **SQL Example**:
```sql
-- Note: Snowflake uses automatic micro-partitioning, but these represent logical indexing concepts
-- Primary lookup columns should be clustered for optimal performance
SELECT 
    'Performance Optimization' as optimization_type,
    'Clustered on primary lookup columns' as strategy,
    'Automatic micro-partitioning utilized' as implementation
```