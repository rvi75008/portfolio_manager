class CurrenciesController < ApplicationController
    before_action :authenticate_user!

    def index
        @currencies = Currency.all
    end

    def show
        @currency = Currency.find(params[:id])
    end

    def new
        @currency = Currency.new
    end

    def create
        @currency = Currency.new(currency_params)
        begin
            if @currency.save
                redirect_to owners_path
            else
                render :new, status: :unprocessable_entity
            end
        rescue ActiveRecord::RecordNotUnique
            @currency.errors.add(:base, "Currency already exists")
            render :new , status: :unprocessable_entity
        end
    end

    def edit
        @currency = Currency.find(params[:id])
    end

    def update
        @currency = currency.find(params[:id])
        if @currency.update(currency_params)
            redirect_to owners_path
        else
            render :edit, status: :unprocessable_entity
        end
    end

    def destroy
        @currency = Currency.find(params[:id])
        @currency.destroy
            redirect_to owners_path
    end

    private
    def currency_params
        params.require(:currency).permit(:name, :code, :symbol)
    end
end
