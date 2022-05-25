class CategoriesController < ApplicationController
  
  before_action :set_category, only: %i[ show edit update destroy ]
  before_action :category_form, only: %i[ create ]

  def index
    @categories = Category.all
  end

  def new
    @category = Category.new
  end

  def edit
  end

  def create
    category = Categories::Create.new(category_form)

    category.on(:ok) { 
                        redirect_to categories_path
                        flash[:success] = 'La categoría se ha creado correctamente'
                     }

    category.on(:invalid) {
                            redirect_to categories_path
                            flash[:error] = @form.errors.first.messages
                          }

    category.call
  end

  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to categories_path, notice: "La categoría se actualizó correctamente." }
        format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Categoría eliminada correctamente" }
      format.json { head :no_content }
    end
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
