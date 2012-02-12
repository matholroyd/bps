require 'spec_helper'

describe Transaction do
  describe 'validations' do
    it 'blueprint should be valid' do
      Transaction.make
    end

    %w{raw_in_hex}.each do |field|
      it "requires #{field}" do
        Transaction.make_unsaved(field => nil).should_not be_valid
      end
    end
  end
end
