# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  let(:valid_attributes) do
    skip('Add a hash of attributes valid for your model')
  end

  let(:invalid_attributes) do
    skip('Add a hash of attributes invalid for your model')
  end

  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      discipline = Discipline.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      discipline = Discipline.create! valid_attributes
      get :show, params: { id: discipline.to_param }, session: valid_session
      expect(response).to be_successful
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Discipline' do
        expect do
          post :create, params: { discipline: valid_attributes }, session: valid_session
        end.to change(Discipline, :count).by(1)
      end

      it 'renders a JSON response with the new discipline' do
        post :create, params: { discipline: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:created)
        expect(response.content_type).to eq('application/json')
        expect(response.location).to eq(discipline_url(Discipline.last))
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the new discipline' do
        post :create, params: { discipline: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        skip('Add a hash of attributes valid for your model')
      end

      it 'updates the requested discipline' do
        discipline = Discipline.create! valid_attributes
        put :update, params: { id: discipline.to_param, discipline: new_attributes }, session: valid_session
        discipline.reload
        skip('Add assertions for updated state')
      end

      it 'renders a JSON response with the discipline' do
        discipline = Discipline.create! valid_attributes

        put :update, params: { id: discipline.to_param, discipline: valid_attributes }, session: valid_session
        expect(response).to have_http_status(:ok)
        expect(response.content_type).to eq('application/json')
      end
    end

    context 'with invalid params' do
      it 'renders a JSON response with errors for the discipline' do
        discipline = Discipline.create! valid_attributes

        put :update, params: { id: discipline.to_param, discipline: invalid_attributes }, session: valid_session
        expect(response).to have_http_status(:unprocessable_entity)
        expect(response.content_type).to eq('application/json')
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested discipline' do
      discipline = Discipline.create! valid_attributes
      expect do
        delete :destroy, params: { id: discipline.to_param }, session: valid_session
      end.to change(Discipline, :count).by(-1)
    end
  end
end
