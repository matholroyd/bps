require 'spec_helper'

describe TransactionImporter do
  let(:internal_address)  { "1JDfUiJHZ6pDY6wWYTx86RYjDCW7QxCofs" }
  let(:internal_private_key) { "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1" }
  let(:address_several_transactions)  { "1G8A6rRugWuqGpXpRKBip1DpVVUV9KtALK" }

  describe "pull_transaction" do
    
    # Something wrong with this transaction...even block explorer seems to have trouble
    # viewing it (viewing the address on block explorer causes 'Gateway Timeout')
    # it "should handle transaction same in and out address" do
    #   tx = TransactionImporter.pull_transaction(
    #     'c4bcb05690c97d89150f744958f821eeca380814235c2bbcd579893ce9109d09',
    #     address_in_and_out
    #   )
    #   tx.payments.length.should == 2
    # end
    
    it "should extract payment from raw tx" do
      tx = TransactionImporter.pull_transaction(
        '1db5acf9dea096ffcbcb135627f2b3e4c7ba7be8d6432f872c225530d542c337',
        address_several_transactions
      )
      tx.payments.length.should == 1
      tx.payments[0].amount.should == 11
    end

  end
  
  describe "pull_transactions" do
    let(:address_nothing)     { "1BDnQ3UCwTTkL4jKLZabaiu9qd9566kJKf" }
    let(:address_in_and_out)  { "1VayNert3x1KzbpzMGt2qdqrAThiRovi8" }
    
    it "should return nil if no transactions" do
      TransactionImporter.pull_transactions(address_nothing).should == []
    end

    it "pulls raw data into transactions/payments/addresses" do
      txs = TransactionImporter.pull_transactions internal_address
      txs.count.should == 2

      txs[0].should be_new_record
      txs[0].payments.length.should == 1
      txs[0].payments[0].should be_new_record
      txs[0].payments[0].amount.should == 0.1
      
      txs[0].payments[0].bitcoin_address.should be_new_record
      txs[0].payments[0].bitcoin_address.address.should == internal_address

      txs[1].should be_new_record
      txs[1].payments.length.should == 1
      txs[1].payments[0].should be_new_record
      txs[1].payments[0].amount.should == -0.1

      txs[1].payments[0].bitcoin_address.should be_new_record
      txs[1].payments[0].bitcoin_address.address.should == internal_address
    end
    
    it "can handle bunches of transactions" do
      txs = TransactionImporter.pull_transactions address_several_transactions
      txs.length.should == 9
      
      txs.collect(&:payments).flatten.inject(BigDecimal('0')) do |sum, payment|
        sum + payment.amount
      end.should == BigDecimal("5.43045")
    end
  end
  
  describe "import_for" do
    let(:bitcoin_address) { BitcoinAddress.make private_key: internal_private_key }
    
    before :each do
      # Check that actually have the right private key
      bitcoin_address.address.should == internal_address
    end
    
    it "should create the transactions and payments" do
      TransactionImporter.import_for bitcoin_address
      
      Transaction.count.should == 2
      txs = Transaction.all

      txs[0].should_not be_new_record
      txs[0].payments.length.should == 1
      txs[0].payments[0].should_not be_new_record
      txs[0].payments[0].amount.should == 0.1
      
      txs[0].payments[0].bitcoin_address.should == bitcoin_address

      txs[1].should_not be_new_record
      txs[1].payments.length.should == 1
      txs[1].payments[0].should_not be_new_record
      txs[1].payments[0].amount.should == -0.1

      txs[1].payments[0].bitcoin_address.should == bitcoin_address
    end
    
    it "should be idempotent" do
      TransactionImporter.import_for bitcoin_address
      Transaction.count.should == 2
      Payment.count.should == 2

      TransactionImporter.import_for bitcoin_address
      Transaction.count.should == 2
      Payment.count.should == 2
    end
  end
end
