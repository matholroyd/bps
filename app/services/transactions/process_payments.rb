module Transactions
  class ProcessPayments
    class << self
      def for(transactions)
        addresses = BitcoinAddress.all.collect(&:address)

        transactions.each do |transaction|
          transaction.bitcoin_tx.in.each do |txin|
            process_in_tx transaction, txin, addresses
          end

          transaction.bitcoin_tx.out.each do |txout|
            process_out_tx transaction, txout, addresses
          end
        end
      end
      
      private
      
      def process_in_tx(transaction, txin, addresses)
        prev_transaction = Transaction.find_by_bitcoin_tx_hash(txin.previous_output)
        if prev_transaction
          prev_tx_out = prev_transaction.bitcoin_tx.out[txin.prev_out_index]
          addr = Bitcoin::Script.new(prev_tx_out.pk_script).get_address

          if addresses.include? addr
            ba = BitcoinAddress.find_by_address! addr
            amount = -BigDecimal(prev_tx_out.value.to_s) / Wallet::Offset

            find_or_create_payment transaction, ba, amount
          end
        end
      end

      def process_out_tx(transaction, txout, addresses)
        addr = Bitcoin::Script.new(txout.pk_script).get_address
        if addresses.include? addr
          ba = BitcoinAddress.find_by_address! addr
          amount = BigDecimal(txout.value.to_s) / Wallet::Offset

          find_or_create_payment transaction, ba, amount
        end
      end

      def find_or_create_payment(transaction, ba, amount)
        if transaction.payments.find_by_bitcoin_address_id(ba.id).nil?
          transaction.payments.create! amount: amount, bitcoin_address: ba, transaction: transaction
        end
      end
      
    end
  end
end