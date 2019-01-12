require 'rails_helper'

RSpec.describe VisitsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Visit. As you add validations to Visit, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:visit).attributes }

  let(:invalid_attributes) { build(:visit, patient_id: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # VisitsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      visit = Visit.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:visits)).to eq([visit])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      visit = Visit.create! valid_attributes
      get :show, params: {id: visit.to_param}, session: valid_session
      expect(assigns(:visit)).to eq(visit)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Visit" do
        expect {
          post :create, params: {visit: valid_attributes}, session: valid_session
        }.to change(Visit, :count).by(1)
      end

      it "redirects to the created visit" do
        post :create, params: {visit: valid_attributes}, session: valid_session
        expect(assigns(:visit)).to be_a(Visit)
        expect(assigns(:visit)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved visit as @visit" do
        post :create, params: {visit: invalid_attributes}, session: valid_session
        expect(assigns(:visit)).to be_a_new(Visit)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge(patient_id: "Some Other Name")
      }

      it "updates the requested visit" do
        visit = Visit.create! valid_attributes
        put :update, params: {id: visit.to_param, visit: new_attributes}, session: valid_session
        visit.reload
        expect(assigns(:visit).patient_id).to eq("Some Other Name")
      end

      it "redirects to the visit" do
        visit = Visit.create! valid_attributes
        put :update, params: {id: visit.to_param, visit: valid_attributes}, session: valid_session
        expect(assigns(:visit)).to eq(visit)
      end
    end

    context "with invalid params" do
      it "assigns the visit as @visit" do
        visit = Visit.create! valid_attributes
        put :update, params: {id: visit.to_param, visit: invalid_attributes}, session: valid_session
        expect(assigns(:visit)).to eq(visit)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested visit" do
      visit = Visit.create! valid_attributes
      expect {
        delete :destroy, params: {id: visit.to_param}, session: valid_session
      }.to change(Visit, :count).by(-1)
    end
  end

end
