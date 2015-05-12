class CreateScopes < ActiveRecord::Migration
  def change
    create_table :scopes do |t|
      t.string :name
      t.text :description
      t.timestamps
    end
  end
end
