require 'rails_helper'

describe User do
  context "signs up for an account" do

    describe "signs up with a valid username" do
      it "is not blank" do
        User.create(username: nil, email: 'Bob@BobTheDog.com', password: 'woofwoof').should_not be_valid
      end
      it "is long enough" do
        User.create(username: 'Bob', email: 'Bob@BobTheDog.com', password: 'woofwoof').should_not be_valid
      end
      it "is unique" do
        User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof').should be_valid
        User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof').should_not be_valid
      end
    end

    describe "signs up with a valid email" do
      it "is not blank" do
        User.create(username: 'BobTheDog', email: nil, password: 'woofwoof').should_not be_valid
      end
      it "is a valid email address" do
        User.create(username: 'BobTheDog', email: 'Bob_at_BobTheDog.com', password: 'woofwoof').should_not be_valid
        User.create(username: 'BobTheDog', email: 'Bob@BobTheDog,com', password: 'woofwoof').should_not be_valid
      end
      it "is unique" do
        User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof').should be_valid
        User.create(username: 'BobTheDog', email: 'Bob@BobTheDog.com', password: 'woofwoof').should_not be_valid
      end
    end
  end
end
