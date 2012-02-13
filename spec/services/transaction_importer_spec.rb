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

      txs[0].should be_new_record

      txs[0].payments.length.should == 1
      txs[0].payments[0].should be_new_record
      txs[0].payments[0].amount.should == 0.1
      
      txs[0].payments[0].bitcoin_address.should be_new_record
      txs[0].payments[0].bitcoin_address.address.should == address_in_and_out

      txs[1].payments.length.should == 1
      txs[1].payments[0].should be_new_record
      txs[1].payments[0].amount.should == -0.1
    end
  end
end
