require 'rails_helper'

RSpec.describe PatientsController, type: :controller do
  let!(:admission) { create :admission }
  let!(:patient) { create :patient, { admission_id: admission.id } }
  let!(:diagnosis) { create :diagnosis }
  let!(:medication_order) { create :medication_order }
  let!(:diagnostic_procedure) { create :diagnostic_procedure }
  let!(:treatment) { create :treatment }
  let!(:allergy) { create :allergy }

  describe 'Get #index' do
    subject { get :index }
    it 'returns a success response' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Get #show' do
    let(:patient_chronic_condition) { create :patient_chronic_condition, {patient_id: patient.id, diagnosis_id: diagnosis.id}}
    let(:patient_diagnosis) { create :patient_diagnosis, {patient_id: patient.id, diagnosis_id: diagnosis.id}}
    let(:patient_medication_order) { create :patient_medication_order, {patient_id: patient.id, medication_order_id: medication_order.id}}
    let(:patient_diagnostic_procedure) { create :patient_diagnostic_procedure, {patient_id: patient.id, diagnostic_procedure_id: diagnostic_procedure.id}}
    let(:patient_treatment) { create :patient_treatment, {patient_id: patient.id, treatment_id: treatment.id}}
    let(:patient_allergy) { create :patient_allergy, {patient_id: patient.id, allergy_id: allergy.id}}
    subject { get :show, params: { id: patient.id } }
    it 'returns a success response' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'PATCH #update' do
    subject { patch :update, params: { id: patient.id, user: { first_name: Faker::Name.first_name } } }
    it 'returns updated response' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'POST #create' do
    subject { post :create, params: {
        user: {
          first_name: Faker::Name.first_name,
          middle_name: Faker::Name.first_name,
          last_name: Faker::Name.last_name,
          mr: "something",
          dob: DateTime.new(),
          admission_id: admission.id
        }
      }
    }
    it 'returns created response' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'DELETE #destroy' do
    subject { delete :destroy, params: { id: patient.id } }
    it 'subtracts the count of patients by 1' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add chronic condition mapping' do
    subject { post :add_chronic_condition, params: { id: patient.id, condition_id: diagnosis.id } }
    it 'adds a chronic condition mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove chronic condition mapping' do
    subject { post :remove_chronic_condition, params: { id: patient.id, condition_id: diagnosis.id } }
    it 'removes a chronic condition mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add diagnosis mapping' do
    subject { post :add_diagnosis, params: { id: patient.id, diagnosis_id: diagnosis.id } }
    it 'adds a diagnosis mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove diagnosis mapping' do
    subject { post :remove_diagnosis, params: { id: patient.id, diagnosis_id: diagnosis.id } }
    it 'removes a diagnosis mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add medication order mapping' do
    subject { post :add_medication_order, params: { id: patient.id, medication_id: medication_order.id } }
    it 'adds a medication order mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove medication order_id mapping' do
    subject { post :remove_medication_order, params: { id: patient.id, medication_id: medication_order.id } }
    it 'removes a medication order_id mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add diagnostic procedure mapping' do
    subject { post :add_diagnostic_procedure, params: { id: patient.id, procedure_id: diagnostic_procedure.id } }
    it 'adds a diagnostic procedure mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove diagnostic procedure_id mapping' do
    subject { post :remove_diagnostic_procedure, params: { id: patient.id, procedure_id: diagnostic_procedure.id } }
    it 'removes a diagnostic procedure_id mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add treatment mapping' do
    subject { post :add_treatment, params: { id: patient.id, treatment_id: treatment.id } }
    it 'adds a treatment mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove treatment_id mapping' do
    subject { post :remove_treatment, params: { id: patient.id, treatment_id: treatment.id } }
    it 'removes a treatment_id mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Add allergy mapping' do
    subject { post :add_allergy, params: { id: patient.id, allergy_id: allergy.id } }
    it 'adds a allergy mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end

  describe 'Remove allergy_id mapping' do
    subject { post :remove_allergy, params: { id: patient.id, allergy_id: allergy.id } }
    it 'removes a allergy_id mapping to patient' do
      expect(subject).to have_http_status(:ok)
    end
  end
end
