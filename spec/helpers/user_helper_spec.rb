require 'spec_helper'

describe UserHelper do
  it "should return the gravatar url" do
    # Example from Gravatar
    user = User.make(email: "MyEmailAddress@example.com")
    helper.gravatar_url(user).should == "http://www.gravatar.com/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346.jpg?s=50&d=mm"
  end
end
