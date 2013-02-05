class Bar < ActiveRecord::Base
  attr_accessible :active, :link, :link_url, :message, :name, :text_color, :bg_color, :link_text_color, :link_bg_color

  belongs_to :user
  has_many :visitors, dependent: :destroy

  validates :link, :link_url, :message, :name, presence: true

  before_create :activate_bar

  def hits_since( _days )
    visitors.since( _days ).sum(:hits)
  end

  def hit_through_rate_since( _days )
    ( ( hits_since( _days ) * 100 ) / visitors.count_since( _days ) ).to_i rescue 0
  end

  protected
  def activate_bar
    self.active = true
  end
end
