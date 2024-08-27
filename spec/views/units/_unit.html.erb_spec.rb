require 'rails_helper'

RSpec.describe "units/_unit.html.erb", type: :view do
  before do
    # Create a course and a unit for testing
    @course = Course.create!(course_name: "Test Course", teacher_name: "Test teacher")
    @unit = Unit.create!(
      unit_name: "Test Unit",
      unit_description: "Description",
      unit_content: "Content",
      course: @course
    )
    
    # Assign the variables for the view
    assign(:course, @course)
    assign(:unit, @unit)
    
    # Render the partial
    render partial: "units/unit", locals: { unit: @unit, course: @course }
  end

  it "displays the unit name" do
    expect(rendered).to have_selector("h5", text: @unit.unit_name)
  end

  it "displays the unit description" do
    within "#unit_#{@unit.id}" do
      expect(rendered).to have_selector("p", text: "Description: #{@unit.unit_description}")
    end
  end

  it "displays the unit content" do
    within "#unit_#{@unit.id}" do
      expect(rendered).to have_selector("p", text: "Content: #{@unit.unit_content}")
    end
  end

  it "includes a link to edit the unit" do
    expect(rendered).to have_link("Edit Unit", href: edit_course_unit_path(@course, @unit))
  end

  it "includes a link to delete the unit with confirmation" do
    expect(rendered).to have_link("Delete Unit", href: course_unit_path(@course, @unit))
    expect(rendered).to have_css("a[data-method='delete'][data-confirm='Are you sure you want to delete this unit?']")
  end
end
