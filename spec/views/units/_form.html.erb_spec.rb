require 'rails_helper'

RSpec.describe "units/_form.html.erb", type: :view do
  before do
    # Create a course and a unit for testing
    @course = Course.create!(course_name: "Test Course", teacher_name: "Test Teacher")
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
    render partial: "units/form", locals: { unit: @unit, course: @course }
  end

  it "renders the form with the correct fields and labels" do
    expect(rendered).to have_selector("form")
    expect(rendered).to have_selector("label", text: "Unit name")
    expect(rendered).to have_selector("input[type=text][name='unit[unit_name]']")
    expect(rendered).to have_selector("label", text: "Unit description")
    expect(rendered).to have_selector("textarea[name='unit[unit_description]']")
    expect(rendered).to have_selector("label", text: "Unit content")
    expect(rendered).to have_selector("textarea[name='unit[unit_content]']")
    expect(rendered).to have_selector("input[type=submit]")
  end

  context "when there are validation errors" do
    before do
      # Trigger validation errors
      @unit.errors.add(:unit_name, "can't be blank")
      @unit.errors.add(:unit_description, "can't be blank")
      @unit.errors.add(:unit_content, "can't be blank")
      
      render partial: "units/form", locals: { unit: @unit, course: @course }
    end

    it "displays error messages for unit_name" do
      expect(rendered).to have_selector("div", text: "Unit name can't be blank")
    end

    it "displays error messages for unit_description" do
      expect(rendered).to have_selector("div", text: "Unit description can't be blank")
    end

    it "displays error messages for unit_content" do
      expect(rendered).to have_selector("div", text: "Unit content can't be blank")
    end
  end
end
