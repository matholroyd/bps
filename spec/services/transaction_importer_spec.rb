require 'spec_helper'

describe TransactionImporter do
  let(:address_nothing)     { "1BDnQ3UCwTTkL4jKLZabaiu9qd9566kJKf" }
  let(:address_in_and_out)  { "1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" }
  
  describe "pull_transactions" do
    it "should return nil if no transactions" do
      TransactionImporter.pull_transactions(address_nothing).should == []
    end
    
    it "should import transaction data" do
      txs = TransactionImporter.pull_transactions(address_in_and_out)
      txs.count.should == 2
    end
  end
end
