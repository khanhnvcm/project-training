require 'rails_helper'

RSpec.describe 'Manufacturers', type: :request do
  include_context 'Sign in'

  let(:manufacturer) { create(:manufacturer) }

  describe 'GET manufacturers#index' do
    it 'returns	a	200	response' do
      get manufacturers_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET manufacturers#new' do
    it 'returns	a	200	response' do
      get new_manufacturer_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST manufacturers#create' do
    subject do
      post manufacturers_path, params: { manufacturer: manufacturer_params }
      response
    end

    context 'when created successfully' do
      let(:manufacturer_params) { attributes_for(:manufacturer) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:manufacturer_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET manufacturers#edit' do
    subject do
      get edit_manufacturer_path(id: manufacturer_id)
      response
    end

    context 'when :id is available' do
      let(:manufacturer_id) { manufacturer.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:manufacturer_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT manufacturers#update' do
    subject do
      put manufacturer_path(manufacturer), params: { manufacturer: manufacturer_params }
      response
    end

    context 'when updated successfully' do
      let(:manufacturer_params) { attributes_for(:manufacturer) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:manufacturer_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end
end
