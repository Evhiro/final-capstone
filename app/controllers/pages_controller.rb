class PagesController < ApplicationController
    def landing
        render "_landing"
    end

    #student pages
    def student_login
        render "pages/Student/_login"
    end
    def student_dashboard
        render "pages/Student/_dashboard"
    end
    def student_grades
        render "pages/Student/_grades"
    end
    def student_announcement
        render "pages/Student/_announcement"
    end
    def student_schedule
        render "pages/Student/_schedule"
    end


    #teacher pages
    def teacher_login
        render "pages/Teacher/_login"
    end
    def teacher_dashboard
        render "pages/Teacher/_dashboard"
    end
    def teacher_grades
        render "pages/Teacher/_grades"
    end
    def teacher_announcement
        render "pages/Teacher/_announcement"
    end
    def teacher_schedule
        render "pages/Teacher/_schedule"
    end

    #admin pages
    def admin_login
        render "pages/Admin/_login"
    end
    def student_table
        render "pages/Admin/_tablestudent"
    end
    def teacher_table
        render "pages/Admin/_tableteacher"
    end
    def login_table
        render "pages/Admin/_logintable"
    end
    
    #LOGIN COMMANDS
    def new
        
    end

    def create
        user = Login.find_by(email: params[:email])

        if user && user.authenticate(params[:password])
            session[:user_id] = user.id
            
         case params[:account_type]
             when "student"
                redirect_to student_dashboard_path
             when "teacher"
                redirect_to teacher_dashboard_path
             when "admin"
                redirect_to student_table_path
         end
        else
            flash.now[alert] = "Invalid email or password"
        end
    end

    def destroy
        session[:user_id] = nil
        redirect_to root_path, notice: 'Logged out successfully!'
    end
end