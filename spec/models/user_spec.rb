require 'rails_helper'

RSpec.describe User, type: :model do
  xcontext "#find_or_create_from_auth(auth)" do
    it "will find or create authenticated user" do

      auth = User.create({provider: "Twitter", uid: "120938458475", nickname: "georgec"})
      user = User.find_or_create_from_auth(auth)
      expect(user.nickname).to eq("georgec")
    end
  end
end
