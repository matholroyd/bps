require 'digest/md5'

module UserHelper
  def gravatar_url(options = {})
    # Showing gravatar slows down acceptance specs, so turn off, but allow
    # manually turning on for heplers specs
    if !Rails.env.test? || options[:on] 
      if User.first
        hash = Digest::MD5.hexdigest(User.first.email.strip.downcase)
        "https://secure.gravatar.com/avatar/#{hash}.jpg?s=50&d=mm"
      else
        "https://secure.gravatar.com/avatar/xxx.jpg?s=50&d=mm&f=y"
      end
    end
  end
  
  
end