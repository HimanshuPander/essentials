<?xml version="1.0" encoding="UTF-8"?>
<Workflow xmlns="http://soap.sforce.com/2006/04/metadata">
    <alerts>
        <fullName>Send_Email_to_Contact</fullName>
        <description>Send an email to the contact whenever a new contact&apos;s lead source is Web.</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Send_Email_to_Contact</template>
    </alerts>
    <alerts>
        <fullName>Send_Welcome_Email_to_Contact</fullName>
        <description>Send Welcome Email to Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Send_Welcome_Email</template>
    </alerts>
    <alerts>
        <fullName>Send_an_Email_to_Contact</fullName>
        <description>Send an Email to Contact</description>
        <protected>false</protected>
        <recipients>
            <field>Email</field>
            <type>email</type>
        </recipients>
        <senderType>CurrentUser</senderType>
        <template>unfiled$public/Send_Email_to_Contact</template>
    </alerts>
</Workflow>
