User.find_or_create_by(
  email: 'admin@example.com',
  password_digest: BCrypt::Password.create('secret'),
  admin: true
)
