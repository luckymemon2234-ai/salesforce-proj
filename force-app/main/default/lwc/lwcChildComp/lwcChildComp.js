import { LightningElement,api } from 'lwc';

export default class LwcChildComp extends LightningElement {
@api message;
@api cardHeading;
@api number;
@api isValid;

}