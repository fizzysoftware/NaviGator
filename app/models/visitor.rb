class Visitor < ActiveRecord::Base
  attr_accessible :session_id

  belongs_to :bar

  validates :session_id, presence: true
end
