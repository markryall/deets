class CreatePeople < ActiveRecord::Migration
  def change
    create_table :people do |t|
      t.string :name
      t.string :email
      t.integer :birth
      t.string :lastfm
      t.hstore :links

      t.timestamps
    end
  end
end
