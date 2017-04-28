Rails.application.routes.draw do
	root "projects#index"

	# This is called a resource route, and it defines the routes to the seven RESTful actions in
	# your projects controller.
	# When something is said to be RESTful, it means it conforms
	# to Rails’ interpretation of the Representational State Transfer (REST) architectural
	# style.
	# With Rails, this means the related controller has seven potential actions:
	# index, edit, show, update, new, destroy, create
	#
	# These seven actions match up with just four request paths:
	# /projects, /projects/:id, /projects/new, /projects/:id/edit
	#
	# Rails will determine what action to route to on the basis of the HTTP method of the requests to these
	# paths.
	resources :projects
end
