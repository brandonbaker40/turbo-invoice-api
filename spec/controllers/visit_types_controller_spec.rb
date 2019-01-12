require 'rails_helper'

RSpec.describe VisitTypesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # VisitType. As you add validations to VisitType, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:visit_type).attributes }

  let(:invalid_attributes) { build(:visit_type, name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VisitTypesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      visit_type = VisitType.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:visit_types)).to eq([visit_type])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      visit_type = VisitType.create! valid_attributes
      get :show, params: {id: visit_type.to_param}, session: valid_session
      expect(assigns(:visit_type)).to eq(visit_type)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new VisitType" do
        expect {
          post :create, params: {visit_type: valid_attributes}, session: valid_session
        }.to change(VisitType, :count).by(1)
      end

      it "redirects to the created visit_type" do
        post :create, params: {visit_type: valid_attributes}, session: valid_session
        expect(assigns(:visit_type)).to be_a(VisitType)
        expect(assigns(:visit_type)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved visit_type as @visit_type" do
        post :create, params: {visit_type: invalid_attributes}, session: valid_session
        expect(assigns(:visit_type)).to be_a_new(VisitType)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge("name" => "Magic Healing")
      }

      it "updates the requested visit_type" do
        visit_type = VisitType.create! valid_attributes
        put :update, params: {id: visit_type.to_param, visit_type: new_attributes}, session: valid_session
        visit_type.reload
        expect(assigns(:visit_type).name).to eq("Magic Healing")
      end

      it "redirects to the visit_type" do
        visit_type = VisitType.create! valid_attributes
        put :update, params: {id: visit_type.to_param, visit_type: valid_attributes}, session: valid_session
        expect(assigns(:visit_type)).to eq(visit_type)
      end
    end

    context "with invalid params" do
      it "assigns the visit_type as @visit_type" do
        visit_type = VisitType.create! valid_attributes
        put :update, params: {id: visit_type.to_param, visit_type: invalid_attributes}, session: valid_session
        expect(assigns(:visit_type)).to eq(visit_type)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested visit_type" do
      visit_type = VisitType.create! valid_attributes
      expect {
        delete :destroy, params: {id: visit_type.to_param}, session: valid_session
      }.to change(VisitType, :count).by(-1)
    end
  end

end
