import { Controller } from '@hotwired/stimulus'
import Choices from 'choices.js'

export default class extends Controller {
  static targets = ['input'];

  choices = null;

  initialize() {
    this.config = {
      classNames: {
        containerInner: this.inputTarget.className,
        input: 'form-control',
        inputCloned: 'form-control-sm',
        listDropdown: 'dropdown-menu',
        itemChoice: 'dropdown-item',
        activeState: 'show',
        selectedState: 'active',
      },
      shouldSort: false,
      callbackOnCreateTemplates: this.callbackOnCreateTemplates.bind(this)
    }
  }

  connect() {
    this.choices = new Choices(this.inputTarget, {
      ...this.config
    });
  }

  disconnect() {
    // const value = this.inputTarget.value
    this.choices.destroy()
    // this.inputTarget.value = value
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