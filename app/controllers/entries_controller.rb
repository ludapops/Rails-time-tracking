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
end
