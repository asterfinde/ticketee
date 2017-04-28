#	Helpers are methods you can define in the files in app/helpers, and they’re made
#	available in your views. Helpers are for extracting the logic from the views; views should
#	just be about displaying information. Every controller that comes from the controller
#	generator has a corresponding helper, and another helper module exists for the entire
#	application: the ApplicationHelper module, which lives at app/helpers/
#	application_helper.rb

module ApplicationHelper
	# When you specify an argument in a method beginning with the splat operator (*), any
	# arguments passed from this point will be available in the method as an array.
	def title(*parts)

		# If no arguments are passed to the title method, parts will be empty and empty? 
		# will return true.
		unless parts.empty?
			
			# If parts are specified for the title method, then you use the content_for method
			# to define a named block of content, giving it the name title. Inside this content
			# block, you join the parts together using a hyphen (-), meaning that this helper will
			# output something like "Sublime Text 3 - Projects - Ticketee".
			content_for :title do
				(parts << "Ticketee").join(" - ")
			end
		end
	end
end
