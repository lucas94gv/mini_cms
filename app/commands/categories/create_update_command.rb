module Categories

    #   -----------------------------------------------------------------
    #   Command que controla la creación o actualización de una categoría
    #
    #   Si existe la categoría actualiza, si no la crea
    #   -----------------------------------------------------------------

    class CreateUpdateCommand < Command
        
        #   ----------------------------------------------------------------------------
        #   - Category nil, indica categoria padre
        #   - Si especificamos otro category en el parámetro, esta será la categoría padre
        #   ----------------------------------------------------------------------------
        def initialize(form, category = nil)
            @form = form
            @category = category
        end

        def call
            
            return broadcast(:invalid) if form.invalid?

            create_update

            broadcast(:ok)

        rescue ActiveRecord::RecordInvalid        
            broadcast(:invalid)
        end

        private

        attr_reader :form

        #   -----------------------------------------------------
        #   Si no existe la categoría se crea, si no se actualiza
        #   -----------------------------------------------------
        def create_update
            @category.nil? ? create_category : update_category
        end

        def create_category
            Category.create!(
                                name: form.name,
                                position: form.position,
                                ancestry: form.ancestry
                            )
        end

        def update_category
            @category.update!(
                name: form.name,
                position: form.position,
                ancestry: form.ancestry
            )
        end
    end
end