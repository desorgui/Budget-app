class CategoriesController < ApplicationController
  before_action only: %i[ index show edit new destroy ]

  # GET /categories or /categories.json
  def index
    @categories = Category.where(user: current_user).includes(:user)
    @totals = []
    @categories.each do |category|
      @totals << find_total(category.id)
    end
  end

  # GET /categories/1 or /categories/1.json
  def show
    @category = Category.includes(:user).find(params[:id])
  end

  def find_total(category_id)
    @category_transactions = CategoryTransaction.where(category: category_id).includes(:category)
    @total1 = 0
    @category_transactions.each do |category_transaction|
      @total1 += category_transaction.payment
    end
    @total1
  end

  # GET /categories/new
  def new
    @category = Category.new
  end

  # GET /categories/1/edit
  def edit
  end

  # POST /categories or /categories.json
  def create
    @category = Category.new(category_params)
    @category.user = current_user
    respond_to do |format|
      if @category.save
        format.html { redirect_to category_url(@category), notice: "Category was successfully created." }
        # format.json { render :show, status: :created, location: @category }
      else
        format.html { render :new, status: :unprocessable_entity }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /categories/1 or /categories/1.json
  def update
    respond_to do |format|
      if @category.update(category_params)
        format.html { redirect_to category_url(@category), notice: "Category was successfully updated." }
        # format.json { render :show, status: :ok, location: @category }
      else
        format.html { render :edit, status: :unprocessable_entity }
        # format.json { render json: @category.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /categories/1 or /categories/1.json
  def destroy
    @category.destroy

    respond_to do |format|
      format.html { redirect_to categories_url, notice: "Category was successfully destroyed." }
      # format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    # def set_category
    #   @category = Category.find(params[:id])
    # end

    # Only allow a list of trusted parameters through.
    def category_params
      params.require(:category).permit(:title, :photo, :image)
    end
end
