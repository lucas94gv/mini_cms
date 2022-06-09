class Category < ApplicationRecord
    has_ancestry

    scope :parents, -> { where(ancestry: nil) }
    scope :order_asc, -> { order(position: :asc) }
end
