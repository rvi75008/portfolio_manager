class PortfoliosController < ApplicationController
    def create
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.build(portfolio_params)
        begin  
            @portfolio.save
            redirect_to owner_path(@owner), notice: "Portfolio was successfully created"
        rescue ActiveRecord::RecordNotUnique
            @portfolio.errors.add(:name, "already exists")
            render :new
        end
    end

    def destroy
        @owner = Owner.find(params[:owner_id])
        @portfolio = @owner.portfolios.find(params[:id])
        @portfolio.destroy
        redirect_to owner_path(@owner), status: :see_other
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

    private 
    def portfolio_params
        params.require(:portfolio).permit(:name, :currency_id, :description)
    end
end
