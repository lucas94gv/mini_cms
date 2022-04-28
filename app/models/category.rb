class Category < ApplicationRecord
    has_ancestry

    validates :name, presence: true, uniqueness: { case_sensitive: false }
end
