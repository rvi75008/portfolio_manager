require 'rails_helper'

RSpec.describe OwnersController, type: :controller do
  describe "GET #index" do
    it "assigns all owners to @owners" do
      owner1 = FactoryBot.create(:owner)
      owner2 = FactoryBot.create(:owner)
      
      get :index
      
      expect(assigns(:owners)).to match_array([owner1, owner2])
    end
    
    it "renders the index template" do
      get :index
      
      expect(response).to render_template(:index)
    end
  end

  describe "GET #show" do
    it "assigns the requested owner to @owner" do
      owner = FactoryBot.create(:owner)
      
      get :show, params: { id: owner.id }
      
      expect(assigns(:owner)).to eq(owner)
    end
    
    it "renders the show template" do
      owner = FactoryBot.create(:owner)
      
      get :show, params: { id: owner.id }
      
      expect(response).to render_template(:show)
    end
  end

  describe "GET #new" do
    it "assigns a new owner to @owner" do
      get :new
      
      expect(assigns(:owner)).to be_a_new(Owner)
    end
    
    it "renders the new template" do
      get :new
      
      expect(response).to render_template(:new)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new owner" do
        expect {
          post :create, params: { owner: { first_name: "John", last_name: "Doe" } }
        }.to change(Owner, :count).by(1)
      end
      
      it "redirects to the created owner" do
        post :create, params: { owner: { first_name: "John", last_name: "Doe" } }
        
        expect(response).to redirect_to(Owner.last)
      end
    end
    
    context "with invalid params" do
      it "does not create a new owner" do
        expect {
          post :create, params: { owner: { first_name: nil, last_name: "Doe" } }
        }.to_not change(Owner, :count)
      end
      
      it "renders the new template with unprocessable_entity status" do
        post :create, params: { owner: { first_name: nil, last_name: "Doe" } }
        
        expect(response).to render_template(:new)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "GET #edit" do
    it "assigns the requested owner to @owner" do
      owner = FactoryBot.create(:owner)
      
      get :edit, params: { id: owner.id }
      
      expect(assigns(:owner)).to eq(owner)
    end
    
    it "renders the edit template" do
      owner = FactoryBot.create(:owner)
      
      get :edit, params: { id: owner.id }
      
      expect(response).to render_template(:edit)
    end
  end

  describe "PATCH #update" do
    context "with valid params" do
      it "updates the requested owner" do
        owner = FactoryBot.create(:owner)
        
        patch :update, params: { id: owner.id, owner: { first_name: "Updated", last_name: "Name" } }
        
        owner.reload
        expect(owner.first_name).to eq("Updated")
        expect(owner.last_name).to eq("Name")
      end
      
      it "redirects to the updated owner" do
        owner = FactoryBot.create(:owner)
        
        patch :update, params: { id: owner.id, owner: { first_name: "Updated", last_name: "Name" } }
        
        expect(response).to redirect_to(owner)
      end
    end
    
    context "with invalid params" do
      it "does not update the requested owner" do
        owner = FactoryBot.create(:owner)
        
        patch :update, params: { id: owner.id, owner: { first_name: nil, last_name: "Name" } }
        
        owner.reload
        expect(owner.first_name).to_not be_nil
        expect(owner.last_name).to_not eq("Name")
      end
      
      it "renders the edit template with unprocessable_entity status" do
        owner = FactoryBot.create(:owner)
        
        patch :update, params: { id: owner.id, owner: { first_name: nil, last_name: "Name" } }
        
        expect(response).to render_template(:edit)
        expect(response.status).to eq(422)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested owner" do
      owner = FactoryBot.create(:owner)
      
      expect {
        delete :destroy, params: { id: owner.id }
      }.to change(Owner, :count).by(-1)
    end
    
    it "redirects to the owners index" do
      owner = FactoryBot.create(:owner)
      
      delete :destroy, params: { id: owner.id }
      
      expect(response).to redirect_to(owners_path)
      expect(response.status).to eq(303)
    end
  end
end
