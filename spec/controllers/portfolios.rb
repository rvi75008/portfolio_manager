require 'rails_helper'

RSpec.describe PortfoliosController, type: :controller do
  describe "POST #create" do
    let(:owner) { FactoryBot.create(:owner) }
    
    context "with valid params" do
      it "creates a new portfolio" do
        expect {
          post :create, params: { owner_id: owner.id, portfolio: { name: "New Portfolio" } }
        }.to change(Portfolio, :count).by(1)
      end
      
      it "redirects to the owner's path" do
        post :create, params: { owner_id: owner.id, portfolio: { name: "New Portfolio" } }
        
        expect(response).to redirect_to(owner_path(owner))
      end
    end
  end

  describe "DELETE #destroy" do
    let(:owner) { FactoryBot.create(:owner) }
    let(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }
    
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

  describe "GET #edit" do
    let(:owner) { FactoryBot.create(:owner) }
    let(:portfolio) { FactoryBot.create(:portfolio, owner: owner) }
    
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
    let(:owner) { FactoryBot.create(:owner) }
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
