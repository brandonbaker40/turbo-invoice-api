require 'rails_helper'

RSpec.describe AgencyRatesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # AgencyRate. As you add validations to AgencyRate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:agency_rate).attributes }

  let(:invalid_attributes) { build(:agency_rate, agency_id: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AgencyRatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      agency_rate = AgencyRate.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:agency_rates)).to eq([agency_rate])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      agency_rate = AgencyRate.create! valid_attributes
      get :show, params: {id: agency_rate.to_param}, session: valid_session
      expect(assigns(:agency_rate)).to eq(agency_rate)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new AgencyRate" do
        expect {
          post :create, params: {agency_rate: valid_attributes}, session: valid_session
        }.to change(AgencyRate, :count).by(1)
      end

      it "redirects to the created agency_rate" do
        post :create, params: {agency_rate: valid_attributes}, session: valid_session
        expect(assigns(:agency_rate)).to be_a(AgencyRate)
        expect(assigns(:agency_rate)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved agency_rate as @agency_rate" do
        post :create, params: {agency_rate: invalid_attributes}, session: valid_session
        expect(assigns(:agency_rate)).to be_a_new(AgencyRate)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge("agency_id" => 1)
      }

      it "updates the requested agency_rate" do
        agency_rate = AgencyRate.create! valid_attributes
        put :update, params: {id: agency_rate.to_param, agency_rate: new_attributes}, session: valid_session
        agency_rate.reload
        expect(assigns(:agency_rate).agency_id).to eq(1)
      end

      it "redirects to the agency_rate" do
        agency_rate = AgencyRate.create! valid_attributes
        put :update, params: {id: agency_rate.to_param, agency_rate: valid_attributes}, session: valid_session
        expect(assigns(:agency_rate)).to eq(agency_rate)
      end
    end

    context "with invalid params" do
      it "assigns the agency_rate as @agency_rate" do
        agency_rate = AgencyRate.create! valid_attributes
        put :update, params: {id: agency_rate.to_param, agency_rate: invalid_attributes}, session: valid_session
        expect(assigns(:agency_rate)).to eq(agency_rate)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested agency_rate" do
      agency_rate = AgencyRate.create! valid_attributes
      expect {
        delete :destroy, params: {id: agency_rate.to_param}, session: valid_session
      }.to change(AgencyRate, :count).by(-1)
    end
  end

end
