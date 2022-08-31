import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static values = {
    apiKey: String,
    markers: Array
  }

  connect() {
    console.log('Hello from Stimulus')
    mapboxgl.accessToken = this.apiKeyValue

    this.map = new mapboxgl.Map({
      container: this.element,
      style: "mapbox://styles/mapbox/streets-v10",
      center: [13.404954, 52.520007], // [lng, lat]
      zoom: 9,
      style: 'mapbox://styles/lamoureuxmarie/cl7hkl5lc002s15s02nlingxr'
    })
  }
}
