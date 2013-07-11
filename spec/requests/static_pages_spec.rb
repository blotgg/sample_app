require 'spec_helper'

describe "Static pages" do
  
  let(:base_title) { "Бублег" }

  describe "Home page" do

    it "should have the content 'Sample App'" do
      visit '/static_pages/home'
      page.should have_selector('h1', :text => 'Sample App')
    end
    
    it "Проверка базового титла" do
      visit '/static_pages/home'
      page.should have_title("#{base_title}")
    end
    
    it "Проверка отсутствия титла '| Home' титла" do
      visit '/static_pages/home'
      page.should_not have_title(" | Home")
    end
  end
  
  describe "Help page" do
    it "Проверка контента на наличие 'Help'" do
      visit '/static_pages/help'
      page.should have_selector('h1', :text => 'Help')
    end
    
    it "Проверка титла 'Help'" do
      visit '/static_pages/help'
      page.should have_title("#{base_title} | Help")
    end
    
  end
  
  describe "About page" do
    it "Проверка контента на наличие 'About Us'" do
      visit '/static_pages/about'
      page.should have_selector('h1', :text => 'About Us')
    end
    
    it "Проверка титла 'About Us'" do
      visit '/static_pages/about'
      page.should have_title("#{base_title} | About Us")
    end
  end
  
  describe "Contact" do
    it "Проверка контента на наличие 'Contact'" do
      visit '/static_pages/contact'
      page.should have_selector('h1', :text => 'Contact')
    end
    
    it "Проверка титла 'Contact'" do
      visit '/static_pages/contact'
      page.should have_title("#{base_title} | Contact")
    end
  end
end
