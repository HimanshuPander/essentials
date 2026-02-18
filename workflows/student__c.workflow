<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Successful_Student_Registration</fullName>
        <description>Successful Student Registration</description>
        <protected>false</protected>
        <recipients>
            <field>Student_Email__c</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Registration_Successful_Email</template>
    </alerts>
    <fieldUpdates>
        <fullName>SetQueueAsOwner</fullName>
        <field>OwnerId</field>
        <lookupValue>Student_Lead_Membership_Queue</lookupValue>
        <lookupValueType>Queue</lookupValueType>
        <name>SetQueueAsOwner</name>
        <notifyAssignee>false</notifyAssignee>
        <operation>LookupValue</operation>
        <protected>false</protected>
        <reevaluateOnChange>false</reevaluateOnChange>
    </fieldUpdates>
    <rules>
        <fullName>StudentRegistrationSuccessfull</fullName>
        <actions>
            <name>Successful_Student_Registration</name>
            <type>Alert</type>
        </actions>
        <actions>
            <name>SetQueueAsOwner</name>
            <type>FieldUpdate</type>
        </actions>
        <actions>
            <name>Gather_Requirements</name>
            <type>Task</type>
        </actions>
        <active>true</active>
        <criteriaItems>
            <field>student__c.Age__c</field>
            <operation>greaterThan</operation>
            <value>15</value>
        </criteriaItems>
        <triggerType>onCreateOnly</triggerType>
    </rules>
    <tasks>
        <fullName>Gather_Requirements</fullName>
        <assignedTo>hchoudhary@himanshu.salesforce.com</assignedTo>
        <assignedToType>user</assignedToType>
        <dueDateOffset>3</dueDateOffset>
        <notifyAssignee>false</notifyAssignee>
        <priority>Normal</priority>
        <protected>false</protected>
        <status>Not Started</status>
        <subject>Gather Requirements</subject>
    </tasks>
</Workflow>
