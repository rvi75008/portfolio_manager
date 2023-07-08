class AssetsController < ApplicationController
    def create
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.build(asset_params)
        @asset.save
        redirect_to owner_path(@portfolio.owner), notice: "Asset was successfully created"
    end

    def new
        @asset = Asset.new
    end

    def show
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.find(params[:id])
    end

    def index
        @portfolio = Portfolio.find(params[:portfolio_id])
        @assets = @portfolio.assets.all
    end

    private
    def asset_params
        params.permit(:name, :portfolio_id, :currency_id, :quantity, :unit_price, :unit_purchasing_price, :asset_type,
            :account, :ticker, :sector, :sub_sector
        )
    end
end
