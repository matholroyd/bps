require 'spec_helper'

describe BitcoinAddress do
  describe 'validations' do
    it 'blueprint should be valid' do
      BitcoinAddress.make
    end

    %w{address public_key private_key description}.each do |field|
      it "requires #{field}" do
        BitcoinAddress.make_unsaved(field => nil).should_not be_valid
      end
    end
  end
end
