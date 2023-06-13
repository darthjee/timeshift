# frozen_string_literal: true

Zyra
  .register(User, find_by: :email)
  .on(:build) { |user| user.password = SecureRandom.hex(10) }

Zyra.register(Client, find_by: :name)
Zyra.register(Account, find_by: :name)

user = Zyra.find_or_create(
  :user,
  email: 'email@srv.com',
  login: 'user',
  name: 'user',
  password: '123456'
)

Zyra.find_or_create(
  :client,
  name: 'First Client',
  user: user
)

Zyra.find_or_create(
  :client,
  name: 'Second Client',
  user: user
)

Zyra.find_or_create(
  :account,
  name: 'First Account',
  user: user
)

Zyra.find_or_create(
  :account,
  name: 'Second Account',
  user: user
)
