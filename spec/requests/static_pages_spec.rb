require 'spec_helper'

describe "StaticPages" do

  subject { page }

  shared_examples_for "all static pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  shared_examples_for "homepage" do
    let(:heading) { 'Sample App' }
    let(:page_title) { '' }
    it_should_behave_like "all static pages"
    it { should_not have_title(full_title("Home")) }
  end

  shared_examples_for "help page" do
    let(:heading) { 'Help' }
    let(:page_title) { 'Help' }
    it_should_behave_like "all static pages"
  end

  shared_examples_for "about page" do
    let(:heading) { 'About Us' }
    let(:page_title) { 'About Us' }
    it_should_behave_like "all static pages"
  end

  shared_examples_for "contact page" do
    let(:heading) { 'Contact' }
    let(:page_title) { 'Contact' }
    it_should_behave_like "all static pages"
  end

  shared_examples_for "signup page" do
    let(:heading) { 'Sign up' }
    let(:page_title) { 'Sign up' }
    it_should_behave_like "all static pages"
  end

  describe "Home page" do
    before { visit root_path }
    it_should_behave_like "homepage"
  end

  describe "Help page" do
    before { visit help_path }
    it_should_behave_like "help page"
  end
  
  describe "About page" do
    before { visit about_path }
    it_should_behave_like "about page"
  end
  
  describe "Contact page" do
    before { visit contact_path }
    it_should_behave_like "contact page"
  end

  describe "should have the right links on the layout" do
    describe "go to about page" do
      before do
        visit root_path 
        click_link "About"
      end
      it_should_behave_like "about page"
    end
    describe "go to about page and back" do
      before do
        visit root_path 
        click_link "About"
        click_link "Home"
      end
      it_should_behave_like "homepage"
    end
    describe "go to about page then help" do
      before do
        visit root_path 
        click_link "About"
        click_link "Help"
      end
      it_should_behave_like "help page"
    end
    describe "go to about page then help, then contact" do
      before do
        visit root_path 
        click_link "About"
        click_link "Help"
        click_link "Contact"
      end
      it_should_behave_like "contact page"
    end
    describe "go to about page then help, then contact, then home, then sign up" do
      before do
        visit root_path 
        click_link "About"
        click_link "Help"
        click_link "Contact"
        click_link "Home"
        click_link "Sign up now!"
      end
      it_should_behave_like "signup page"
    end
    describe "go to about page then help, then contact, then home, then sign up, then sample app" do
      before do
        visit root_path 
        click_link "About"
        click_link "Help"
        click_link "Contact"
        click_link "Home"
        click_link "Sign up now!"
        click_link "sample app"
      end
      it_should_behave_like "homepage"
    end
  end

end
