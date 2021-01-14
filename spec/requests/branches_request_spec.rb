require 'rails_helper'

RSpec.describe 'Branches', type: :request do
  include_context 'Sign in'

  let(:branch) { create(:branch) }

  describe 'GET branches#index' do
    it 'returns	a	200	response' do
      get branches_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'GET branches#show' do
    subject do
      get branch_path(id: branch_id)
      response
    end

    context 'when :id is available' do
      let(:branch_id) { branch.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:branch_id) { 999 }

      it 'returns	a	404	response' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'GET branches#new' do
    it 'returns	a	200	response' do
      get new_branch_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST branches#create' do
    subject do
      post branches_path, params: { branch: branch_params }
      response
    end

    context 'when created successfully' do
      let(:branch_params) { attributes_for(:branch) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when create failed' do
      let(:branch_params) { { name: '' } }

      it 'renders the new template' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET branches#edit' do
    subject do
      get edit_branch_path(id: branch_id)
      response
    end

    context 'when :id is available' do
      let(:branch_id) { branch.id }

      it 'returns	a	200	response' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'when :id is not available' do
      let(:branch_id) { 999 }

      it 'renders 404' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT branches#update' do
    subject do
      put branch_path(branch), params: { branch: branch_params }
      response
    end

    context 'when updated successfully' do
      let(:branch_params) { attributes_for(:branch) }

      it 'returns	a	302	response' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'when update failed' do
      let(:branch_params) { { name: '' } }

      it 'renders the edit template' do
        expect(subject).to render_template(:edit)
      end
    end
  end
end
