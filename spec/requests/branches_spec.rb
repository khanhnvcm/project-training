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

    context 'returns	a	200	response' do
      let(:branch_id) { branch.id }

      it 'if :id is available' do
        expect(subject).to have_http_status(200)
      end
    end

    context 'returns	a	404	response' do
      let(:branch_id) {999}

      it 'if :id is not available' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'GET branches#new' do
    it 'renders the new template' do
      get new_branch_path
      expect(response).to have_http_status(200)
    end
  end

  describe 'POST branches#create' do
    subject do
      post branches_path, params: { branch: branch_params }
      response
    end

    context 'Created successfully' do
      let(:branch_params) { attributes_for(:branch) }

      it 'create user with valid attributes' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'Create Failed' do
      let(:branch_params) { { name: '' } }

      it 'create user with unvalid attributes' do
        expect(subject).to render_template(:new)
      end
    end
  end

  describe 'GET branches#edit' do
    subject do
      get edit_branch_path(id: branch_id)
      response
    end
    
    context 'Renders the edit template' do
      let(:branch_id) { branch.id }

      it 'if :id is available' do
        expect(subject).to render_template(:edit)
      end
    end

    context 'Renders 404' do
      let(:branch_id) {999}

      it 'if :id is not available' do
        expect(subject).to have_http_status(404)
      end
    end
  end

  describe 'PUT branches#update' do
    subject do
      put branch_path(branch), params: { branch: branch_params }
      response
    end

    context 'Updated successfully' do
      let(:branch_params) { attributes_for(:branch) }

      it 'update with valid attributes' do
        expect(subject).to have_http_status(302)
      end
    end

    context 'Update Failed' do
      let(:branch_params) { { name: '' } }

      it 'update with unvalid attributes' do
        expect(subject).to render_template(:edit)
      end
    end
  end
  
end
