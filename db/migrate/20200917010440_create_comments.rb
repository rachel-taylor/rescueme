class CreateComments < ActiveRecord::Migration[6.0]
  def change
    create_table :comments do |t|
      t.string :name
      t.text :description
      t.belongs_to :user
      t.belongs_to :note
      t.timestamps null:false
    end
  end
end
