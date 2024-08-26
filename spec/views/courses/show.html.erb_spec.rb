require 'rails_helper'

RSpec.describe "courses/show.html.erb", type: :view do
  before do
    @course = Course.create!(
      course_name: "Geography",
      teacher_name: "Dr Watson",
      course_description: "Topographic map of the world."
    )

    # @units is an array, mock the test setup so that @units is an ActiveRecord relation that includes ordering.
    3.times do |i|
      @course.units.create!(
        unit_name: "Unit #{i + 1}",
        unit_content: "Content #{i + 1}",
        position: i + 1
      )
    end

    @units = @course.units.order(:position)
    @unit = @course.units.build

    render
  end

  it "displays the course name" do
    expect(rendered).to have_selector('h1', text: @course.course_name)
  end

  it "displays the course description" do
    expect(rendered).to have_selector('h2', text: "Course Description")
    expect(rendered).to have_selector('p', text: @course.course_description)
  end

  it "displays the teacher's name" do
    expect(rendered).to have_selector('h2', text: "Teacher")
    expect(rendered).to have_selector('p', text: @course.teacher_name)
  end

  it "displays a list of units" do
    expect(rendered).to have_selector('h2', text: "Units")
    @units.each do |unit|
      expect(rendered).to have_selector("div[data-id='#{unit.id}']", text: unit.unit_name)
    end
  end

  it "renders the add unit form" do
    expect(rendered).to have_selector('h3', text: "Add a Unit")
    expect(rendered).to have_selector("form")
  end

  it "includes a delete link for the course" do
    expect(rendered).to have_link("Delete course", href: course_path(@course))
  end
end
