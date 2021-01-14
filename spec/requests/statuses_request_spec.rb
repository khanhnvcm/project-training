require 'rails_helper'

RSpec.describe 'Statuses', type: :request do
  include_context 'Sign in'

  let(:status) { create(:status) }

  describe 'GET statuses#index' do
    it 'returns	a	200	response' do
      get statuses_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET statuses#new' do
    it 'returns	a	200	response' do
      get new_status_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST statuses#create' do
    subject do
      post statuses_path, params: { status: status_params }
      response
    end

    context 'when created successfully' do
      let(:status_params) { attributes_for(:status) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:status_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET statuses#edit' do
    subject do
      get edit_status_path(id: status_id)
      response
    end

    context 'when :id is available' do
      let(:status_id) { status.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:status_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT statuses#update' do
    subject do
      put status_path(status), params: { status: status_params }
      response
    end

    context 'when updated successfully' do
      let(:status_params) { attributes_for(:status) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:status_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end
end
