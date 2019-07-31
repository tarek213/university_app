class StudentsController < ApplicationController
skip_before_action :require_user, only: [:new, :create]
before_action :set_student, only: [:edit, :show, :update]
before_action :require_same_user, only: [:edit, :update]
  def index
  @students=Student.all
  end

  def new
    @student=Student.new
  end

  def create
    @student =Student.new(student_params)
    if @student.save
      flash[:notice] = "Signed up successfully"
      redirect_to students_path
    else
      render 'new'
    end
  end

 def edit
 end

def update
    if @student.update(student_params)
      flash[:success] = "Student profile has been updated"
      redirect_to  @student
    else
      render 'edit'
  end
end


def show

end




  private
  def set_student
  @student =Student.find(params[:id])
  end

  def student_params

  params.require(:student).permit(:name, :email ,:password, :passord_confirmation)

  end
  def require_same_user
    if current_user != @student
      flash[:notice] = "you don't have access to this profile to edit"
      redirect_to students_path
    end
  end
end
