class Bar < ActiveRecord::Base
  attr_accessible :active, :link, :link_url, :message, :name, :text_color, :bg_color, :link_text_color, :link_bg_color

  belongs_to :user
  has_many :visitors

  validates :link, :link_url, :message, :name, presence: true

  def hits
    visitors.sum(:hits)
  end

  def hit_through_rate
    ( ( hits * 100 ) / visitors.count ).to_i rescue 0
  end
end
