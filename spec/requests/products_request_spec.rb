require 'rails_helper'

RSpec.describe 'Products', type: :request do
  include_context 'Sign in'

  let(:product) { create(:product) }
  let(:model) { product.model }
  let(:memory) { product.memory }
  let(:color) { product.color }
  let(:branch) { product.branch }
  let(:status) { product.status }
  let(:employee) { product.employee }

  describe 'GET products#index' do
    it 'returns	a	200	response' do
      get products_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET products#show' do
    subject do
      get product_path(id: product_id)
      response
    end

    context 'when :id is available' do
      let(:product_id) { product.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:product_id) { 999 }

      it 'returns	a	404	response' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'GET products#new' do
    it 'returns	a	200	response' do
      get new_product_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST products#create' do
    subject do
      post products_path, params: { product: product_params }
      response
    end

    context 'when created successfully' do
      let(:product_params) do
        attributes_for(:product, model_id: model.id, memory_id: memory.id, color_id: color.id, branch_id: branch.id,
                                 status_id: status.id, employee_id: employee.id)
      end

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:product_params) { { price: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET products#edit' do
    subject do
      get edit_product_path(id: product_id)
      response
    end

    context 'when :id is available' do
      let(:product_id) { product.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:product_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT products#update' do
    subject do
      put product_path(product), params: { product: product_params }
      response
    end

    context 'when updated successfully' do
      let(:product_params) do
        attributes_for(:product, model_id: model.id, memory_id: memory.id, color_id: color.id, branch_id: branch.id,
                                 status_id: status.id, employee_id: employee.id)
      end

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:product_params) { { price: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe 'DELETE products#destroy' do
    it 'when show product returns a 404 response' do
      product.destroy
      get product_path(product)
      expect(response).to have_http_status(404)
    end
  end
end
