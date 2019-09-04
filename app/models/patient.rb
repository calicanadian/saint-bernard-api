class Patient < ApplicationRecord

  enum gender: { male: 0, female: 1, other: 2 }

  has_one :admission
  has_many :patient_allergies
  has_many :patient_diagnoses
  has_many :patient_medication_orders
  has_many :patient_diagnostic_procedures
  has_many :patient_chronic_conditions
  has_many :patient_treatments

  validates_uniqueness_of :first_name, scope: :last_name
  validates_presence_of :first_name
  validates_presence_of :last_name
  validates_presence_of :dob
  validates_presence_of :gender

  def self.retrieve_all
    sql_string = <<-EOS
      SELECT patients.id, patients.first_name, patients.middle_name, patients.last_name, patients.dob, (CASE WHEN patients.gender = 0 THEN 'Male' WHEN patients.gender = 1 THEN 'Female' ELSE 'Other' END) as gender, patients.mr, admissions.moment
      FROM patients
      INNER JOIN admissions ON admissions.id = patients.admission_id
      ORDER BY patients.last_name ASC, patients.first_name ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_chronic_conditions
    sql_string = <<-EOS
      SELECT patients.id, patient_chronic_conditions.id, diagnoses.code, diagnoses.coding_system, diagnoses.description
      FROM patients
      LEFT OUTER JOIN patient_chronic_conditions ON patient_chronic_conditions.patient_id = patients.id
      LEFT OUTER JOIN diagnoses ON patient_chronic_conditions.diagnosis_id = diagnoses.id
      WHERE patients.id = #{self.id}
      ORDER BY diagnoses.code ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_diagnoses
    sql_string = <<-EOS
      SELECT patients.id, patient_diagnoses.id, diagnoses.code, diagnoses.coding_system, diagnoses.description
      FROM patients
      LEFT OUTER JOIN patient_diagnoses ON patient_diagnoses.patient_id = patients.id
      LEFT OUTER JOIN diagnoses ON patient_diagnoses.diagnosis_id = diagnoses.id
      WHERE patients.id = #{self.id}
      ORDER BY diagnoses.code ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_medication_orders
    sql_string = <<-EOS
      SELECT patients.id, patient_medication_orders.id, medication_orders.name, (CASE WHEN medication_orders.unit = 0 THEN 'Mg' ELSE 'Mg' END) as unit, medication_orders.dosage, (CASE WHEN medication_orders.route = 0 THEN 'PO' WHEN medication_orders.route = 1 THEN 'IM' WHEN medication_orders.route = 2 THEN 'SC' ELSE 'PO' END) as route, order_frequencies.value, (CASE WHEN order_frequencies.unit = 0 THEN 'hour' ELSE 'hour' END) as frequency_unit
      FROM patients
      LEFT OUTER JOIN patient_medication_orders ON patient_medication_orders.patient_id = patients.id
      INNER JOIN medication_orders ON patient_medication_orders.medication_order_id = medication_orders.id
      LEFT OUTER JOIN order_frequencies ON medication_orders.order_frequency_id = order_frequencies.id
      WHERE patients.id = #{self.id}
      ORDER BY medication_orders.name ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_diagnostic_procedures
    sql_string = <<-EOS
      SELECT patients.id, patient_diagnostic_procedures.id, diagnostic_procedures.moment, diagnostic_procedures.description
      FROM patients
      LEFT OUTER JOIN patient_diagnostic_procedures ON patient_diagnostic_procedures.patient_id = patients.id
      LEFT OUTER JOIN diagnostic_procedures ON patient_diagnostic_procedures.diagnostic_procedure_id = diagnostic_procedures.id
      WHERE patients.id = #{self.id}
      ORDER BY diagnostic_procedures.moment ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_treatments
    sql_string = <<-EOS
      SELECT patients.id, patient_treatments.id, treatments.description, treatments.necessity
      FROM patients
      LEFT OUTER JOIN patient_treatments ON patient_treatments.patient_id = patients.id
      LEFT OUTER JOIN treatments ON patient_treatments.treatment_id = treatments.id
      WHERE patients.id = #{self.id}
      ORDER BY treatments.id ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end

  def get_allergies
    sql_string = <<-EOS
      SELECT patients.id, patient_allergies.id, allergies.description
      FROM patients
      LEFT OUTER JOIN patient_allergies ON patient_allergies.patient_id = patients.id
      LEFT OUTER JOIN allergies ON patient_allergies.allergy_id = allergies.id
      WHERE patients.id = #{self.id}
      ORDER BY allergies.id ASC
    EOS

    result = ActiveRecord::Base.connection.execute(sql_string)
    return JSON.parse(result.to_json, object_class: OpenStruct)
  end



end
