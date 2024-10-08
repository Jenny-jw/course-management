class CoursesController < ApplicationController
  def index
    @courses = Course.includes(:units).all
  end

  def show
    @course = Course.find(params[:id])
    @units = @course.units
  end

  def new
    @course = Course.new
    @course.units.build
  end

  def create
    @course = Course.new(course_params)

    if @course.save
      redirect_to @course
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
    @course = Course.find(params[:id])
  end

  def update
    @course = Course.find(params[:id])

    if @course.update(course_params)
      redirect_to @course
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @course = Course.find(params[:id])
    @course.destroy

    redirect_to root_path, status: :see_other
  end

  private
    def course_params
      params.require(:course).permit(:course_name, :teacher_name, :course_description)
    end
end
