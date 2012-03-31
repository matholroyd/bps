class AddCommentToTransactions < ActiveRecord::Migration
  def change
    add_column :transactions, :comment, :string, length: 255
  end
end
