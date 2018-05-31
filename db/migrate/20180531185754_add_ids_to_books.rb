class AddIdsToBooks < ActiveRecord::Migration[5.1]
  def change
  	add_column :books, :author_id, :integer
  	add_column :authors, :book_id, :integer
  end
end
