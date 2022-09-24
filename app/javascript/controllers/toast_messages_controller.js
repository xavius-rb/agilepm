import { Controller } from "@hotwired/stimulus"
import { Toast } from "bootstrap"

export default class extends Controller {
  connect() {
    var divList = [].slice.call(document.querySelectorAll('.toast'))
    divList.map(function (element) {
      new Toast(element).show()
    })
  }
}
