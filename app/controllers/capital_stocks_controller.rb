class CapitalStocksController < ApplicationController
  def index
    @stocks = CapitalStock.all
  end

  def new
    @stock = CapitalStock.new
  end

  def create
    @stock = CapitalStock.new(capital_stock_params)
    if @stock.save
      redirect_to @stock, notice: 'Successfully saved stock'
    else
      render :new
    end
  end

  def edit
    @stock = CapitalStock.find(params[:id])
  end

  def update
    @stock = CapitalStock.find(params[:id])
    if @stock.update(capital_stock_params)
      redirect_to @stock, notice: 'Stock was successfully updated.'
    else
      render :edit
    end
  end

  def show
    @stock = CapitalStock.find(params[:id])
  end

  def destroy
    @stock = CapitalStock.find(params[:id])
    @stock.destroy
    redirect_to root_path, notice: 'Stock data was successfully deleted!'
  end

  private

  def capital_stock_params
    params.require(:capital_stock).permit(:name, :price, :quantity, :percentage, :years)
  end
end
