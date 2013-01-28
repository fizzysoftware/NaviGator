class Bar < ActiveRecord::Base
  attr_accessible :active, :link, :link_url, :message, :name

  belongs_to :user

  def self.find_with_sendable_fields( _id )
    select( [:link, :link_url, :message]).find( _id)
  end
end
