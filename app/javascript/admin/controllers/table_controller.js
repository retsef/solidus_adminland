import { Controller } from "@hotwired/stimulus";
import _ from "lodash";

export default class extends Controller {
  static targets = ['all', 'box', 'modal', 'count', 'action', 'per_page', 'per_page_form'];

  connect() {
    if (this.selectedItems.length > 0) {
      this.boxTagets.forEach(function (checkbox) {
        checkbox.checked = false;
      });

      this.allTarget.checked = false;
    }
  }

  disconnect() {

  }

  toggle_all(event) {
    var all_checked = this.allTarget.checked;
    this.boxTargets.forEach(function (checkbox) {
      checkbox.checked = all_checked;
    });

    this.checkAndToggleActionButtons();
  }

  clear(event) {
    this.boxTargets.forEach(function (checkbox) {
      checkbox.checked = false;
    });

    this.allTarget.checked = false;

    // this.checkAndToggleActionButtons();
  }

  check(event) {
    event.stopImmediatePropagation();

    if (!event.target.checked) {
      this.allTarget.checked = false;
    }

    this.checkAndToggleActionButtons();
  }

  action_method(event) {
    this.actionTarget.href += '?' + this.selectedItemIds;
  }

  get selectedItems() {
    return _.filter(this.boxTargets, function (checkbox) {
      if (checkbox.checked) { return checkbox }
    });
  }

  get selectedItemIds() {
    return this.selectedItems.map(function (checkbox) {
      return 'batch_action_ids[]=' + checkbox.value
    }).join('&');
  }

  checkAndToggleActionButtons() {
    if (this.selectedItems.length > 0) {
      this.countTarget.innerText = this.selectedItems.length;
      this.modalTarget.classList.add('show');
    } else {
      this.modalTarget.classList.remove('show');
    }
  }

  changePerPage(event) {
    let url = new URL(this.per_page_formTarget.action);
    url.searchParams.set('per_page', event.target.value);

    this.per_page_formTarget.action = url.toString();
    this.per_page_formTarget.submit();
  }
}