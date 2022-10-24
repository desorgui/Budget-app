class CreateCategoryTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :category_transactions do |t|
      t.string :name, null: false
      t.string :photo
      t.text :description, null: false
      t.float :payment, null: false, default: 0
    
      t.references :category, null: false, foreign_key: { to_table: 'categories' }

      t.timestamps
    end
  end
end
