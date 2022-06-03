class Category < ApplicationRecord
    has_ancestry

    scope :parents, -> { where(ancestry: nil) }
    scope :order_acs, -> { order(position: :asc) }
end
