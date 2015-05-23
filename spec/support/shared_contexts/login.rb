shared_context 'user is logged in' do
  before do
    target = respond_to?(:user) ? user : users(:user1)

    controller.login(target.email)
  end
end
