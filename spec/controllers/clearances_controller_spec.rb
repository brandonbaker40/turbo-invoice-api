# frozen_string_literal: true

require 'rails_helper'

RSpec.describe ClearancesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Clearance. As you add validations to Clearance, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:clearance).attributes }

  let(:invalid_attributes) { build(:clearance, user_id: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # ClearancesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      clearance = Clearance.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:clearances)).to eq([clearance])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      clearance = Clearance.create! valid_attributes
      get :show, params: { id: clearance.to_param }, session: valid_session
      expect(assigns(:clearance)).to eq(clearance)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Clearance' do
        expect do
          post :create, params: { clearance: valid_attributes }, session: valid_session
        end.to change(Clearance, :count).by(1)
      end

      it 'redirects to the created clearance' do
        post :create, params: { clearance: valid_attributes }, session: valid_session
        expect(assigns(:clearance)).to be_a(Clearance)
        expect(assigns(:clearance)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved clearance as @clearance' do
        post :create, params: { clearance: invalid_attributes }, session: valid_session
        expect(assigns(:clearance)).to be_a_new(Clearance)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes.merge('user_id' => 1)
      end

      it 'updates the requested clearance' do
        clearance = Clearance.create! valid_attributes
        put :update, params: { id: clearance.to_param, clearance: new_attributes }, session: valid_session
        clearance.reload
        expect(assigns(:clearance).user_id).to eq(1)
      end

      it 'redirects to the clearance' do
        clearance = Clearance.create! valid_attributes
        put :update, params: { id: clearance.to_param, clearance: valid_attributes }, session: valid_session
        expect(assigns(:clearance)).to eq(clearance)
      end
    end

    context 'with invalid params' do
      it 'assigns the clearance as @clearance' do
        clearance = Clearance.create! valid_attributes
        put :update, params: { id: clearance.to_param, clearance: invalid_attributes }, session: valid_session
        expect(assigns(:clearance)).to eq(clearance)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested clearance' do
      clearance = Clearance.create! valid_attributes
      expect do
        delete :destroy, params: { id: clearance.to_param }, session: valid_session
      end.to change(Clearance, :count).by(-1)
    end
  end
end
