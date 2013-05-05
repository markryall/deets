class AddIndexToPeople < ActiveRecord::Migration
  def change
    add_hstore_index :people, :links
  end
end
