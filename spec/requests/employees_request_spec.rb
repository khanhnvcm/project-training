require 'rails_helper'

RSpec.describe 'Employees', type: :request do
  include_context 'Sign in'

  let(:employee) { create(:employee) }
  let(:branch) { employee.branch }

  describe 'GET employees#index' do
    it 'returns	a	200	response' do
      get employees_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET employees#show' do
    subject do
      get employee_path(id: employee_id)
      response
    end

    context 'when :id is available' do
      let(:employee_id) { employee.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:employee_id) { 999 }

      it 'returns	a	404	response' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'GET employees#new' do
    it 'returns	a	200	response' do
      get new_employee_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST employees#create' do
    subject do
      post employees_path, params: { employee: employee_params }
      response
    end

    context 'when created successfully' do
      let(:employee_params) { attributes_for(:employee, branch_id: branch.id) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:employee_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET employees#edit' do
    subject do
      get edit_employee_path(id: employee_id)
      response
    end

    context 'when :id is available' do
      let(:employee_id) { employee.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:employee_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT employees#update' do
    subject do
      put employee_path(employee), params: { employee: employee_params }
      response
    end

    context 'when updated successfully' do
      let(:employee_params) { attributes_for(:employee) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:employee_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe 'DELETE employees#destroy' do
    let(:import_history) { create(:import_history) }
    let(:product) { import_history.product }
    let(:employee) { product.employee }

    subject do
      employee.destroy
      get employee_path(employee)
      response
    end

    context 'when delete failed' do
      it 'when show employee returns a 200 response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when deleted successfully' do
      it 'when show employee returns a 404 response' do
        product.destroy
        expect(subject).to have_http_status(404)
      end
    end
  end
end
