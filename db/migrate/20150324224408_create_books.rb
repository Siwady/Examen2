class CreateBooks < ActiveRecord::Migration
  def change
    create_table :books do |t|
      t.string :title
      t.string :description
      t.decimal :price
      t.string :category
      t.references :author, index: true

      t.timestamps
    end
  end
end
