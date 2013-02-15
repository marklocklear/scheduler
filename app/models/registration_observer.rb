class RegistrationObserver < ActiveRecord::Observer
	def after_create(registration)
		@session = registration.session
		close_session if seats_equal_zero
	end

	private
	def close_session
		@session.update_attribute :active, false
	end

	def seats_equal_zero
		@session.current_number_seats.zero?	
	end
end
