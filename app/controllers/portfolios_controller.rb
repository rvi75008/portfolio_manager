class PortfoliosController < ApplicationController
    def create
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.create(portfolio_params)
        redirect_to owner_path(@owner)
    end

    def destroy
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.find(params[:id])
        @portfolio.destroy
        redirect_to owner_path(@owner), status: :see_other
    end

    private 
    def portfolio_params
        params.require(:portfolio).permit(:name)
    end

    def show
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.find(params[:id])
    end


    def edit
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.find(params[:id])
    end

    def update
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.find(params[:id])
        if @portfolio.update(portfolio_params)
            redirect_to owner_path(@owner)
        else
            render 'edit'
        end
    end
end
