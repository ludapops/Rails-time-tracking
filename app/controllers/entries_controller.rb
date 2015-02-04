class EntriesController < ApplicationController
	def index
		@date = DateTime.now
		@project = Project.find params[:project_id]
		# @entries = @project.monthly_work(current_month) 
		@entries = @project.entries.where(date: @date.beginning_of_month..@date.end_of_month)
	end

	def new
		@project = Project.find params[:project_id]
		@entry = @project.entries.new
	end

	def create 
		@project = Project.find params[:project_id]
		@entry = @project.entries.new entry_params

		if @entry.save 
			redirect_to action:  'index', controller: 'entries', project_id: @project.id 
		else 
			render 'new'
		end 
	end 

	private 

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :data)
	end
end
