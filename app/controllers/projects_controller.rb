class ProjectsController < ApplicationController
	def index
	end

	def new
		@project = Project.new
	end

	def create
		@project = Project.new(project_params)

		if @project.save
			# These messages are stored in the session and are cleared at the completion of the next request. 
			#	Here you set the :notice key of the flash hash to be “Project has been created” 
			# to inform the user what has happened.
			# This message is displayed later, as is required by the final step in your feature.
			flash[:notice] = "Project has been created."

			# The object '@project' has now been saved to the database. This method generates a path in the
			# form of /projects/:id, where :id is the record’s id attribute assigned by your database system.

			# The redirect_to method tells the browser to begin making a new request to that path and sends 
			# back an empty response body; the HTTP status code will be a “302 Redirect,” and the URL to 
			# redirect to will match the URL of the currently nonexistent "show action".
			redirect_to @project
		else
			# nothing, yet
		end
	end

	# You pass the params[:id] object to Project.find. This gives you a single Project
	# object that relates to a record in the database, which has its id field set to whatever
	# params[:id] is. If Active Record can’t find a record matching that ID, it raises an
	# ActiveRecord::RecordNotFound exception.
	# params[:id], just as params[:controller] and params[:action] are also
	# automatically made available by Rails.
	def show
		@project = Project.find(params[:id])
	end

	private
		# You now call the require method on your params, and you require that the :project
		# key exists. You also allow it to have :name and :description entries—any other fields
		# submitted will be discarded. Finally, you wrap up that logic into a method so you can
		# use it in other actions, and you make it private so you don’t expose it as some kind of
		# weird action! You’ll use this method in one other action in this controller later on—
		# the update action.
		def project_params
			params.require(:project).permit(:name, :description)
		end
end
