class AddHashbodyToBooks < ActiveRecord::Migration[5.2]
  def change
    add_column :books, :hashbody, :text
  end
end
