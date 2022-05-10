import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
    static targets = ['customer_type',
        'company', 'personal_tax_code', 'vat_number', 'billing_email', 'einvoicing_code'];

    connect() {
        if(this.hasCustomer_typeTarget) {
            this.initCustomerType();
        }
    }

    initCustomerType() {
        switch(this.customer_type) {
            case 'business':
                this.showBusinessFields();
                break;
            case 'private':
                this.showPrivateFields();
                break;
        }

        this.customer_typeTarget.addEventListener('change', this.customer_type_change.bind(this));
    }

    customer_type_change(_e) {
        switch(this.customer_type) {
            case 'business':
                this.showBusinessFields();
                break;
            case 'private':
                this.showPrivateFields();
                break;
        }
    }

    showBusinessFields() {
        [this.vat_numberTarget, this.billing_emailTarget, this.einvoicing_codeTarget, this.companyTarget].forEach(target => {
            target.getElementsByTagName('input')[0].removeAttribute('disabled', "");
            target.classList.remove('d-none');
        });
    }

    showPrivateFields() {
        [this.vat_numberTarget, this.billing_emailTarget, this.einvoicing_codeTarget, this.companyTarget].forEach(target => {
            target.getElementsByTagName('input')[0].setAttribute('disabled', "");
            target.classList.add('d-none');
        });
    }

    get customer_type() {
        return this.customer_typeTarget.getElementsByTagName('select')[0].value;
    }

    disconnect() {
        if(this.hasCustomer_typeTarget) {
            this.customer_typeTarget.removeEventListener('change', this.customer_type_change.bind(this));
        }
    }
}