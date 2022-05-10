// Configure your import map in config/importmap.rb. Read more: https://github.com/rails/importmap-rails

import Rails from '@rails/ujs'
import * as ActiveStorage from '@rails/activestorage'

import 'trix'
import '@rails/actiontext'

if (!window._rails_loaded) { Rails.start() }
ActiveStorage.start()

import * as Turbo from '@hotwired/turbo'

// Bootstrap
import {
    Alert, Button,
    Carousel,
    Collapse, Dropdown,
    Modal, Offcanvas, Popover,
    ScrollSpy,
    Tab, Toast, Tooltip,
} from 'bootstrap';

// Make available globally
window.Alert = Alert;
window.Button = Button;
window.Carousel = Carousel;
window.Collapse = Collapse;
window.Dropdown = Dropdown;
window.Modal = Modal;
window.Offcanvas = Offcanvas;
window.Popover = Popover;
window.ScrollSpy = ScrollSpy;
window.Tab = Tab;
window.Toast = Toast;
window.Tooltip = Tooltip;

window.Modal_template = `
  <div id="modal-confirm" class="modal" tabindex="-1">
    <div class="modal-dialog modal-sm modal-dialog-centered" role="document">
      <div class="modal-content">
        <div class="modal-body">
          <h5 class="modal-title">Modal title</h5>
          <p>Modal body text goes here.</p>
        </div>
        <div class="modal-footer">
          <button type="button" class="cancel btn btn-link link-secondary me-auto" data-bs-dismiss="modal">Close</button>
          <button type="button" class="confirm btn btn-danger">Save changes</button>
        </div>
      </div>
    </div>
  </div>
`;

const newConfirmMethod = async (message, _formElement) => {
  document.body.insertAdjacentHTML('beforeend', window.Modal_template);

  let confirmModal = new Modal(document.getElementById('modal-confirm'));
  confirmModal.show();

  let titleElement = confirmModal._element.querySelector('.modal-title');
  titleElement.innerText = ''

  let p = confirmModal._element.querySelector('.modal-body p')
  p.innerText = message;

  return new Promise((resolve, reject) => {
    const confirmButton = confirmModal._element.querySelector('.confirm');
    const cancelButton = confirmModal._element.querySelector('.cancel');
    confirmButton.addEventListener('click', () => { resolve(true) });
    cancelButton.addEventListener('click', () => { resolve(false) });
  });
};

// Turbo > 7.1.0
// window.Turbo.setConfirmMethod(newConfirmMethod);

import LocalTime from "local-time-cdn"
LocalTime.start()

import "admin/controllers"
