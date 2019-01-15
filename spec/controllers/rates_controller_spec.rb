# frozen_string_literal: true

require 'rails_helper'

RSpec.describe RatesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Rate. As you add validations to Rate, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:rate).attributes }

  let(:invalid_attributes) { build(:rate, visit_type_id: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # RatesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      rate = Rate.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:rates)).to eq([rate])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      rate = Rate.create! valid_attributes
      get :show, params: { id: rate.to_param }, session: valid_session
      expect(assigns(:rate)).to eq(rate)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Rate' do
        expect do
          post :create, params: { rate: valid_attributes }, session: valid_session
        end.to change(Rate, :count).by(1)
      end

      it 'redirects to the created rate' do
        post :create, params: { rate: valid_attributes }, session: valid_session
        expect(assigns(:rate)).to be_a(Rate)
        expect(assigns(:rate)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved rate as @rate' do
        post :create, params: { rate: invalid_attributes }, session: valid_session
        expect(assigns(:rate)).to be_a_new(Rate)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes.merge('visit_type_id' => 1)
      end

      it 'updates the requested rate' do
        rate = Rate.create! valid_attributes
        put :update, params: { id: rate.to_param, rate: new_attributes }, session: valid_session
        rate.reload
        expect(assigns(:rate).visit_type_id).to eq(1)
      end

      it 'redirects to the rate' do
        rate = Rate.create! valid_attributes
        put :update, params: { id: rate.to_param, rate: valid_attributes }, session: valid_session
        expect(assigns(:rate)).to eq(rate)
      end
    end

    context 'with invalid params' do
      it 'assigns the rate as @rate' do
        rate = Rate.create! valid_attributes
        put :update, params: { id: rate.to_param, rate: invalid_attributes }, session: valid_session
        expect(assigns(:rate)).to eq(rate)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested rate' do
      rate = Rate.create! valid_attributes
      expect do
        delete :destroy, params: { id: rate.to_param }, session: valid_session
      end.to change(Rate, :count).by(-1)
    end
  end
end
