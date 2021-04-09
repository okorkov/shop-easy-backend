if Rails.env == 'production'
  Rails.application.config.session_store :cookie_store, key: '_shop_easy_app', same_site: :none, secure: true
else
  Rails.application.config.session_store :cookie_store, key: '_shop_easy_app'
end