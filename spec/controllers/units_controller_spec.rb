# spec/controllers/units_controller_spec.rb
require 'rails_helper'

RSpec.describe UnitsController, type: :controller do
  let(:course) { Course.create!(course_name: 'Math', teacher_name: 'John Doe', course_description: 'Basic Mathematics') }

  let(:valid_attributes) do
    {
      unit_name: 'Unit 1',
      unit_description: 'Introduction to Algebra',
      unit_content: 'Evaluating algebraic expressions',
      course_id: course.id
    }
  end

  let(:invalid_attributes_missing_unit_name) do
    {
      unit_name: nil,
      unit_description: 'Introduction to Algebra',
      unit_content: 'Evaluating algebraic expressions',
      course_id: course.id
    }
  end

  let(:invalid_attributes_missing_unit_content) do
    {
      unit_name: 'Unit 1',
      unit_description: 'Introduction to Algebra',
      unit_content: nil,
      course_id: course.id
    }
  end

  let(:invalid_attributes_missing_both) do
    {
      unit_name: nil,
      unit_description: 'Introduction to Algebra',
      unit_content: nil,
      course_id: course.id
    }
  end

  describe 'POST #create' do
    context 'with valid attributes' do
      it 'creates a new unit' do
        expect {
          post :create, params: { course_id: course.id, unit: valid_attributes }
        }.to change(Unit, :count).by(1)
      end

      it 'redirects to the course show page' do
        post :create, params: { course_id: course.id, unit: valid_attributes }
        expect(response).to redirect_to(course_path(course))
      end
    end

    context 'with invalid attributes' do
      it 'does not save the new unit when unit_name is missing' do
        expect {
          post :create, params: { course_id: course.id, unit: invalid_attributes_missing_unit_name }
        }.not_to change(Unit, :count)
      end

      it 'does not save the new unit when unit_content is missing' do
        expect {
          post :create, params: { course_id: course.id, unit: invalid_attributes_missing_unit_content }
        }.not_to change(Unit, :count)
      end

      it 'does not save the new unit when both unit_name and unit_content are missing' do
        expect {
          post :create, params: { course_id: course.id, unit: invalid_attributes_missing_both }
        }.not_to change(Unit, :count)
      end

      it 're-renders the course show template' do
        post :create, params: { course_id: course.id, unit: invalid_attributes_missing_unit_name }
        expect(response).to render_template('courses/show')
      end
    end
  end

  describe 'GET #edit' do
    it 'assigns the requested unit' do
      unit = course.units.create!(valid_attributes)
      get :edit, params: { course_id: course.id, id: unit.id }
      expect(assigns(:unit)).to eq(unit)
    end

    it 'renders the edit template' do
      unit = course.units.create!(valid_attributes)
      get :edit, params: { course_id: course.id, id: unit.id }
      expect(response).to render_template(:edit)
    end
  end

  describe 'PATCH #update' do
    let(:unit) { course.units.create!(valid_attributes) }

    context 'with valid attributes' do
      it 'updates the unit' do
        patch :update, params: { course_id: course.id, id: unit.id, unit: { unit_name: 'Updated Unit Name' } }
        unit.reload
        expect(unit.unit_name).to eq('Updated Unit Name')
      end

      it 'redirects to the course show page' do
        patch :update, params: { course_id: course.id, id: unit.id, unit: { unit_name: 'Updated Unit Name' } }
        expect(response).to redirect_to(course_path(course))
      end
    end

    context 'with invalid attributes' do
      it 'does not update the unit when unit_name is missing' do
        patch :update, params: { course_id: course.id, id: unit.id, unit: invalid_attributes_missing_unit_name }
        expect(unit.reload.unit_name).to eq('Unit 1')
      end

      it 'does not update the unit when unit_content is missing' do
        patch :update, params: { course_id: course.id, id: unit.id, unit: invalid_attributes_missing_unit_content }
        expect(unit.reload.unit_content).to eq('Evaluating algebraic expressions')
      end

      it 're-renders the edit template' do
        patch :update, params: { course_id: course.id, id: unit.id, unit: invalid_attributes_missing_unit_name }
        expect(response).to render_template(:edit)
      end
    end
  end

  describe 'DELETE #destroy' do
    it 'deletes the unit' do
      unit = course.units.create!(valid_attributes)
      expect {
        delete :destroy, params: { course_id: course.id, id: unit.id }
      }.to change(Unit, :count).by(-1)
    end

    it 'redirects to the course show page' do
      unit = course.units.create!(valid_attributes)
      delete :destroy, params: { course_id: course.id, id: unit.id }
      expect(response).to redirect_to(course_path(course))
    end
  end
end
