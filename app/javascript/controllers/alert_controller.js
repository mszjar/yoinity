import { Controller } from "@hotwired/stimulus"

export default class extends Controller {

  // static targets = [ 'startDateInput', 'endDateInput' ]

  connect() {
    console.log("Coucou from Alert")
  }

  send(event){
    Swal.fire({
      icon: 'success',
      title: 'Success',
      showConfirmButton: false,
      timer: 1500
    })
  }

}
