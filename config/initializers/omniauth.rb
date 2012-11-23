Rails.application.config.middleware.use OmniAuth::Builder do
  # If you don't need a refresh token -- if you're only using Google for account
  # creation/auth and don't need google services -- set the access_type to
  # 'online'.
  # Also, set the approval prompt to an empty string, since otherwise
  # it will be set to 'force', which makes users manually approve to the Oauth
  # every time they log in.
  # See http://googleappsdeveloper.blogspot.com/2011/10/upcoming-changes-to-oauth-20-endpoint.html
  secret = YAML.load_file Rails.root.join('config', 'omniauth.yaml')
  google_id = secret[:google][:client_id]
  google_secret = secret[:google][:client_secret]

  twitter_id = secret[:twitter][:consumer_key]
  twitter_secret = secret[:twitter][:consumer_secret]

  provider :google_oauth2, google_id, google_secret, {access_type: 'online', approval_prompt: ''}
  provider :twitter, twitter_id, twitter_secret
end
