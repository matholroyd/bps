require 'spec_helper'

describe UserHelper do
  it "should return the gravatar url" do
    # Example from Gravatar
    User.make(email: "MyEmailAddress@example.com")
    helper.gravatar_url.should == "https://secure.gravatar.com/avatar/0bc83cb571cd1c50ba6f3e8a78ef1346.jpg?s=50&d=mm"
  end
  
  it 'should return default image if no user' do
    # Example from Gravatar
    helper.gravatar_url.should == "https://secure.gravatar.com/avatar/xxx.jpg?s=50&d=mm&f=y"
    
  end
end
