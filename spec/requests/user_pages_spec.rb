require 'spec_helper'
include ApplicationHelper

describe "User pages" do

  subject { page }

  describe "profile page" do
    let(:user) { FactoryGirl.create(:user) }
    before { visit user_path(user) }

    it { should have_selector('h1',    text: user.name) }
    it { should have_selector('title', text: user.name) }
  end

  shared_examples_for "static pages" do
    it { should have_selector('h1',     text: heading)}
    it { should have_selector('title',  text: full_title(page_title))}
  end

  describe "signup page" do
    before {visit signup_path}    
    let(:heading)  {'Sign up'}
    let(:page_title){"Sign up"}
    it_should_behave_like "static pages" 
  end

  describe "signup" do
    before {visit signup_path}
    let(:submit){"Create my account"}

    describe "with invalid infomation" do
      it "should not create a user" do
        expect {click_button submit}.not_to change(User, :count)
      end
    end

    describe "with valid infomation" do
      before do
        fill_in "Name",         with: "Luc"
        fill_in "Email",        with: "dalu@gmail.com"
        fill_in "Password",     with: "foobar"
        fill_in "Confirmation", with: "foobar"
      end

      it "should create a user" do
        expect {click_button submit}.to change(User,:count).by(1)
      end
    end
  end
end