require "rails_helper"

RSpec.feature "Users can create new projects" do
	scenario "with valid attributes" do
		visit "/"
		click_link "New Project"
		fill_in "Your Name", with: "Sublime Text 3"
		fill_in "Description", with: "A text editor for everyone"
		click_button "Create Project"
		expect(page).to have_content "Project has been created."

		# Uses the find_by method to find a project by its name. This finds
		# the project that has just been created by the code directly above it
		# on the first "fill_in" method
		project = Project.find_by(name: "Sublime Text 3")

		# Ensures that you’re on what should be the show action in the ProjectsController
		expect(page.current_url).to eq project_url(project)

		# These two last lines find the title element on the page by using Capybara’s
		# find method and check using have_title that this element contains the page title of
		# “Sublime Text 3 - Projects - Ticketee.”
		title = "Sublime Text 3 - Projects - Ticketee"
		expect(page).to have_title title
	end
end