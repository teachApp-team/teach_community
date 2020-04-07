Rails.application.config.middleware.use OmniAuth::Builder do
  provider :google_oauth2, '649063419741-ddc8s6gli2gnc1jjmkjsaph1prcflsfo.apps.googleusercontent.com', '1Fyj1rP-dQPqVVq227FfzILE'
end