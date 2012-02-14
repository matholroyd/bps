# http://clearcove.ca/2010/11/how-to-secure-a-rails-app-on-heroku-with-ssl-firesheep/
# Force cookies only sent over SSL
# Disable cookies from being accessible via javascript
BPS::Application.config.session_store(
  :cookie_store,
  :key => '_bps_app_session',
  :secure => Rails.env.production?, # Only send cookie over SSL when in production mode
  :http_only => true # Don't allow Javascript to access the cookie (mitigates cookie-based XSS exploits)
)
