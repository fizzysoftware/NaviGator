class Bar < ActiveRecord::Base
  include ActAsCountable

  attr_accessible :active, :link, :link_url, :message, :name, :text_color, :bg_color, :link_text_color, :link_bg_color

  belongs_to :user
  has_many :visitors, dependent: :destroy

  validates :message, :name, presence: true
  validates :link, :link_url, :presence => true, :if => :link_details_present?

  before_create :activate_bar
  after_initialize

  scope :actives, where( active: 1 )

  def hits_since( _days )
    visitors.since( _days ).sum(:hits)
  end

  def hit_through_rate_since( _days )
    ( ( hits_since( _days ) * 100 ) / visitors.count_since( _days ) ).to_i rescue 0
  end

  def link_details_present?
    link.present? || link_url.present?
  end

  protected
  def activate_bar
    self.active = true
  end
end
