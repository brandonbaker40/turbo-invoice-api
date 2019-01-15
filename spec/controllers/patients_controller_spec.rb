# frozen_string_literal: true

require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  # This should return the minimal set of attributes required to create a valid
  # Patient. As you add validations to Patient, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) { build(:patient).attributes }

  let(:invalid_attributes) { build(:patient, first_name: nil).attributes }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # PatientsController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe 'GET #index' do
    it 'returns a success response' do
      patient = Patient.create! valid_attributes
      get :index, params: {}, session: valid_session
      expect(assigns(:patients)).to eq([patient])
    end
  end

  describe 'GET #show' do
    it 'returns a success response' do
      patient = Patient.create! valid_attributes
      get :show, params: { id: patient.to_param }, session: valid_session
      expect(assigns(:patient)).to eq(patient)
    end
  end

  describe 'POST #create' do
    context 'with valid params' do
      it 'creates a new Patient' do
        expect do
          post :create, params: { patient: valid_attributes }, session: valid_session
        end.to change(Patient, :count).by(1)
      end

      it 'redirects to the created patient' do
        post :create, params: { patient: valid_attributes }, session: valid_session
        expect(assigns(:patient)).to be_a(Patient)
        expect(assigns(:patient)).to be_persisted
      end
    end

    context 'with invalid params' do
      it 'assigns a newly created but unsaved patient as @patient' do
        post :create, params: { patient: invalid_attributes }, session: valid_session
        expect(assigns(:patient)).to be_a_new(Patient)
      end
    end
  end

  describe 'PUT #update' do
    context 'with valid params' do
      let(:new_attributes) do
        valid_attributes.merge('first_name' => 'Salvatore')
      end

      it 'updates the requested patient' do
        patient = Patient.create! valid_attributes
        put :update, params: { id: patient.to_param, patient: new_attributes }, session: valid_session
        patient.reload
        expect(assigns(:patient).first_name).to eq('Salvatore')
      end

      it 'redirects to the patient' do
        patient = Patient.create! valid_attributes
        put :update, params: { id: patient.to_param, patient: valid_attributes }, session: valid_session
        expect(assigns(:patient)).to eq(patient)
      end
    end

    context 'with invalid params' do
      it 'assigns the patient as @patient' do
        patient = Patient.create! valid_attributes
        put :update, params: { id: patient.to_param, patient: invalid_attributes }, session: valid_session
        expect(assigns(:patient)).to eq(patient)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'destroys the requested patient' do
      patient = Patient.create! valid_attributes
      expect do
        delete :destroy, params: { id: patient.to_param }, session: valid_session
      end.to change(Patient, :count).by(-1)
    end
  end
end
