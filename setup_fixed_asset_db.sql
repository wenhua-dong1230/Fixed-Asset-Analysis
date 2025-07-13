CREATE DATABASE IF NOT EXISTS fixed_asset_db CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;
USE fixed_asset_db;
-- 1. 固定资产主台账 (asset_register)
CREATE TABLE IF NOT EXISTS asset_register (
    asset_id VARCHAR(15) PRIMARY KEY,
    asset_name VARCHAR(100),
    asset_category VARCHAR(50), -- e.g., 生产设备, 电子设备, 运输工具
    purchase_cost DECIMAL(15, 2),
    purchase_date DATE,
    useful_life_years INT,
    salvage_rate DECIMAL(5, 4), -- e.g., 0.05 for 5%
    asset_status VARCHAR(20), -- 在用, 闲置, 报废
    location VARCHAR(100),
    department VARCHAR(100)
);

-- 2. 月度折旧记录表 (depreciation_schedule)
CREATE TABLE IF NOT EXISTS depreciation_schedule (
    record_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id VARCHAR(15),
    period CHAR(7), -- 格式: 'YYYY-MM'
    monthly_depreciation DECIMAL(15, 2),
    accumulated_depreciation DECIMAL(15, 2),
    FOREIGN KEY (asset_id) REFERENCES asset_register(asset_id)
);

-- 3. 维修保养记录表 (maintenance_logs)
CREATE TABLE IF NOT EXISTS maintenance_logs (
    log_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id VARCHAR(15),
    maintenance_date DATE,
    maintenance_cost DECIMAL(15, 2),
    details TEXT,
    FOREIGN KEY (asset_id) REFERENCES asset_register(asset_id)
);

-- 4. 资产处置记录表 (disposal_records)
CREATE TABLE IF NOT EXISTS disposal_records (
    disposal_id INT AUTO_INCREMENT PRIMARY KEY,
    asset_id VARCHAR(15),
    disposal_date DATE,
    disposal_method VARCHAR(50), -- 出售, 报废
    proceeds DECIMAL(15, 2), -- 处置收入
    net_book_value_at_disposal DECIMAL(15, 2), -- 处置时净值
    net_gain_loss DECIMAL(15, 2),
    FOREIGN KEY (asset_id) REFERENCES asset_register(asset_id)
);

SHOW TABLES;