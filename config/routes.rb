Rails.application.routes.draw do
  # For details on the DSL available within this file, see http://guides.rubyonrails.org/routing.html
  get 'patients', to: 'patients#index'
  get 'patients/:id', to: 'patients#show', as: 'patient'
  post 'patients', to: 'patients#create'
  patch 'patients/:id', to: 'patients#update'
  delete 'patients/:id', to: 'patients#destroy'

  # supporting endpoints
  post 'patients/add_chronic_condition', to: 'patients#add_chronic_condition'
  post 'patients/remove_chronic_condition', to: 'patients#remove_chronic_condition'
  post 'patients/add_diagnosis', to: 'patients#add_diagnosis'
  post 'patients/remove_diagnosis', to: 'patients#remove_diagnosis'
  post 'patients/add_medication_order', to: 'patients#add_medication_order'
  post 'patients/remove_medication_order', to: 'patients#remove_medication_order'
  post 'patients/add_diagnostic_procedure', to: 'patients#add_diagnostic_procedure'
  post 'patients/remove_diagnostic_procedure', to: 'patients#remove_diagnostic_procedure'
  post 'patients/add_treatment', to: 'patients#add_treatment'
  post 'patients/remove_treatment', to: 'patients#remove_treatment'
  post 'patients/add_allergy', to: 'patients#add_allergy'
  post 'patients/remove_allergy', to: 'patients#remove_allergy'

  # resources :patients
end
