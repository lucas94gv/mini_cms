# frozen_string_literal: true

module Categories
  # -------------------------------------------------------
  # Componente para el formulario de creación de categorías
  # Se usa en la creación de categorías padre como hijas
  # -------------------------------------------------------
  class FormComponent < ViewComponent::Base

    def initialize(model:, ancestry:)
      @model = model
      @ancestry = ancestry
    end  

  end
end