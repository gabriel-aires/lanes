import { Controller } from "@hotwired/stimulus"
import Sortable from "sortablejs"

export default class extends Controller {
  static values = { url: String }

  connect() {
    Sortable.create(this.element, {
      group: "shared",
      animation: 150,
      fallbackOnBody: true,
      swapThreshold: 0.65,
      onEnd: (evt) => this.update(evt)
    })
  }

  async update(evt) {
    const ids = [...evt.to.querySelectorAll('[data-card-id]')].map(el => el.dataset.cardId)
    const laneId = evt.to.dataset.laneId
    const csrfToken = document.querySelector("[name='csrf-token']").content

    await fetch(this.urlValue, {
      method: "PATCH",
      headers: { "X-CSRF-Token": csrfToken, "Content-Type": "application/json" },
      body: JSON.stringify({ ids, lane_id: laneId })
    })
  }
}