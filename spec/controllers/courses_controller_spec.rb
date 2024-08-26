require 'rails_helper'

RSpec.describe CoursesController, type: :controller do
  let(:valid_attributes) do
    { course_name: 'Geography',
      teacher_name: 'Dr Watson',
      course_description: 'Topographic map of the world.'
    }
  end

  let(:invalid_attributes_missing_course_name) do
    {
      course_name: nil,
      teacher_name: 'Dr Watson',
      course_description: 'Topographic map of the world.'
    }
  end

  let(:invalid_attributes_missing_teacher_name) do
    {
      course_name: 'Geography',
      teacher_name: nil,
      course_description: 'Topographic map of the world.'
    }
  end

  let(:invalid_attributes_missing_both) do
    {
      course_name: nil,
      teacher_name: nil,
      course_description: 'Topographic map of the world.'
    }
  end

  describe 'GET #index' do
    it 'assigns @courses' do
      course = Course.create!(valid_attributes)
      get :index
      expect(assigns(:courses)).to eq([ course ])
    end

    it 'renders the index template' do
      get :index
      expect(response).to render_template(:index)
    end
  end

  describe 'GET #show' do
    it 'assigns @course' do
      course = Course.create!(valid_attributes)
      get :show, params: { id: course.id }
      expect(assigns(:course)).to eq(course)
    end

    it 'renders the show template' do
      course = Course.create!(valid_attributes)
      get :show, params: { id: course.id }
      expect(response).to render_template(:show)
    end
  end

  describe 'GET #new' do
    it 'assigns @course' do
      get :new
      expect(assigns(:course)).to be_a_new(Course)
    end

    it 'renders the new template' do
      get :new
      expect(response).to render_template(:new)
    end
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new course' do
        expect {
          post :create, params: { course: valid_attributes }
        }.to change(Course, :count).by(1)
      end

      it 'redirects to the new course' do
        post :create, params: { course: valid_attributes }
        expect(response).to redirect_to(Course.last)
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new course when course_name is missing' do
        expect {
          post :create, params: { course: invalid_attributes_missing_course_name }
        }.not_to change(Course, :count)
      end

      it 'does not save the new course when teacher_name is missing' do
        expect {
          post :create, params: { course: invalid_attributes_missing_teacher_name }
        }.not_to change(Course, :count)
      end

      it 'does not save the new course when both course_name and teacher_name are missing' do
        expect {
          post :create, params: { course: invalid_attributes_missing_both }
        }.not_to change(Course, :count)
      end

      it 're-renders the new template' do
        post :create, params: { course: invalid_attributes_missing_course_name }
        expect(response).to render_template(:new)
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns @course' do
      course = Course.create!(valid_attributes)
      get :edit, params: { id: course.id }
      expect(assigns(:course)).to eq(course)
    end

    it 'renders the edit template' do
      course = Course.create!(valid_attributes)
      get :edit, params: { id: course.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:course) { Course.create!(valid_attributes) }

    context 'with valid attributes' do
      it 'updates the course' do
        patch :update, params: { id: course.id, course: { course_name: 'Updated Course' } }
        course.reload
        expect(course.course_name).to eq('Updated Course')
      end

      it 'redirects to the updated course' do
        patch :update, params: { id: course.id, course: { course_name: 'Updated Course' } }
        expect(response).to redirect_to(course)
      end
    end

    context 'with invalid attributes' do
      it 'does not update the course when course_name is missing' do
        patch :update, params: { id: course.id, course: invalid_attributes_missing_course_name }
        expect(course.reload.course_name).to eq('Geography')
      end

      it 'does not update the course when teacher_name is missing' do
        patch :update, params: { id: course.id, course: invalid_attributes_missing_teacher_name }
        expect(course.reload.teacher_name).to eq('Dr Watson')
      end

      it 're-renders the edit template' do
        patch :update, params: { id: course.id, course: invalid_attributes_missing_course_name }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the course' do
      course = Course.create!(valid_attributes)
      expect {
        delete :destroy, params: { id: course.id }
      }.to change(Course, :count).by(-1)
    end

    it 'redirects to the root path' do
      course = Course.create!(valid_attributes)
      delete :destroy, params: { id: course.id }
      expect(response).to redirect_to(root_path)
    end
  end
end
