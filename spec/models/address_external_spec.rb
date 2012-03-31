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
  
  it "can return all forwardable addresses" do
    AddressExternal.make
    forwardableA = AddressExternal.make(forwardable: true)
    AddressExternal.make
    forwardableB = AddressExternal.make(forwardable: true)
    AddressExternal.make
    
    AddressExternal.forwardable.sort.should == [forwardableA, forwardableB].sort
  end
  
  it "can return a random forwardable" do
    5.times { AddressExternal.make }
    forwardables = []
    5.times { forwardables << AddressExternal.make(forwardable: true) }

    10.times do
      forwardables.should include(AddressExternal.random_forwardable)
    end
  end
end