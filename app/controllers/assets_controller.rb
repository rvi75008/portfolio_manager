class AssetsController < ApplicationController
    before_action :authenticate_user!

    def create
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.build(
            params.permit(:name, :portfolio_id, :currency_id, :quantity, :unit_price, :unit_purchasing_price, :asset_type,
                :account, :ticker, :sector, :sub_sector
            )
        )
        @asset.save
        redirect_to owner_path(@portfolio.owner), notice: "Asset was successfully created"
    end

    def new
        @asset = Asset.new
    end

    def destroy
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.find(params[:id])
        @asset.destroy
        redirect_to owner_path(@portfolio.owner), notice: "Asset was successfully deleted"
    end

    def edit
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.find(params[:id])
    end

    def update
        @portfolio = Portfolio.find(params[:portfolio_id])
        @asset = @portfolio.assets.find(params[:id])
        if @asset.update(asset_params)
            redirect_to owner_path(@portfolio.owner), notice: "Asset was successfully updated"
        else
            render :edit, status: :unprocessable_entity
        end
    end

    private
    def asset_params
        params.require("asset").permit(:name, :portfolio_id, :currency_id, :quantity, :unit_price, :unit_purchasing_price, :asset_type,
            :account, :ticker, :sector, :sub_sector
        )
    end
end
