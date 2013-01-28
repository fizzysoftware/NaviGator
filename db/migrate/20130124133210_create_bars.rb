class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.string :message
      t.string :link
      t.string :link_url
      t.boolean :active
      t.references :user

      t.timestamps
    end
  end
end
