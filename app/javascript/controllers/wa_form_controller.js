import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="wa-form"
export default class extends Controller {
  connect() {
    this.element.addEventListener(
      "turbo:submit-start",
      this.onFormSubmitStart.bind(this),
    );
  }

  onFormSubmitStart() {
    const button = this.submitButton
    if (!button.hasAttribute("loading")) {
      button.setAttribute("loading", true)
    }
    if (!button.hasAttribute("disabled")) {
      button.setAttribute("disabled", true)
    }
  }

  get submitButton() {
    return this.element.querySelector('wa-button[type="submit"]')
  }
}
