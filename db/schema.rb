# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2019_09_04_180531) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "admission_diagnoses", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admission_observations", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "observation_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admission_symptoms", force: :cascade do |t|
    t.integer "admission_id"
    t.integer "symptom_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "admissions", force: :cascade do |t|
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "allergies", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnoses", force: :cascade do |t|
    t.string "coding_system"
    t.string "code"
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "diagnostic_procedures", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "facilities", force: :cascade do |t|
    t.string "name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "medication_orders", force: :cascade do |t|
    t.string "name"
    t.integer "unit"
    t.decimal "dosage"
    t.integer "route", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "order_frequency_id"
  end

  create_table "observations", force: :cascade do |t|
    t.text "description"
    t.datetime "moment"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "order_frequencies", force: :cascade do |t|
    t.string "value"
    t.integer "unit", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_allergies", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "allergy_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_chronic_conditions", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_diagnoses", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnosis_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_diagnostic_procedures", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "diagnostic_procedure_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_medication_orders", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "medication_order_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patient_treatments", force: :cascade do |t|
    t.integer "patient_id"
    t.integer "treatment_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "patients", force: :cascade do |t|
    t.string "first_name"
    t.string "middle_name"
    t.string "last_name"
    t.string "mr"
    t.datetime "dob"
    t.integer "gender", default: 0
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.integer "admission_id"
    t.integer "allergy_id"
  end

  create_table "symptoms", force: :cascade do |t|
    t.text "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "treatments", force: :cascade do |t|
    t.text "description"
    t.text "necessity"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

end
