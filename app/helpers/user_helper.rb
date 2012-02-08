require 'digest/md5'

module UserHelper
  def gravatar_url(user)
    hash = Digest::MD5.hexdigest(user.email.strip.downcase)
    "http://www.gravatar.com/avatar/#{hash}"
  end
  
  
end