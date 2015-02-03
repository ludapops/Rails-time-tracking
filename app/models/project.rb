class Project < ActiveRecord::Base
	has_many :entries
	
	def self.iron_find(id)
		where(id: id).first
	end

	def self.clean_old(time)
		# where(update_at: id.)
		to_kill = where("updated_at < ?", time)
		to_kill.destroy_all
	end

	def self.last_created_projects(n)
		order(created_at: :desc).limit(n)
	end


end


  		

