import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "form" ]

    //  --------------------------------------------------------------
    //  Función que oculta y muestra el formulario de categorías hijas
    //  --------------------------------------------------------------
    toggle_form() {
        this.formTarget.classList.toggle('is-block');
    }
}
