class StudentsController < ApplicationController
    skip_before_action :require_user, only: [:new, :create]
    before_action :set_student,only: [:show, :edit, :update]
    before_action :require_same_user, only: [:edit, :update]
    def index 
     @students = Student.all
    end 

    def new 
        @student = Student.new
    end

    def create 
        @student = Student.new(student_params)
        if @student.save 
            flash[:notice] = "You have successfully signed up "
            redirect_to @student 

        else 
            render "new",status: :unprocessable_entity
        end 
    end 

    def  show 
        
    end 

    def edit 
       
    end

    def update 

        if @student.update(student_params)
            flash[:notice] = "You have successfully updated your Profile"
            redirect_to @student 
        else 
            render 'edit',status: :unprocessable_entity
        end
    end 

    private 
        def student_params 
            params.require(:student).permit(:name, :email,:password, :password_confirmation)
        end

        def  set_student 
            @student = Student.find(params[:id]) 
        end 


    def require_same_user
        
        if current_user  != @student
            flash[:alert]="You can only edit or delete your own account"
            redirect_to  student_path(current_user)
        end

    end


end 