_____________________________________________
## *Author*: AAVA
## *Created on*: 
## *Description*: Gold Layer Physical Data Model for Zoom Platform Analytics Systems with aggregated dimensional and fact data optimized for Snowflake
## *Version*: 1
## *Updated on*: 
_____________________________________________

-- =====================================================
-- GOLD LAYER PHYSICAL DATA MODEL VERSION 1
-- Zoom Platform Analytics Systems
-- Compatible with Snowflake SQL
-- API Cost References Removed as Requested
-- =====================================================

-- =====================================================
-- 1. GOLD LAYER FACT TABLES
-- =====================================================

-- 1.1 GOLD MEETING FACTS TABLE
CREATE TABLE IF NOT EXISTS Gold.Go_Meeting_Facts (
    meeting_fact_id VARCHAR(50)