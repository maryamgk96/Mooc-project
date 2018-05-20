class CoursesController < InheritedResources::Base
  load_and_authorize_resource
  def create
    @course = Course.new(course_params)
    @course.user = current_user

    if @course.save
      redirect_to @course
    else
      render :new
    end
  end
  private

    def course_params
      params.require(:course).permit(:title)
    end
end

