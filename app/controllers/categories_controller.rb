class CategoriesController < ApplicationController
  
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :category_form, only: %i[ create update ]

  def index
    @categories = Category.order(created_at: :asc)
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create

    category = Categories::CreateUpdateCommand.new(category_form)

    category.on(:ok) { 
                        redirect_to categories_path
                        flash[:success] = t('categories.create')
                     }

    category.on(:invalid) {
                            redirect_to categories_path
                            flash[:error] = @form.errors.first.messages
                          }

    category.call
  end

  def update

    category = Categories::CreateUpdateCommand.new(category_form, @category)

    category.on(:ok) { 
                        redirect_to categories_path
                        flash[:success] = t('categories.update')
                     }

    category.on(:invalid) {
                            redirect_to categories_path
                            flash[:error] = @form.errors.first.messages
                          }

    category.call
  end

  def destroy
    @category.destroy
    redirect_to categories_path
    flash[:success] = t('categories.delete')
  end

  private

    def category_form
      Categories::CategoryForm.new(category_params)
    end

    def set_category
      @category = Category.find(params[:id])
    end

    def category_params
      params.require(:category).permit(:name, :position)
    end
end
