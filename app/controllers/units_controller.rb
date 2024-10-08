class UnitsController < ApplicationController
  def create
    @course = Course.find(params[:course_id])
    @unit = @course.units.new(unit_params)

    if @unit.save
      redirect_to course_path(@course)
    else
      @units = @course.units
      render "courses/show"
    end
  end

  def edit
    @course = Course.find(params[:course_id])
    @unit = @course.units.find(params[:id])
  end

  def update
    @course = Course.find(params[:course_id])
    @unit = @course.units.find(params[:id])

    if @unit.update(unit_params)
      redirect_to course_path(@course)
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def sort
    params[:unit].each_with_index do |id, index|
      Unit.where(id: id).update_all(position: index + 1)
    end
    head :ok
  end

  def destroy
    @course = Course.find(params[:course_id])
    @unit = @course.units.find(params[:id])
    @unit.destroy
    redirect_to course_path(@course), status: :see_other
  end

  private
    def unit_params
      params.require(:unit).permit(:unit_name, :unit_description, :unit_content, :position)
    end
end
