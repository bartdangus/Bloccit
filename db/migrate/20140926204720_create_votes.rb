class CreateVotes < ActiveRecord::Migration
  def change
    create_table :votes do |t|
      t.references :user_id, index: true
      t.references :post_id, index: true
      t.integer :value

      t.timestamps
    end
  end
end
