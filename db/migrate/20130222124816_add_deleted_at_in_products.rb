class AddDeletedAtInProducts < ActiveRecord::Migration
  def change
    add_column :bars, :deleted_at, :datetime
  end
end
