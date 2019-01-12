require 'rails_helper'

RSpec.describe ContractsController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # Contract. As you add validations to Contract, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:contract).attributes }

  let(:invalid_attributes) { build(:contract, agency_id: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ContractsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      contract = Contract.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:contracts)).to eq([contract])
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      contract = Contract.create! valid_attributes
      get :show, params: {id: contract.to_param}, session: valid_session
      expect(assigns(:contract)).to eq(contract)
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new Contract" do
        expect {
          post :create, params: {contract: valid_attributes}, session: valid_session
        }.to change(Contract, :count).by(1)
      end

      it "redirects to the created contract" do
        post :create, params: {contract: valid_attributes}, session: valid_session
        expect(assigns(:contract)).to be_a(Contract)
        expect(assigns(:contract)).to be_persisted
      end
    end

    context "with invalid params" do
      it "assigns a newly created but unsaved contract as @contract" do
        post :create, params: {contract: invalid_attributes}, session: valid_session
        expect(assigns(:contract)).to be_a_new(Contract)
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        valid_attributes.merge("agency_id" => 1)
      }

      it "updates the requested contract" do
        contract = Contract.create! valid_attributes
        put :update, params: {id: contract.to_param, contract: new_attributes}, session: valid_session
        contract.reload
        expect(assigns(:contract).agency_id).to eq(1)
      end

      it "redirects to the contract" do
        contract = Contract.create! valid_attributes
        put :update, params: {id: contract.to_param, contract: valid_attributes}, session: valid_session
        expect(assigns(:contract)).to eq(contract)
      end
    end

    context "with invalid params" do
      it "assigns the contract as @contract" do
        contract = Contract.create! valid_attributes
        put :update, params: {id: contract.to_param, contract: invalid_attributes}, session: valid_session
        expect(assigns(:contract)).to eq(contract)
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested contract" do
      contract = Contract.create! valid_attributes
      expect {
        delete :destroy, params: {id: contract.to_param}, session: valid_session
      }.to change(Contract, :count).by(-1)
    end
  end

end
