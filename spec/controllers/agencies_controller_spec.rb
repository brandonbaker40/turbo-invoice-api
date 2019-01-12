# frozen_string_literal: true

require 'rails_helper'

RSpec.describe AgenciesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Agency. As you add validations to Agency, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:agency).attributes }

  let(:invalid_attributes) { build(:agency, name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # AgenciesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      agency = Agency.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:agencies)).to eq([agency])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      agency = Agency.create! valid_attributes
      get :show, params: { id: agency.to_param }, session: valid_session
      expect(assigns(:agency)).to eq(agency)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Agency' do
        expect do
          post :create, params: { agency: valid_attributes }, session: valid_session
        end.to change(Agency, :count).by(1)
      end

      it 'redirects to the created agency' do
        post :create, params: { agency: valid_attributes }, session: valid_session
        expect(assigns(:agency)).to be_a(Agency)
        expect(assigns(:agency)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved agency as @agency' do
        post :create, params: { agency: invalid_attributes }, session: valid_session
        expect(assigns(:agency)).to be_a_new(Agency)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes.merge('name' => 'Gringots Home Health')
      end

      it 'updates the requested agency' do
        agency = Agency.create! valid_attributes
        put :update, params: { id: agency.to_param, agency: new_attributes }, session: valid_session
        agency.reload
        expect(assigns(:agency).name).to eq('Gringots Home Health')
      end

      it 'redirects to the agency' do
        agency = Agency.create! valid_attributes
        put :update, params: { id: agency.to_param, agency: valid_attributes }, session: valid_session
        expect(assigns(:agency)).to eq(agency)
      end
    end

    context 'with invalid params' do
      it 'assigns the agency as @agency' do
        agency = Agency.create! valid_attributes
        put :update, params: { id: agency.to_param, agency: invalid_attributes }, session: valid_session
        expect(assigns(:agency)).to eq(agency)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested agency' do
      agency = Agency.create! valid_attributes
      expect do
        delete :destroy, params: { id: agency.to_param }, session: valid_session
      end.to change(Agency, :count).by(-1)
    end
  end
end
