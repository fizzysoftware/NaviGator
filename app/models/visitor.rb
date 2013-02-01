class Visitor < ActiveRecord::Base
  attr_accessible :session_id

  belongs_to :bar

  validates :session_id, presence: true

  scope :since, lambda { |_number| where( :created_at => ( _number.days.ago.end_of_day..Time.now))}

  def self.count_since( _number = nil )
    if( _number.present? )
      since( _number).count
    end
  end
end
