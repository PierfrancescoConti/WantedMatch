OmniAuth.config.logger = Rails.logger

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '166309987397-q5on8k7psc3l1u0cqlro496voadd6r85.apps.googleusercontent.com', 'miuSOhvRYWOkvm9LN_KuRLC-', {client_options: {ssl: {ca_file: Rails.root.join("cacert.pem").to_s}}}
end