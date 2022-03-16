import { Controller } from '@hotwired/stimulus'
import TomSelect from 'tom-select'

export default class extends Controller {
  static targets = ['input'];

  choices = null;

  initialize() {
    this.config = {
      create: false,
      sortField: {
        field: "text",
        direction: "asc"
      },
      allowEmptyOption: this.allowEmptyOption,
      placeholder: this.placeholder,
      // shouldSort: false,
      // removeItemButton: this.removeItemButton,
      // callbackOnCreateTemplates: this.callbackOnCreateTemplates.bind(this)
    }
  }

  connect() {
    this.choices = new TomSelect(this.inputTarget, {
      ...this.config
    });
  }

  disconnect() {
    // const value = this.inputTarget.value
    this.choices.destroy()
    // this.inputTarget.value = value
  }

  get removeItemButton() {
    return this.inputTarget.hasAttribute('multiple');
  }

  get allowEmptyOption() {
    return !this.inputTarget.hasAttribute('multiple');
  }

  get placeholder() {
    return this.inputTarget.getAttribute('placeholder') || 'Select a value...';
  }

  callbackOnCreateTemplates(template) {
    return {
      choice: this.choice.bind(this, template),
    };
  }

  choice(template, classNames, data) {
    const classes = `${classNames.item} ${classNames.itemChoice} ${data.disabled ? classNames.itemDisabled : classNames.itemSelectable}`;
    const disabled = data.disabled ? 'data-choice-disabled aria-disabled="true"' : 'data-choice-selectable';
    const role = data.groupId > 0 ? 'role="treeitem"' : 'role="option"';
    const selectText = this.config.itemSelectText;

    const label =
      data.customProperties && data.customProperties.avatarSrc
        ? `
            <div class="avatar avatar-xs me-3">
              <img class="avatar-img rounded-circle" src="${data.customProperties.avatarSrc}" alt="${data.label}" >
            </div> ${data.label}
          `
        : data.label;

    return template(`
      <div class="${classes}" data-select-text="${selectText}" data-choice ${disabled} data-id="${data.id}" data-value="${data.value}" ${role}>
        ${label}
      </div>
    `);
  }

}