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
            return false if Category.find_by(name: name).present?

            true
        end
    end
end