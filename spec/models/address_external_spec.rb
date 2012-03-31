require 'spec_helper'

describe AddressExternal do
  subject { AddressExternal.make }
  
  it "can be marked as forwardable" do
    lambda {
      subject.mark_as_forwardable!
    }.should change(subject, :forwardable?).from(false).to(true)
  end
  
  it "must have a valid address" do
    AddressExternal.make_unsaved(address: "blah").should_not be_valid
  end
  
  it "can return a random forwardable"
end