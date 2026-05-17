This repository contains a complete Salesforce development project built using:

Apex Classes
Lightning Web Components (LWC)
Aura Components
Flows & Automation
Triggers
Batch Apex
Community/Experience Cloud Authentication
Custom Search & Pagination
Opportunity & Account Automation
Integration-ready Architecture (HubSpot/API style integration design)

The project demonstrates enterprise-level Salesforce development practices suitable for:

CRM Automation
Customer Lifecycle Management
Sales Pipeline Automation
Account & Opportunity Management
External System Integration
Experience Cloud Login & Registration

HubSpot / Webhook / External API
                │
                ▼
 Salesforce Apex REST APIs
 Future Methods / Async Processing
                │
                ▼
 Validation & Transformation Layer
                │
                ▼
 Trigger Framework & Helper Classes
                │
                ▼
 Salesforce Standard Objects
 (Account, Contact, Lead, Opportunity)
                │
                ▼
 Flows, Notifications & Automation
# 🏗️ High-Level Salesforce Architecture

```text
+----------------------------------------------------------------------------------+
|                           External Applications                                  |
|                          (HubSpot / REST APIs)                                   |
+-----------------------------------+----------------------------------------------+
                                    |
                                    | REST API / Future Methods
                                    ▼

+----------------------------------------------------------------------------------+
|                           Apex Integration Layer                                 |
|----------------------------------------------------------------------------------|
| Controllers & Helper Classes                                                     |
|                                                                                  |
| • leadFuture.cls                                                                 |
| • lwcFakeStore.cls                                                               |
| • lwcSpoonacular.cls                                                             |
+-----------------------------------+----------------------------------------------+
                                    |
        +---------------------------+---------------------------+
        |                           |                           |
        ▼                           ▼                           ▼

+------------------------+  +------------------------+  +------------------------+
|      Apex Triggers     |  |    Salesforce Flows    |  | Batch/Scheduled Jobs   |
|------------------------|  |------------------------|  |------------------------|
| • Account Logic        |  | • Opportunity Flows    |  | • batchAddress.cls     |
| • Lead Automation      |  | • Notifications        |  | • batchTask.cls        |
| • Opportunity Process  |  | • Approval Processes   |  | • batchOpptyStage.cls  |
| • Assignment Rules     |  | • Auto Updates         |  | • Scheduled Execution  |
+------------+-----------+  +------------+-----------+  +------------+-----------+
             \                          |                          /
              \                         |                         /
               \                        |                        /
                +-----------------------+-----------------------+
                                        |
                                        ▼

+----------------------------------------------------------------------------------+
|                          Salesforce Database Layer                               |
|----------------------------------------------------------------------------------|
| • Accounts                                                                       |
| • Contacts                                                                       |
| • Leads                                                                          |
| • Opportunities                                                                  |
+-----------------------------------+----------------------------------------------+
                                    |
                    +---------------+---------------+
                    |                               |
                    ▼                               ▼

+--------------------------------+   +---------------------------------------------+
|        Aura Components         |   |     Lightning Web Components (LWC)          |
|--------------------------------|   |---------------------------------------------|
| • Account Search               |   | • Account List                              |
| • Pagination                   |   | • Opportunity UI                            |
| • Parent / Child Events        |   | • Search Components                         |
+--------------------------------+   +---------------------------------------------+
```------------+
