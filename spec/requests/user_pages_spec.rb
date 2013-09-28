require 'spec_helper'

describe "UserPages" do

	subject { page }

  shared_examples_for "user pages" do
    it { should have_selector('h1', text: heading) }
    it { should have_title(full_title(page_title)) }
  end

  describe "signup page" do
  	before { visit signup_path }
    let(:heading) { 'Sign up' }
    let(:page_title) { 'Sign up' }
    it_should_behave_like "user pages"
  end
end