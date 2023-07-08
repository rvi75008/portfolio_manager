require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  let(:owner) { FactoryBot.create(:owner) }
  let(:currency) { FactoryBot.create(:currency) }
  let(:portfolio_params) { { name: "Portfolio 1", currency_id: currency.id } }

  describe "POST #create" do
    context "with valid params" do
      it "creates a new portfolio" do
        expect {
          post :create, params: { owner_id: owner.id, portfolio: portfolio_params }
        }.to change(Portfolio, :count).by(1)
      end

      it "redirects to the owner's path" do
        post :create, params: { owner_id: owner.id, portfolio: { name: "New Portfolio", currency_id: currency.id } }

        expect(response).to redirect_to(owner_path(owner))
      end
    end

    context "when portfolio name already exists" do
      before do
        allow(Owner).to receive(:find).and_return(owner)
        allow(owner.portfolios).to receive(:build).and_return(
          Portfolio.new(:name => "Portfolio 1", :currency_id => 2))
        allow_any_instance_of(Portfolio).to receive(:save).and_raise(ActiveRecord::RecordNotUnique)
      end

      it "renders new with error message" do
        post :create, params: { owner_id: owner.id, portfolio: portfolio_params }

        expect(response).to render_template(:new)
        expect(assigns(:portfolio).errors[:name]).to include("already exists")
      end
    end
  end


  describe "DELETE #destroy" do
    let!(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }

    it "destroys the requested portfolio" do
      expect {
        delete :destroy, params: { owner_id: owner.id, id: portfolio.id }
      }.to change(Portfolio, :count).by(-1)
    end

    it "redirects to the owner's path with status :see_other" do
      delete :destroy, params: { owner_id: owner.id, id: portfolio.id }

      expect(response).to redirect_to(owner_path(owner))
      expect(response).to have_http_status(:see_other)
    end
  end


  describe "GET #show" do
    let!(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }

    it "assigns the requested portfolio to @portfolio" do
      get :show, params: { owner_id: owner.id, id: portfolio.id }

      expect(assigns(:portfolio)).to eq(portfolio)
    end
  end


  describe "GET #edit" do
    let!(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }

    it "assigns the requested portfolio to @portfolio" do
      get :edit, params: { owner_id: owner.id, id: portfolio.id }

      expect(assigns(:portfolio)).to eq(portfolio)
    end

    it "renders the edit template" do
      get :edit, params: { owner_id: owner.id, id: portfolio.id }

      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    let(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }

    context "with valid params" do
      it "updates the requested portfolio" do
        patch :update, params: { owner_id: owner.id, id: portfolio.id, portfolio: { name: "Updated Portfolio" } }

        portfolio.reload
        expect(portfolio.name).to eq("Updated Portfolio")
      end

      it "redirects to the owner's path" do
        patch :update, params: { owner_id: owner.id, id: portfolio.id, portfolio: { name: "Updated Portfolio" } }

        expect(response).to redirect_to(owner_path(owner))
      end
    end

    context "with invalid params" do
      it "does not update the requested portfolio" do
        patch :update, params: { owner_id: owner.id, id: portfolio.id, portfolio: { name: nil } }

        portfolio.reload
        expect(portfolio.name).to_not be_nil
      end

      it "renders the edit template" do
        patch :update, params: { owner_id: owner.id, id: portfolio.id, portfolio: { name: nil } }

        expect(response).to render_template(:edit)
      end
    end
  end
end
