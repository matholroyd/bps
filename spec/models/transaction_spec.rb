require 'spec_helper'

describe Transaction do
  describe 'validations' do
    it 'blueprint should be valid' do
      Transaction.make
    end

    %w{binary}.each do |field|
      it "requires #{field}" do
        Transaction.make_unsaved(field => nil).should_not be_valid
      end
    end
    
    it "requires a proper bitcoin transaction" do
      Transaction.make_unsaved(binary: "garbage data").should_not be_valid
    end
    
    it "requires the transaction to be unique" do
      Transaction.make
      t = Transaction.make_unsaved
      t.should_not be_valid
    end
  end
end
