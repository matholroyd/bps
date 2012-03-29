desc "Import any transctions found for any bitcoin addresses"
task :import_transactions => :environment  do
  TransactionImporter.refresh_for BitcoinAddress.all
end