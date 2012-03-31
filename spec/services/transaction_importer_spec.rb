require 'spec_helper'

describe TransactionImporter do
  let(:address_several_transactions)  { "1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK" }

  let(:internal_address)  { "1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" }
  let(:internal_private_key) { "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1" }

  let(:no_transactions_private_key) {"923c4c20745b1f933c52261d307ea1b8db054a9586be6cc9270ad4317368ec73"}
  let(:no_transactions_address) {"12LDktNb5cmANNmXzhCZfRkN8j8MqsBgts"}
  

  describe "process_payments_for" do
    it "does nothing if passed nothing" do
      lambda {
        TransactionImporter.process_payments_for []
      }.should_not change(Payment, :count)
    end
    
    context "after imported transactions" do
      before :each do
        BitcoinAddress.create! private_key: internal_private_key, description: "Pizza"
        txs = Transactions::Import.from_blockexplorer [internal_address]
        TransactionImporter.process_payments_for txs
      end

      it "creates 2 payments" do
        Transaction.all.count.should == 2
      end

      context "incoming transaction" do
        subject { Transaction.first }
        
        it do
          subject.payments.length.should == 1
        end

        it do
          subject.payments[0].amount.should == 0.1
        end
        
        it do
          subject.payments[0].bitcoin_address.address.should == internal_address
        end
        
        it do
          subject.amount.should == 0.1
        end
        
        it do
          subject.descriptions.should == ["Pizza"]
        end
      end
      
      context "outoing transaction" do
        subject { Transaction.last }
        
        it do
          subject.payments.length.should == 1
        end
        
        it do
          subject.payments[0].amount.should == -0.1
        end
        
        it do
          subject.payments[0].bitcoin_address.address.should == internal_address
        end
        
        it do
          subject.amount.should == -0.1
        end
        
        it do
          subject.descriptions.should == []
        end
      end
    end
  end
    
  describe "refresh_for" do
    let(:ba_several_transactions) { BitcoinAddress.make private_key: internal_private_key }
    let(:ba_no_transactions) { BitcoinAddress.make private_key: no_transactions_private_key }
    
    before :each do
      # Check that actually have the right private key
      ba_several_transactions.address.should == internal_address
    end
    
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
