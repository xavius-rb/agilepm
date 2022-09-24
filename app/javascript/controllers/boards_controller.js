import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  connect() {
    let board = JSON.parse(this.data.get("props"))
    this.element.textContent = board.title
  }
}
