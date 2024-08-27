require 'rails_helper'

RSpec.describe "courses/_form.html.erb", type: :view do
  before do
    @course = Course.new(
      course_name: "Ruby on Rails",
      teacher_name: "Jane Doe",
      course_description: "Learn Rails from scratch"
    )

    render partial: "courses/form", locals: { course: @course }
  end

  it "renders the course name field" do
    expect(rendered).to have_field('Course name', with: @course.course_name)
  end

  it "renders the teacher name field" do
    expect(rendered).to have_field('Teacher name', with: @course.teacher_name)
  end

  it "renders the course description field" do
    expect(rendered).to have_field('Course description', with: @course.course_description)
  end

  it "displays validation error messages for course_name" do
    @course.errors.add(:course_name, "can't be blank")
    render partial: "courses/form", locals: { course: @course }
    expect(rendered).to have_content("can't be blank")
  end

  it "renders the submit button" do
    expect(rendered).to have_button('Save Course')
  end
end
