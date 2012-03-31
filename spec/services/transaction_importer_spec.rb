require 'spec_helper'

describe TransactionImporter do
  let(:internal_private_key) { "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1" }
  let(:no_transactions_private_key) {"923c4c20745b1f933c52261d307ea1b8db054a9586be6cc9270ad4317368ec73"}
    
  describe "refresh_for" do
    let(:ba_several_transactions) { BitcoinAddress.make private_key: internal_private_key }
    let(:ba_no_transactions) { BitcoinAddress.make private_key: no_transactions_private_key }
    
    it "should hande when nothing to import" do
      TransactionImporter.refresh_for []
      Transaction.count.should == 0
      
      TransactionImporter.refresh_for [ba_no_transactions]
      Transaction.count.should == 0
    end
    
    it "should create the transactions and payments" do
      TransactionImporter.refresh_for [ba_several_transactions]
      
      Transaction.count.should == 2
      txs = Transaction.all

      txs[0].should_not be_new_record
      txs[0].payments.length.should == 1
      txs[0].payments[0].should_not be_new_record
      txs[0].payments[0].amount.should == 0.1
      
      txs[0].payments[0].bitcoin_address.should == ba_several_transactions

      txs[1].should_not be_new_record
      txs[1].payments.length.should == 1
      txs[1].payments[0].should_not be_new_record
      txs[1].payments[0].amount.should == -0.1

      txs[1].payments[0].bitcoin_address.should == ba_several_transactions
    end
    
    it "should be idempotent" do
      TransactionImporter.refresh_for [ba_several_transactions]
      Transaction.count.should == 2
      Payment.count.should == 2

      TransactionImporter.refresh_for [ba_several_transactions]
      Transaction.count.should == 2
      Payment.count.should == 2
    end
  end
end
