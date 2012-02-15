desc "Import any transctions found for any bitcoin addresses"
task :import_transactions => :environment  do
  TransactionImporter.import_all BitcoinAddress.all
end