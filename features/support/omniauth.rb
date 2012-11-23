Before('@omniauth') do
  OmniAuth.config.test_mode = true
#  request.env["devise.mapping"] = Devise.mappings[:user]
#  request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:twitter]
#  request.env["omniauth.auth"] = OmniAuth.config.mock_auth[:google_oauth2]
  OmniAuth.config.add_mock( :google_oauth2,
    { :info => { :name => "Jonh Doe", :email => "example@example.com" },
      :uid => '12345'})
  OmniAuth.config.add_mock( :twitter,
    { :info => { :name => "Jonh Doe", :nickname => "johnydo" },
      :uid => '12345'})
end

After('@omniauth') do
  OmniAuth.config.test_mode = false
end
