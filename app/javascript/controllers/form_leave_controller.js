import { Controller } from "@hotwired/stimulus";

export default class extends Controller {

  formChanged= false;

  connect() {
    this.element.addEventListener("input", this.onFormChange.bind(this));
  }

  onFormChange() {
    console.log("Form has changed!");
  }

  beforeunload(e) {
    if(this.formChanged) {
      //following two lines will cause the browser to ask the user if they
      //want to leave. The text of this dialog is controlled by the browser.
      e.preventDefault(); //per the standard
      e.returnValue = ''; //required for Chrome
    }
    //else: user is allowed to leave without a warning dialog
  }
}