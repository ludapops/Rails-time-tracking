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
			flash[:notice] = "Entry created successfully"
			redirect_to action:  'index', controller: 'entries', project_id: @project.id 
		else 
			flash[:error] = "Something went wrong"
			render 'new'
		end 
	end 

	def edit
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

	end

	def update 
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

		if @entry.update_attributes(entry_params)
			redirect_to action:  'index', controller: 'entries', project_id: @project.id
		else 
			render 'edit'

		end
	end

	def destroy
		@project = Project.find params[:project_id]
		@entry = @project.entries.find params[:id]

		if @entry.destroy
			redirect_to action: 'index', controller: 'entries', project_id: @project.id
		end

	end

	private 

	def entry_params
		params.require(:entry).permit(:hours, :minutes, :date)
	end
end
