require 'rails_helper'

RSpec.describe 'Models', type: :request do
  include_context 'Sign in'

  let(:model) { create(:model) }
  let(:manufacturer) { model.manufacturer }

  describe 'GET models#index' do
    it 'returns	a	200	response' do
      get models_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET models#show' do
    subject do
      get model_path(id: model_id)
      response
    end

    context 'when :id is available' do
      let(:model_id) { model.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:model_id) { 999 }

      it 'returns	a	404	response' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'GET models#new' do
    it 'returns	a	200	response' do
      get new_model_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST models#create' do
    subject do
      post models_path, params: { model: model_params }
      response
    end

    context 'when created successfully' do
      let(:model_params) { attributes_for(:model, manufacturer_id: manufacturer.id) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:model_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET models#edit' do
    subject do
      get edit_model_path(id: model_id)
      response
    end

    context 'when :id is available' do
      let(:model_id) { model.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:model_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT models#update' do
    subject do
      put model_path(model), params: { model: model_params }
      response
    end

    context 'when updated successfully' do
      let(:model_params) { attributes_for(:model) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:model_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end

  describe 'DELETE models#destroy' do
    let(:import_history) { create(:import_history) }
    let(:product) { import_history.product }
    let(:model) { product.model }

    subject do
      model.destroy
      get model_path(model)
      response
    end

    context 'when delete failed' do
      it 'when show model returns a 200 response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when deleted successfully' do
      it 'when show model returns a 404 response' do
        product.destroy
        expect(subject).to have_http_status(404)
      end
    end
  end
end
