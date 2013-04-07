Rails.application.config.middleware.use OmniAuth::Builder do  
  provider :twitter, 'impmSZo4SIXnR1p8Jp9bQ', 'dikuqRIHNqMWRI3PKTOeJU5YjVCTRAzu0VzmEWdVKA', client_options: {authorize_path: '/oauth/authorize'}  
  provider :facebook, '156793807822611', 'd6ee34e870c76ae13b6589ada880168d'
  provider :openid, name: 'openid'
end
