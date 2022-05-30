module Categories
    class CategoryForm

        include ActiveModel::Model

        def self.attributes
            [:name, :position, :ancestry]
        end

        attr_accessor *self.attributes

        validates :name, presence: true

        validate :unique_name

        private

        def unique_name
            errors.add(:name) if Category.exists?(name: name)
        end
    end
end