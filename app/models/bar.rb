class Bar < ActiveRecord::Base
  attr_accessible :active, :link, :link_url, :message, :name, :text_color, :bg_color, :link_text_color, :link_bg_color

  belongs_to :user

  def self.find_with_sendable_fields( _id )
    select( [:link, :link_url, :message]).find( _id)
  end
end
