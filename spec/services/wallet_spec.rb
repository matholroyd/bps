require 'spec_helper'

describe Wallet do
  context "calculates the balance" do
    it "sums the transaction amounts" do
      Payment.should_receive(:sum).with(:amount) { BigDecimal("10") }
      Wallet.balance.should == BigDecimal("10")
    end
  end
  
  context "sending bitcoins" do
    let(:address) { BitcoinAddress.create!( 
        private_key: "1e2e0bc6893d42a462b0039b5c15c3da3378c8d0ec44556b9608efdb2b3caff1",
        description: "test"
    ) }
    
    before :each do
      TransactionImporter.import_for [address]
      address.transactions.first.destroy
      address.payments.first.destroy
    end
    
    it "creates a transaction" do
      Wallet.send_bitcoins_tx(to: BitcoinAddress.generate.address, amount: BigDecimal("10"))
    end
    
    it "transmits the transaction"
    it "errors out if there is not enough balance"
  end
  
end