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


                           +----------------------+
                           |     External Apps    |
                           |  (HubSpot / APIs)    |
                           +----------+-----------+
                                      |
                                      | REST API / Future Calls
                                      |
                        +-------------v--------------+
                        |     Apex Integration       |
                        |  Controllers & Helpers     |
                        |                            |
                        |  - leadFuture.cls          |
                        |  - lwcFakeStore.cls        |
                        |  - lwcSpoonacular.cls      |
                        +-------------+--------------+
                                      |
          ----------------------------------------------------------
          |                         |                              |
          |                         |                              |
+---------v---------+   +-----------v-----------+    +-------------v------------+
|   Apex Triggers   |   |   Salesforce Flows    |    | Batch/Scheduled Jobs     |
|                   |   |                        |    |                           |
| Account Trigger   |   | Opportunity Flows     |    | batchAddress.cls          |
| Opportunity Logic |   | Notification Flows    |    | batchTask.cls             |
| Lead Automation   |   | Approval Processes    |    | batchOpptyStage.cls       |
+---------+---------+   +-----------+------------+    +-------------+------------+
          |                         |                               |
          -----------------------------------------------------------
                                      |
                           +----------v-----------+
                           | Salesforce Database  |
                           | Accounts             |
                           | Contacts             |
                           | Opportunities        |
                           | Leads                |
                           +----------+-----------+
                                      |
                     ------------------------------------
                     |                                  |
          +----------v----------+           +-----------v------------+
          | Aura Components     |           | Lightning Web Components|
          | Account Search      |           | Account List            |
          | Pagination          |           | Opportunity UI          |
          | Parent/Child Events |           | Search Components       |
          +---------------------+           +-------------------------+
