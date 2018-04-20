require 'rails_helper'
require 'capybara/rspec'

#Teste Feature 6

RSpec.feature "Collections", type: :feature do
  
  before(:each) do
    User.create(email: "teste@teste.com", password:"senha123")
    User.create(email: "teste2@teste2.com", password:"senha123")
    Collection.create(name: 'Lista Teste',is_public: true, user_id: 1) 
    Collection.create(name: 'Lista Teste privada',is_public: false, user_id: 1) 
  end
  

  scenario "See public list" do
    visit new_user_session_path
    
    fill_in "user_email", with: 'teste2@teste2.com'
    fill_in "user_password", with: 'senha123'

    click_button 'Log in'
    expect(page).to have_content('teste@teste.com')
    expect(page).to have_content('Lista Teste')
  end

    
  scenario "Dont see pivate lists" do

    visit new_user_session_path
    
    fill_in "user_email", with: 'teste2@teste2.com'
    fill_in "user_password", with: 'senha123'

    click_button 'Log in'
    !expect(page).to have_no_content('Lista Teste privada')
  
  end
     
end
