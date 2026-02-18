import { api, LightningElement } from 'lwc';
import NAME_FIELD from '@salesforce/schema/Account.Name';
import INDUSTRY_FIELD from '@salesforce/schema/Account.Industry';
import ANNUAL_REVENUE_FIELD from '@salesforce/schema/Account.AnnualRevenue';

export default class RecordViewForm extends LightningElement {

    @api recordId;
    @api objectApiName;

    nameField = NAME_FIELD;
    industryField = INDUSTRY_FIELD;
    annualRevenueField = ANNUAL_REVENUE_FIELD;

}