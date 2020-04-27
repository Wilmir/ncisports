class CreateIssues < ActiveRecord::Migration[6.0]
  def change
    create_table :issues do |t|
      t.string :type
      t.string :title
      t.text :description
      t.references :customer, null: false, foreign_key: true

      t.timestamps
    end
    add_index :issues, [:customer_id, :created_at]
  end
end
