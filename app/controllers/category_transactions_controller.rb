class CategoryTransactionsController < ApplicationController
  before_action :set_category_transaction, only: %i[ show edit update destroy ]

  # GET /category_transactions or /category_transactions.json
  def index
    @category_transactions = CategoryTransaction.where(category: params[:category_id]).includes(:category)
    @total = 0
    @category_transactions.each do |category_transaction|
      @total += category_transaction.payment
    end
    @total
  end

  # GET /category_transactions/1 or /category_transactions/1.json
  def show
    @category_transaction = CategoryTransaction.includes(:category).find(params[:id])
  end

  # GET /category_transactions/new
  def new
    @category_transaction = CategoryTransaction.new
  end

  # GET /category_transactions/1/edit
  def edit
  end

  # POST /category_transactions or /category_transactions.json
  def create
    # p params[:category_id]
    @category_transaction = CategoryTransaction.new(category_transaction_params)
    # @category_transaction.category = params[:category_id]

    respond_to do |format|
      if @category_transaction.save
        format.html { redirect_to category_category_transaction_url(id: @category_transaction.id), notice: "Category transaction was successfully created." }
        format.json { render :show, status: :created, location: @category_transaction }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @category_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /category_transactions/1 or /category_transactions/1.json
  def update
    respond_to do |format|
      if @category_transaction.update(category_transaction_params)
        format.html { redirect_to category_category_transaction_url(@category_transaction), notice: "Category transaction was successfully updated." }
        format.json { render :show, status: :ok, location: @category_transaction }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @category_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /category_transactions/1 or /category_transactions/1.json
  def destroy
    @category_transaction.destroy

    respond_to do |format|
      format.html { redirect_to "/categories/#{params[:category_id]}/category_transactions", notice: "Category transaction was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  # method to calculate the total amount of money spent in a category

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_category_transaction
      @category_transaction = CategoryTransaction.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def category_transaction_params
      params.require(:category_transaction).permit(:name, :photo, :description, :payment, :category_id, :image)
    end
end
