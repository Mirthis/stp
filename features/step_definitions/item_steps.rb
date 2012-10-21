def sample_item
  {
    title: "Sample title",
    description: "Sampe Description"
  }
end

def find_item
  @item ||= Item.first
end

When /^I create an item$/ do
  visit new_item_url
  fill_in 'Title', :with => sample_item[:title]
  fill_in 'Description', :with => sample_item[:description]
  click_button "Create Item"
end

Then /^I should see the created item$/ do
  find_item
  page.should have_content @item.title
  page.should have_content @item.description 
end
