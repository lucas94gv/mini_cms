import { Controller } from "stimulus"

export default class extends Controller {
    static targets = [ "form", "childs" ]
    static values = { element: String }

    //  --------------------------------------------------------------
    //  Función que oculta y muestra el formulario de categorías hijas
    //  --------------------------------------------------------------
    toggle_form() {
        this.formTarget.classList.toggle('is-block');
    }

    //  ------------------------------------------------------------------
    //  Función que oculta y muestra el componente de las categorías hijas
    //  ------------------------------------------------------------------
    toggle_childs() {        
        this.childsTarget.classList.toggle('is-block');
    }    
}
