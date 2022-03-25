import { Controller } from "@hotwired/stimulus";

export default class extends Controller {
  static targets = ['table', 'select_all', 'checkbox', 'button'];

  connect() {

  }

  disconnect() {

  }

  //window.onpageshow
  onpageshow(event) {
    if (selectedItemIds()) {
      checkboxes.forEach(function(checkbox) {
        checkbox.checked = false;
      });

      selectAllCheckboxes.checked = false;
    }
  }

  onClickSelectAll(event) {
    checkboxes.forEach(function(checkbox) {
      checkbox.checked = selectAllCheckboxes.checked;
    });

    checkAndToggleActionButtons();
  }

  actionClick(event){
    button.href += '?' + selectedItemIds();
  }

  /*
  checkboxes.forEach(function(checkbox){
    checkbox.closest('td').addEventListener('click', function(event){
      event.stopImmediatePropagation();
    })

    checkbox.addEventListener('click', function(event) {
      event.stopImmediatePropagation();

      checkAndToggleActionButtons();
    })
  }
  */

  get selectedItemIds() {
    var ids = Array.prototype.filter.call(checkboxes, function(checkbox) {
          if (checkbox.checked) { return checkbox }
        }).map(function(checkbox) {
          return 'batch_action_ids[]=' + checkbox.value
        }).join('&');
    return ids;
  }

  get checkAndToggleActionButtons() {
    if (selectedItemIds()) {
      buttons.forEach(function(button){
        button.classList.remove('disabled');
      });
    } else {
      buttons.forEach(function(button){
        button.classList.add('disabled');
      });
    }
  }
}