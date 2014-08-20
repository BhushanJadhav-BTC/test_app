class CreatePages < ActiveRecord::Migration
  def change
    create_table :pages do |t|
      t.string :name
      t.string :code
      t.string :description
      t.string :billing
      t.date :start
      t.date :deadline
      t.date :end
      t.string :github
      t.string :status
      t.integer :client_id
      t.timestamps
    end
   add_index :pages, [:client_id, :created_at]
  end
end
