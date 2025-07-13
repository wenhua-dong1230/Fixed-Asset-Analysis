 固定资产全生命周期数据审计分析项目 (Fixed Asset Lifecycle Data Audit Project)

 项目简介

本项目是一个端到端的、高度模拟真实企业环境的固定资产全生命周期数据审计项目。项目聚焦于大型企业（尤其是资产密集的央企、国企）的核心关切点：确保国有资产的完整、保值增值，并提升资产管理效率。

通过连接到模拟的MySQL业务数据库，本项目利用Python和SQL进行深度数据分析，旨在自动化识别固定资产在“采购、使用、折旧、维保、处置”等全生命周期环节中的潜在风险、管理漏洞和财务差错。

模拟场景

作为一名数据审计师，你被委派对一家大型制造国企的固定资产管理情况进行专项审计。你的任务是：
1.  核实资产的真实存在性，识别“幽灵资产”。
2.  验证资产的估值准确性，检查折旧计提是否合规。
3.  评估资产的使用效率，识别潜在的闲置和减值风险。
4.  审查资产处置流程的合规性。

 技术栈

数据库: MySQL
数据处理与分析: Python (Pandas, SQLAlchemy)
数据生成: Faker
数据可视化: Power BI, Matplotlib, Seaborn
版本控制: Git

 项目结构


setup_fixed_asset_db.sql       用于在MySQL中创建表结构的SQL脚本
populate_mysql_data.ipynb      生成模拟数据并填充到MySQL的Python脚本
fixed_asset_analysis.ipynb     连接数据库并执行审计分析的核心脚本
fixed_asset_analysis.pbix      Power BI仪表盘源文件
requirements.txt               项目依赖的Python库
README.md                      项目说明文件
fixed_asset_vedio.gif          存放Power BI仪表盘GIF


如何运行

 1. 准备环境
- 确保你的电脑上已安装并运行MySQL服务器。
- 安装Python 3.x。
- 克隆或下载此项目到本地。

2. 创建并配置数据库
- 使用你的MySQL客户端（如MySQL Workbench, Navicat）连接到MySQL服务器。
- 执行 `fa_setup_database.sql` 文件中的所有SQL命令，以创建`fixed_asset_db`数据库及所有相关表。

 3. 安装Python依赖
- 在项目根目录下打开终端或命令行。
- 运行命令: `pip install -r requirements.txt`

 4. 填充模拟数据
- 打开 `fa_populate_data.py` 文件。
- 重要: 修改文件中的数据库连接信息（`db_user`, `db_password`, `db_host`）为你自己的MySQL配置。
- 运行此脚本: `python fa_populate_data.py`
- 等待脚本执行完毕，数据将被填充到你的MySQL数据库中。

5. 执行审计分析
- 打开 `fa_audit_analysis.py` 文件。
- 同样，修改文件中的数据库连接信息。
- 运行审计脚本: `python fa_audit_analysis.py`
- 在终端查看详细的审计分析结果和发现。

 6. (可选) 可视化分析
- 打开 `fa_audit_dashboard.pbix` 文件（需安装Power BI Desktop）。
- 在Power BI中，修改数据源连接信息，将其指向你的MySQL数据库，即可刷新并查看交互式仪表盘。

审计发现示例 (Sample Audit Findings)

此项目旨在自动识别以下四类核心的固定资产审计异常：

1. 资产存在性风险 (幽灵资产)**: 识别出那些在账面上状态为“在用”，但已超过两年没有任何维修保养记录的资产。
2. 资产估值风险 (折旧错误)**: 通过重新计算月度折旧额，与账面记录进行比对，定位出折旧计提不符合会计政策的资产。
3. 资产减值风险 (闲置资产)**: 筛选出所有状态为“闲置”的资产，量化其账面净值，为管理层进行减值测试提供数据支持。
4. 资产处置风险 (处置异常)**: 分析已处置资产的记录，识别出那些处置时产生巨大亏损或远未到使用年限即报废的异常情况。

可视化仪表盘展示 (Dashboard Showcase)

为了向管理层直观地汇报审计发现，本项目配套设计了Power BI交互式仪表盘。

注意: 以下为仪表盘设计示例，请将图片和链接替换为你自己制作的成果。


 仪表盘核心页面截图

