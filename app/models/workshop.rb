class Workshop < Event
	def generate_title
		self.title = "#{self.topic} Workshop with #{self.host_firstname} #{self.host_lastname}"
	end
	
	def deliver
		return false unless valid?
		Pony.mail({
			:from => %("#{host_firstname}"),
			:reply_to =>  %("#{@current_user}"),
			:subject => "Workshop Proposal submitted!",
			:body => %("#{self.title}"),
		})
		return true
	end



	def deliver
		return false unless valid?
		Pony.mail({
			:from => %("#{host_firstname}"),
			:reply_to => %("#{@current_user_email}"),
			:subject => %("#{topic} Workshop with #{host_firstname} #{host_lastname,
			:body => %("#{self.title}"),
		})
		return true
	end
	

	state_machine :state, :initial => :started do

		state :pending do
			validates_presence_of :payment_options, :begins_at_time, :ends_at_time, :ends_at, :registration_max, :price
			validates_numericality_of :price, :greater_than_or_equal_to => 0
			validates_numericality_of :registration_max, :greater_than => :registration_min, :message => "must be greater than the minimum number of participants."	
		end
	end
end