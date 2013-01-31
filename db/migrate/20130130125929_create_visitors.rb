class CreateVisitors < ActiveRecord::Migration
  def change
    create_table :visitors do |t|
      t.string     :session_id
      t.integer    :hits, :default => 0
      t.references :bar

      t.timestamps
    end
  end
end
