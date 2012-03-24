require 'spec_helper'

describe Wallet do
  context "calculates the balance" do
    it "sums the transaction amounts" do
      Payment.should_receive(:sum).with(:amount) { BigDecimal("10") }
      Wallet.balance.should == BigDecimal("10")
    end
  end
  
  
  context "sending bitcoins" do
    let(:address) { Bitcoin::Key.generate.addr }
    
    it "creates a transaction" do
      Wallet.send_bitcoins(to: address, amount: BigDecimal("10"))
    end
    
    it "transmits the transaction"
    it "errors out if there is not enough balance"
  end
  
end