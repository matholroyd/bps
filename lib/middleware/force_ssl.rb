# http://clearcove.ca/2010/11/how-to-secure-a-rails-app-on-heroku-with-ssl-firesheep/
# Force SSL in Rack
module Middleware 
  class ForceSSL
    def initialize(app)
      @app = app
    end
 
    def call(env)
      if env['HTTPS'] == 'on' || env['HTTP_X_FORWARDED_PROTO'] == 'https'
        @app.call(env)
      else
        req = Rack::Request.new(env)
        [301, { "Location" => req.url.gsub(/^http:/, "https:") }, []]
      end
    end
  end
end
 
