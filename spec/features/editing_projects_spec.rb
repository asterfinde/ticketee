require "rails_helper"


RSpec.feature "Users can edit existing projects" do
	# The first four lines into a before block, because when a user is editing a project,
	# the first four steps will always be the same: 
	# a project needs to exist, 
	# and then a user goes to the homepage, 
	# finds a project, 
	#and clicks Edit Project.
	before do
		FactoryGirl.create(:project, name: "Sublime Text 3")

		visit "/"
		click_link "Sublime Text 3"
		click_link "Edit Project"
	end

	scenario "with valid attributes" do
		fill_in "Name", with: "Sublime Text 4 beta"
		click_button "Update Project"
		expect(page).to have_content "Project has been updated."
		expect(page).to have_content "Sublime Text 4 beta"
	end	

	scenario "when providing invalid attributes" do
		fill_in "Name", with: ""
		click_button "Update Project"
		expect(page).to have_content "Project has not been updated."
	end

	# ORIGINAL WAY TO DECLARE THIS RSpec
	# scenario "with valid attributes" do
	# # given: arrange
	# 	FactoryGirl.create(:project, name: "Sublime Text 3")

	# # when: act
	# 	visit "/"
	# 	click_link "Sublime Text 3"
	# 	click_link "Edit Project"
	# 	fill_in "Name", with: "Sublime Text 4 beta"
	# 	click_button "Update Project"

	# # then: assert	
	# 	expect(page).to have_content "Project has been updated."
	# 	expect(page).to have_content "Sublime Text 4 beta"
	# end
end