# frozen_string_literal: true

require 'rails_helper'

RSpec.describe DisciplinesController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Discipline. As you add validations to Discipline, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:discipline).attributes }

  let(:invalid_attributes) { build(:discipline, name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # DisciplinesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      discipline = Discipline.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:disciplines)).to eq([discipline])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      discipline = Discipline.create! valid_attributes
      get :show, params: { id: discipline.to_param }, session: valid_session
      expect(assigns(:discipline)).to eq(discipline)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Discipline' do
        expect do
          post :create, params: { discipline: valid_attributes }, session: valid_session
        end.to change(Discipline, :count).by(1)
      end

      it 'redirects to the created discipline' do
        post :create, params: { discipline: valid_attributes }, session: valid_session
        expect(assigns(:discipline)).to be_a(Discipline)
        expect(assigns(:discipline)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved discipline as @discipline' do
        post :create, params: { discipline: invalid_attributes }, session: valid_session
        expect(assigns(:discipline)).to be_a_new(Discipline)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes.merge('name' => 'Wizardry')
      end

      it 'updates the requested discipline' do
        discipline = Discipline.create! valid_attributes
        put :update, params: { id: discipline.to_param, discipline: new_attributes }, session: valid_session
        discipline.reload
        expect(assigns(:discipline).name).to eq('Wizardry')
      end

      it 'redirects to the discipline' do
        discipline = Discipline.create! valid_attributes
        put :update, params: { id: discipline.to_param, discipline: valid_attributes }, session: valid_session
        expect(assigns(:discipline)).to eq(discipline)
      end
    end

    context 'with invalid params' do
      it 'assigns the discipline as @discipline' do
        discipline = Discipline.create! valid_attributes
        put :update, params: { id: discipline.to_param, discipline: invalid_attributes }, session: valid_session
        expect(assigns(:discipline)).to eq(discipline)
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
