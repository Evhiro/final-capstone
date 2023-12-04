Rails.application.routes.draw do
  resource :login, only: [:new, :create, :destroy]

  root "pages#landing"

#student
  get "/student", to: "pages#student_login", as: "student", account_type: "student"
  post "/student/log", to: "pages#create", as:"student_log", account_type: "student" 
  get "/student/dashboard", to: "pages#student_dashboard", as: "student_dashboard"
  get "/student/grades", to: "pages#student_grades", as: "student_grades"
  get "/student/announcement", to: "pages#student_announcement", as: "student_announcement"
  get "/student/schedule", to: "pages#student_schedule", as: "student_schedule"
#teacher
  get "/teacher", to: "pages#teacher_login", as: "teacher", account_type: "teacher"
  post "/teacher/log", to: "pages#create", as:"teacher_log", account_type: "teacher"
  get "/teacher/dashboard", to: "pages#teacher_dashboard", as: "teacher_dashboard"
  get "/teacher/grades", to: "pages#teacher_grades", as: "teacher_grades"
  get "/teacher/announcement", to: "pages#teacher_announcement", as: "teacher_announcement"
  get "/teacher/schedule", to: "pages#teacher_schedule", as: "teacher_schedule"
#admin
  get "/admin", to: "pages#admin_login", as: "admin", account_type: "admin"
  post "/admin/student/log", to: "pages#create", as:"admin_log", account_type: "admin"
  get "/admin/student", to: "pages#student_table", as: "student_table"
  get "/admin/teacher", to: "pages#teacher_table", as: "teacher_table"
  get "/admin/login", to: "pages#login_table", as: "login_table"

end
