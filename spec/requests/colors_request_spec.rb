require 'rails_helper'

RSpec.describe 'Colors', type: :request do
  include_context 'Sign in'

  let(:color) { create(:color) }

  describe 'GET colors#index' do
    it 'returns	a	200	response' do
      get colors_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET colors#new' do
    it 'returns	a	200	response' do
      get new_color_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST colors#create' do
    subject do
      post colors_path, params: { color: color_params }
      response
    end

    context 'when created successfully' do
      let(:color_params) { attributes_for(:color) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:color_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET colors#edit' do
    subject do
      get edit_color_path(id: color_id)
      response
    end

    context 'when :id is available' do
      let(:color_id) { color.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:color_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT colors#update' do
    subject do
      put color_path(color), params: { color: color_params }
      response
    end

    context 'when updated successfully' do
      let(:color_params) { attributes_for(:color) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:color_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end
end
