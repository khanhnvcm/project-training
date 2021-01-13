# frozen_string_literal: true

require 'spec_helper'

module LogInHelper
  def sign_in(user)
    sign_in user
  end
end

RSpec.shared_context 'Sign in', :sign_in do
  let(:user) { login_user.reload }
  let(:login_user) { create(:user) }
  before do
    sign_in(user)
  end
end

RSpec.configure do |config|
  config.include_context 'Sign in', :sign_in
  config.include LogInHelper, type: :request
end