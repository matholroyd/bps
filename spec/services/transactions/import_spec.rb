require 'spec_helper'

describe Transactions::Import do
  let(:internal_address)  { "1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" }
  let(:address_nothing)     { "1BDnQ3UCwTTkL4jKLZabaiu9qd9566kJKf" }
  
  it "does nothing if no related transactions" do
    lambda {
      Transactions::Import.from_blockexplorer [address_nothing]
    }.should_not change(Transaction, :count)
  end
  
  it "imports transactions when related to address" do
    lambda {
      Transactions::Import.from_blockexplorer [internal_address]
    }.should change(Transaction, :count)
  end
  
  it "returns the new transactions" do
    txs = Transactions::Import.from_blockexplorer [internal_address]
    txs.should == Transaction.all
  end
end
