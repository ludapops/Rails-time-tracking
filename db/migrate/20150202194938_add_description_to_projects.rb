class AddDescriptionToProjects < ActiveRecord::Migration
  def change
  	add_coloumn :projects, :description, :text
  end
end
