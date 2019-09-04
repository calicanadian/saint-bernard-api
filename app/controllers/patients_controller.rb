class PatientsController < ApplicationController
  before_action :get_patient
  skip_before_action :get_patient, only: [:index, :create]
  before_action :get_chronic_condition, only: [:add_chronic_condition, :remove_chronic_condition]
  before_action :get_diagnosis, only: [:add_diagnosis, :remove_diagnosis]
  before_action :get_medication_order, only: [:add_medication_order, :remove_medication_order]
  before_action :get_diagnostic_procedure, only: [:add_diagnostic_procedure, :remove_diagnostic_procedure]
  before_action :get_treatment, only: [:add_treatment, :remove_treatment]
  before_action :get_allergy, only: [:add_allergy, :remove_allergy]

  def index
    @patients = Patient.retrieve_all
    render json: { patients: @patients, status: :ok}
  end

  def create
    @patient = Patient.new(patient_attributes)
    if @patient.save!
      render json: { patient: @patient, status: :ok }
    else
      render json: { errors: Patient.errors, status: 422 }
    end
  end

  def update
    if @patient.update_attributes(patient_attributes)
      render json: { message: 'Patient updated', status: 200 }
    else
      render json: { message: 'Unable to update patient record', status: 422 }
    end
  end

  def destroy
    if @patient.destroy
      render json: { status: :ok }
    else
      render json: { errors: @patient.errors, status: 422 }
    end
  end

  def show
    @admission = Admission.find(@patient.admission_id)
    # The following will return as OpenStruct objects
    @chronic_conditions = @patient.get_chronic_conditions
    @diagnoses = @patient.get_diagnoses
    @medication_orders = @patient.get_medication_orders
    @diagnostic_procedures = @patient.get_diagnostic_procedures
    @treatments = @patient.get_treatments
    @allergies = @patient.get_allergies
    # refactor for error handling
    render json: {
      patient: @patient,
      admission: @admission,
      chronic_conditions: @chronic_conditions,
      diagnoses: @diagnoses,
      medication_orders: @medication_orders,
      diagnostic_procedures: @diagnostic_procedures,
      treatments: @treatments,
      allergies: @allergies, status: :ok }
  end

  def add_chronic_condition
    if PatientChronicCondition.create!(patient_id: @patient.id, diagnosis_id: @chronic_condition.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_chronic_condition
    patient_condition = PatientChronicCondition.where(patient_id: @patient.id, diagnosis_id: @chronic_condition.id).last
    if patient_condition.blank?
      render json: { status: 404 }
    else
      if patient_condition.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_condition.errors, status: 422 }
      end
    end
  end

  def add_diagnosis
    if PatientDiagnosis.create!(patient_id: @patient.id, diagnosis_id: @diagnosis.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_diagnosis
    patient_diagnosis = PatientDiagnosis.where(patient_id: @patient.id, diagnosis_id: @diagnosis.id).last
    if patient_diagnosis.blank?
      render json: { status: 404 }
    else
      if patient_diagnosis.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_diagnosis.errors, status: 422 }
      end
    end
  end

  def add_medication_order
    if PatientMedicationOrder.create!(patient_id: @patient.id, medication_order_id: @medication_order.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_medication_order
    patient_medication_order = PatientMedicationOrder.where(patient_id: @patient.id, medication_order_id: @medication_order.id).last
    if patient_medication_order.blank?
      render json: { status: 404 }
    else
      if patient_medication_order.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_medication_order.errors, status: 422 }
      end
    end
  end

  def add_diagnostic_procedure
    if PatientDiagnosticProcedure.create!(patient_id: @patient.id, diagnostic_procedure_id: @diagnostic_procedure.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_diagnostic_procedure
    patient_diagnostic_procedure = PatientDiagnosticProcedure.where(patient_id: @patient.id, diagnostic_procedure_id: @diagnostic_procedure.id).last
    if patient_diagnostic_procedure.blank?
      render json: { status: 404 }
    else
      if patient_diagnostic_procedure.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_diagnostic_procedure.errors, status: 422 }
      end
    end
  end

  def add_treatment
    if PatientTreatment.create!(patient_id: @patient.id, treatment_id: @treatment.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_treatment
    patient_treatment = PatientTreatment.where(patient_id: @patient.id, treatment_id: @treatment.id).last
    if patient_treatment.blank?
      render json: { status: 404 }
    else
      if patient_treatment.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_treatment.errors, status: 422 }
      end
    end
  end

  def add_allergy
    if PatientAllergy.create!(patient_id: @patient.id, allergy_id: @allergy.id)
      render json: { status: :ok }
    else
      render json: { status: 422 }
    end
  end

  def remove_allergy
    patient_allergy = PatientAllergy.where(patient_id: @patient.id, allergy_id: @allergy.id).last
    if patient_allergy.blank?
      render json: { status: 404 }
    else
      if patient_allergy.destroy
        render json: { status: :ok }
      else
        render json: { errors: patient_allergy.errors, status: 422 }
      end
    end
  end

  private

  def get_patient
    @patient = Patient.find(params[:id])
  end

  def get_chronic_condition
    @chronic_condition = Diagnosis.find(params[:condition_id])
  end

  def get_diagnosis
    @diagnosis = Diagnosis.find(params[:diagnosis_id])
  end

  def get_medication_order
    @medication_order = MedicationOrder.find(params[:medication_id])
  end

  def get_diagnostic_procedure
    @diagnostic_procedure = DiagnosticProcedure.find(params[:procedure_id])
  end

  def get_treatment
    @treatment = Treatment.find(params[:treatment_id])
  end

  def get_allergy
    @allergy = Allergy.find(params[:allergy_id])
  end

  def patient_attributes
    params.require(:user).permit(:first_name, :middle_name, :last_name, :mr, :dob, :gender, :admission_id)
  end
end
