class RemoveNameAndUsernameFromUser < ActiveRecord::Migration
  def up
    remove_column :users, :name
    remove_column :users, :username
  end

  def down
    add_column :users, :username, :string
    add_column :users, :name, :string
  end
end
