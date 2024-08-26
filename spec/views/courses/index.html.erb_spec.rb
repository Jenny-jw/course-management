require 'rails_helper'

RSpec.describe "courses/index.html.erb", type: :view do
  before do
    @courses = []
    3.times do |i|
      course = Course.create!(course_name: "Course #{i + 1}", teacher_name: "Jumbo")
      3.times do |j|
        course.units.create!(unit_name: "Unit #{j + 1}", unit_content: "Content #{j + 1}", position: j + 1)
      end
      @courses << course
    end

    render
  end

  it "displays a list of courses" do
    @courses.each do |course|
      expect(rendered).to have_link(course.course_name, href: course_path(course))
    end
  end

  it "displays units for each course" do
    @courses.each do |course|
      course.units.order(:position).each do |unit|
        expect(rendered).to have_selector("ul.units li##{unit.id}", text: unit.unit_name)
      end
    end
  end

  it "displays 'Add a Course' link" do
    expect(rendered).to have_link("Add a Course", href: new_course_path)
  end
end
