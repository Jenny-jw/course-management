class CoursesController < ApplicationController
  def index
    @courses = Course.all
  end

  def showSingleCourse
    @course = Course.find(params[:id])
  end
end
