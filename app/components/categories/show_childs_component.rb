# frozen_string_literal: true
module Categories
  class ShowChildsComponent < ViewComponent::Base

    def initialize(category:)
      @category = category
    end

    def childs
      @category.children
    end
    
  end
end