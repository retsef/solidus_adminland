import { Controller } from '@hotwired/stimulus'

export default class extends Controller {
  connect() {
    
  }

  disconnect() {

  }

  dark(e) {
    e.preventDefault();

    this.element.classList.remove('theme-light');
    this.element.classList.add('theme-dark');
  }

  light(e) {
    e.preventDefault();
    
    this.element.classList.remove('theme-dark');
    this.element.classList.add('theme-light');
  }
}