class AddStylingAttributesToBar < ActiveRecord::Migration
  def change
    add_column :bars, :text_color, :string
    add_column :bars, :bg_color, :string
    add_column :bars, :link_text_color, :string
    add_column :bars, :link_bg_color, :string
  end
end
