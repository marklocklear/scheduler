class Session < ActiveRecord::Base
	belongs_to :org
	has_many :registrations
  attr_accessible :active, :class_date, :class_timetime, :org_id, :name, :seats, :class_to_date
  attr_accessor :class_to_date

  def current_number_seats
    self.seats - registrations.count
  end

	validates :name, :presence => true
	validates :seats, :presence => true
	validates :class_date, :presence => true
	validates :class_to_date, :presence => true
end
