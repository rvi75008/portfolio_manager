require 'rails_helper'

RSpec.describe AssetsController, type: :controller do
  let(:owner) { FactoryBot.create(:owner) }
  let(:currency) { FactoryBot.create(:currency) }
  let(:portfolio) { FactoryBot.create(:portfolio, owner: owner, currency_id: currency.id) }
  let(:asset) { FactoryBot.create(:asset) }

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

  describe 'GET #new' do
    it 'assigns a new asset' do
      get :new, params: { portfolio_id: portfolio.id, owner_id: owner.id }
      expect(assigns(:asset)).to be_a_new(Asset)
    end
  end

  describe 'DELETE #destroy' do
    let!(:asset) { FactoryBot.create(:asset, portfolio: portfolio) }
    it 'destroys the asset' do
      expect {
        delete :destroy, params: { portfolio_id: portfolio.id, id: asset.id, owner_id: owner.id }
      }.to change(Asset, :count).by(-1)
    end

    it 'redirects to the owner page' do
      delete :destroy, params: { portfolio_id: portfolio.id, id: asset.id, owner_id: owner.id }
      expect(response).to redirect_to(owner_path(owner))
    end

    it 'sets a success notice' do
      delete :destroy, params: { portfolio_id: portfolio.id, id: asset.id, owner_id: owner.id }
      expect(flash[:notice]).to eq('Asset was successfully deleted')
    end
  end

  describe 'GET #edit' do
    let!(:asset) { FactoryBot.create(:asset, portfolio: portfolio) }
    it 'assigns the requested asset' do
      get :edit, params: { portfolio_id: asset.portfolio.id, id: asset.id, owner_id: asset.portfolio.owner.id }
      expect(assigns(:asset)).to eq(asset)
    end
  end

  describe 'PATCH #update' do
    let(:owner) { FactoryBot.create(:owner) }
    let(:currency) { FactoryBot.create(:currency) }
    let(:portfolio) { FactoryBot.create(:portfolio, owner: owner, currency_id: currency.id) }
    let!(:asset) { FactoryBot.create(:asset, portfolio: portfolio, currency_id: currency.id) }

    context 'with valid params' do
      let(:valid_params) do
        {
          asset: {
            name: 'Updated Asset',
            portfolio_id: portfolio.id,
            currency_id: 1,
            quantity: 20,
            unit_price: 100,
            unit_purchasing_price: 90,
            asset_type: 'Stock',
            account: 'Brokerage',
            ticker: 'AAPL',
            sector: 'Technology',
            sub_sector: 'Software'
          },
          owner_id: owner.id,
          portfolio_id: portfolio.id,
          id: asset.id
        }
      end

      it 'updates the asset' do
        patch :update, params: valid_params
        asset.reload
        expect(asset.name).to eq('Updated Asset')
        expect(asset.quantity).to eq(20)
      end

      it 'redirects to the owner page' do
        patch :update, params: valid_params
        expect(response).to redirect_to(owner_path(owner))
      end

      it 'sets a success notice' do
        patch :update, params: valid_params
        expect(flash[:notice]).to eq('Asset was successfully updated')
      end
    end

    context 'with invalid params' do
      let(:invalid_params) do
        {
          asset: {
            name: '', # Invalid name
            quantity: -5 # Invalid quantity
          },
          owner_id: owner.id,
          portfolio_id: portfolio.id,
          id: asset.id
        }
      end

      it 'does not update the asset' do
        old_name = asset.name
        old_quantity = asset.quantity
        patch :update, params: invalid_params
        asset.reload
        expect(asset.name).to eq(old_name)
        expect(asset.quantity).to eq(old_quantity)
      end

      it 'renders the edit template' do
        patch :update, params: invalid_params
        expect(response).to render_template(:edit)
      end

      it 'sets the status to unprocessable entity' do
        patch :update, params: invalid_params
        expect(response).to have_http_status(:unprocessable_entity)
      end
    end
  end
end
