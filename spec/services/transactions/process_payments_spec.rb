require 'spec_helper'

describe Transactions::ProcessPayments do
  let(:internal_address)  { "1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" }
  let(:internal_private_key) { "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1" }

  describe "for" do
    it "does nothing if passed nothing" do
      lambda {
        Transactions::ProcessPayments.for []
      }.should_not change(Payment, :count)
    end
    
    context "after process transactions" do
      before :each do
        BitcoinAddress.create! private_key: internal_private_key, description: "Pizza"
        txs = Transactions::Import.from_blockexplorer [internal_address]
        Transactions::ProcessPayments.for txs
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
  
end
