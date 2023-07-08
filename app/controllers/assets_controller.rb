class AssetsController < ApplicationController
  def create
      @portfolio = Portfolio.find(params[:portfolio_id])
      @asset = @portfolio.assets.build(asset_params)
      begin
          @asset.save
          redirect_to portfolio_path(@portfolio),
          notice: "Asset was successfully created"
      rescue ActiveRecord::RecordNotUnique
          @asset.errors.add(:base, "Asset already exists")
          render :new , status: :unprocessable_entity
      end
  end
  def edit
      @portfolio = Portfolio.find(params[:portfolio_id])
      @asset = @portfolio.assets.find(params[:id])
  end
  def update
      @portfolio = Portfolio.find(params[:portfolio_id])
      @asset = @portfolio.assets.find(params[:id])
      if @asset.update(asset_params)
          redirect_to portfolio_path(@portfolio),
          notice: "Asset was successfully updated"
      else
          render :edit, status: :unprocessable_entity
      end
  end
  def destroy
      @portfolio = Portfolio.find(params[:portfolio_id])
      @asset = @portfolio.assets.find(params[:id])
      @asset.destroy
      redirect_to portfolio_path(@portfolio), status: :see_other
  end
  private
      def asset_params
          params.require(:asset).permit(:name, :description, :quantity, :price)
      end
end