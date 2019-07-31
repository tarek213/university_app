class StudentCoursesController < ApplicationController

def create
  course_to_enroll = Course.find(params[:course_id])
  unless current_user.courses.include?(course_to_enroll)
    StudentCourse.create(course: course_to_enroll, student: current_user)
  flash[:notice] = "successfull enrollment in #{course_to_enroll.name}"
  redirect_to current_user
  else
    flash[:notice] = "something went wrong with your enrollment"
    redirect_to root_path
  end
end


end
