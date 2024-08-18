class UnitsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @unit = @course.units.create(unit_params)
    redirect_to course_path(@course)
  end

  def destroy
    @course = Course.find(params[:course_id])
    @unit = @course.units.find(params[:id])
    @unit.destroy
    redirect_to article_path(@course), status: :see_other
  end

  private
    def unit_params
      params.require(:unit).permit(:unit_name, :unit_description, :unit_content, :position)
    end
end
