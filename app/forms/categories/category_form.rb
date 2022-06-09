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

        def unique_position
            case ancestry
            when nil
                errors.add(:position) if Category.where(ancestry: nil).exists?(position: position)
            else
                errors.add(:position) if Category.where(ancestry: ancestry).exists?(position: position)
            end
        end
    end
end