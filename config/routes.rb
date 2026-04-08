Rails.application.routes.draw do
  resources :user_ts, only: [:index_teacher, :show, :edit_teacher, :update]
    resource :belongs, only: [:create, :destroy]
      get "teachers" => "belongs#teachers", as: "teachers"
      get "students" => "belongs#students", as: "students"
  get "belongs/teacher/:id/add_students" => "belongs#add_student"
  get "belongs/teacher/:id/add_teachers" => "belongs#add_teacher"
  post "users/student/:id/update" => "users#update_student"
  post "users/teachers/:id/update" => "users#update_teacher"
  get "users/student/:id/edit" => "users#edit_student"
  get "users/teacher/:id/edit" => "users#edit_teacher"
  post "users/create/student" => "users#create_student"
  post "users/create/teacher" => "users#create_teacher"
  get "signup/student" => "users#new_student"
  get "signup/teacher" => "users#new_teacher"
  get "users/student/:id" => "users#show_student"
  get "users/teacher/:id" => "users#show_teacher"
  post "login/student" => "users#login_student"
  post "login/teacher" => "users#login_teacher"
  post "logout" => "users#logout"
  get "login_form/student" => "users#login_form_student"
  get "login_form/teacher" => "users#login_form_teacher"


  get "class-schedules/index" => "schedules#index"
  get "class-schedules/:id" => "schedules#edit"

  get "homeworks/index" => "homeworks#index"
  get "homeworks/:id" => "homeworks#show"
  post "homeworks/:id/done" => "homeworks#done"

  get "reports/index" => "reports#index"
  get "reports/index_new", to: "reports#index", as: "index_new"
  get "reports/index_old", to: "reports#index", as: "index_old"
  get "reports/new" => "reports#new"
  get "reports/:id" => "reports#show"
  post "reports/create" => "reports#create"
  get "reports/:id/edit" => "reports#edit"
  post "reports/:id/update" => "reports#update"
  post "reports/:id/destroy" => "reports#destroy"

  get "term_exams/index" => "term_exams#index"
  get "term_exams/new" => "term_exams#new"
  post "term_exams/create" => "term_exams#create"
  get "term_exams/:id/edit" => "term_exams#edit"
  post "term_exams/:id/update" => "term_exams#update"
  post "term_exams/:id/destroy" => "term_exams#destroy"
  

  get "/" => "home#top"
  get "menu" => "home#menu"
  
  # Define your application routes per the DSL in https://guides.rubyonrails.org/routing.html

  # Reveal health status on /up that returns 200 if the app boots with no exceptions, otherwise 500.
  # Can be used by load balancers and uptime monitors to verify that the app is live.
  get "up" => "rails/health#show", as: :rails_health_check

  # Render dynamic PWA files from app/views/pwa/*
  get "service-worker" => "rails/pwa#service_worker", as: :pwa_service_worker
  get "manifest" => "rails/pwa#manifest", as: :pwa_manifest

  # Defines the root path route ("/")
  # root "posts#index"
end
