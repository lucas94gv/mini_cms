module Categories
    class CategoryForm

        include ActiveModel::Model

        def self.attributes
            [:name, :position, :ancestry]
        end

        attr_accessor *self.attributes

        validates :name, presence: true

        validate :unique_name
        validate :unique_position

        private

        def unique_name
            errors.add(:name) if Category.exists?(name: name)
        end

        #   -------------------------------------------------------------------------------------
        #   validación para controlar que no se repita la posición según el nivel de la categoría
        #   -------------------------------------------------------------------------------------
        def unique_position
            case ancestry
            when nil
                errors.add(:position) if Category.parents.exists?(position: position)
            else                
                errors.add(:position) if Category.child_of(ancestry).exists?(position: position)
            end
        end
    end
end