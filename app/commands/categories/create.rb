module Categories
    class Create < Command

        def initialize(form)
            @form = form
        end

        def call
            
            return broadcast(:invalid) if form.invalid?

            create_category

            broadcast(:ok)        

        rescue ActiveRecord::RecordInvalid        
            broadcast(:invalid)
        end

        private

        attr_reader :form

        def create_category
            @category = Category.create!(
                                            name: form.name,
                                            position: form.position,
                                            ancestry: form.ancestry
                                        )
        end
    end
end