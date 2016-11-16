module WebHelpers

  def create_user
    visit '/main/home'
    click_link 'Register'
    fill_in 'Email', with: "test@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def create_user2
    visit '/main/home'
    click_link 'Register'
    fill_in 'Email', with: "test2@testuser.com"
    fill_in 'Password', with: "123456"
    fill_in 'Password confirmation', with: "123456"
    click_button 'Sign up'
  end

  def add_restaurant
    visit '/restaurants/new'
    fill_in 'restaurant_name', with: "Dishoom"
    fill_in 'restaurant_location', with: "old street"
    fill_in 'restaurant_description', with: "tasty indian food"
    click_button 'Save'
  end

  def submit_review
    visit '/restaurants/all'
    click_button 'Write Review'
    fill_in 'review_rating', with: 4
    fill_in 'review_comment', with: "great food, big queue"
    click_button "Save"
  end

  def sign_out
    
  end



end