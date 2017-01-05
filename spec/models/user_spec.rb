require 'rails_helper'

describe User do

  context "signs up for an account" do

    describe "signs up with a valid username" do

      it "is not blank" do
        user = User.create(username: nil, email: 'Bob@BobTheDog.com', password: 'woofwoof')
        expect(user).to be_invalid
      end

      it "is long enough" do
        user = User.create(username: 'Bob', email: 'Bob@BobTheDog.com', password: 'woofwoof')
        expect(user).to be_invalid
      end

      it "is unique" do
        user = User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof')
        expect(user.dup).to be_invalid
      end

    end

    describe "signs up with a valid email" do

      it "is not blank" do
        user = User.create(username: 'BobTheDog', email: nil, password: 'woofwoof')
        expect(user).to be_invalid
      end

      it "is a valid email address" do
        user1 = User.create(username: 'BobTheDog', email: 'Bob_at_BobTheDog.com', password: 'woofwoof')
        user2 = User.create(username: 'BobTheDog', email: 'Bob@BobTheDog,com', password: 'woofwoof')
        expect(user1).to be_invalid
        expect(user2).to be_invalid
      end

      it "is unique" do
        user = User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof')
        expect(user.dup).to be_invalid
      end

    end

    describe "signs up with a valid password" do

      it "is not blank" do
        user = User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: nil)
        expect(user.dup).to be_invalid
      end

      it "is long enough" do
        user = User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woof')
        expect(user.dup).to be_invalid
      end

    end
  end

  context "unregistered user" do
    describe "has correct permissions" do

      it "cannot view create sequence link" do
        visit('/')
        expect(page).to have_content("Sign up or log in")
      end

      it "cannot view create sequence page" do
        visit('/sequence/new')
        expect(page).to have_content("Sign up or log in")
      end

    end
  end

  context "registered user" do
    describe "has correct permissions" do
      before(:each) do
        User.create(username: 'TestUser1', email: 'Test@test.com', password: 'Test1234')
      end

      before(:each) do
        visit('/sessions/new')
        fill_in('Username', :with => 'TestUser1')
        fill_in('Password', :with => 'Test1234')
        click_on('Log In')
      end

      it "can view create sequence link" do
        expect(page).to have_content("Create a new sequence")
      end

      it "can view create sequence page" do
        visit('/sequence/new')
        expect(page).to have_content("Add a pose to this sequence")
      end
    end
  end

end
