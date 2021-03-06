require 'rails_helper'

RSpec.describe 'Memories', type: :request do
  include_context 'Sign in'

  let(:memory) { create(:memory) }

  describe 'GET memories#index' do
    it 'returns	a	200	response' do
      get memories_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET memories#new' do
    it 'returns	a	200	response' do
      get new_memory_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST memories#create' do
    subject do
      post memories_path, params: { memory: memory_params }
      response
    end

    context 'when created successfully' do
      let(:memory_params) { attributes_for(:memory) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:memory_params) { { amount: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET memories#edit' do
    subject do
      get edit_memory_path(id: memory_id)
      response
    end

    context 'when :id is available' do
      let(:memory_id) { memory.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:memory_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT memories#update' do
    subject do
      put memory_path(memory), params: { memory: memory_params }
      response
    end

    context 'when updated successfully' do
      let(:memory_params) { attributes_for(:memory) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:memory_params) { { amount: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end
end
