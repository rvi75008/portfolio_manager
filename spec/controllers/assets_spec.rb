require 'rails_helper'

RSpec.describe AssetsController, type: :controller do
  let(:owner) { FactoryBot.create(:owner) }
  let(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }

  describe 'POST #create' do
    context 'with valid params' do
      let(:valid_params) do
        {
          name: 'Asset 1',
          portfolio_id: portfolio.id,
          owner_id: owner.id,
          currency_id: 1,
          quantity: 10,
          unit_price: 100,
          unit_purchasing_price: 90,
          asset_type: 'Stock',
          account: 'Brokerage',
          ticker: 'AAPL',
          sector: 'Technology',
          sub_sector: 'Software'
        }
      end

      it 'creates a new asset' do
        expect {
          post :create, params:  valid_params
        }.to change(Asset, :count).by(1)
      end

      it 'redirects to the owner page' do
        post :create, params: valid_params
        expect(response).to redirect_to(owner_path(owner))
      end

      it 'sets a success notice' do
        post :create, params: valid_params
        expect(flash[:notice]).to eq('Asset was successfully created')
      end
    end
  end
end
