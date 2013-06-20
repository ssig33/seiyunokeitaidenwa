Seiyunokeitaidenwa::Application.configure do
  config.cache_classes = true
  config.consider_all_requests_local       = false
  config.action_controller.perform_caching = true
  config.serve_static_assets = true
  config.assets.compress = true
  config.assets.compile = false
  config.assets.digest = true
  config.log_level = :info
  config.i18n.fallbacks = true
  config.active_support.deprecation = :notify
  config.cache_store = :dalli_store
  config.eager_load = true
end

#Seiyunokeitaidenwa::Application.config.middleware.use ExceptionNotifier,
#  :email_prefix => "[Seiyunokeitaidenwa::Application-production] ",
#  :sender_address => "notifier <seiyunokeitaidenwa@ssig33.com>",
#  :exception_recipients => %w{mail@ssig33.com}

