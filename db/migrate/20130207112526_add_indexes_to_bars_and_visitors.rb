class AddIndexesToBarsAndVisitors < ActiveRecord::Migration
  def change
    add_index :bars, :user_id
    add_index :visitors, [ :bar_id, :session_id ]
  end
end
