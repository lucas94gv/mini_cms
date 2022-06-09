class Category < ApplicationRecord
    has_ancestry

    scope :parents, -> { where(ancestry: nil) }
    scope :child_of, -> (parent) { where(ancestry: parent) }
    scope :order_asc, -> { order(position: :asc) }
end