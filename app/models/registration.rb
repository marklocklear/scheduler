class Registration < ActiveRecord::Base
	belongs_to :session
  attr_accessible :email, :first_name, :last_name, :phone, :session_id, :student_number

	validates_presence_of :first_name, :last_name, :email, :student_number, :phone
end
