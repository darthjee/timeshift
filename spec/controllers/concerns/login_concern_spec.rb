require 'spec_helper'

describe LoginConcern do
  controller do
    include LoginConcern
  end

  describe '#user' do
    context 'when user is not logged in' do
      it do
        expect(controller.user).to be_nil
      end
    end

    context 'when user is logged in' do
      include_context 'user is logged in'
      let(:user) { users(:user2) }

      it do
        expect(controller.user).to eq(user)
      end
    end
  end
end
