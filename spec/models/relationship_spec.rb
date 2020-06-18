require 'rails_helper'

describe Relationship do
  describe '#create' do
    it "user_id, follow_idの全てが存在すれば登録できる" do
      relationship = build(:relationship)
      expect(relationship).to be_valid
    end

    it "user_idが存在しない場合は登録できない" do
      relationship = build(:relationship, user_id: nil)
      relationship.valid?
      expect(relationship.errors[:user]).to include("を入力してください")
    end

    it "follow_idが存在しない場合は登録できない" do
      relationship = build(:relationship, follow_id: nil)
      relationship.valid?
      expect(relationship.errors[:follow]).to include("を入力してください")
    end

    it "user_id, follow_idの組み合わせは一意でなければならない" do
      user = create(:user)
      other = create(:user, email: "fuga@fuga.come")
      relationship1 = create(:relationship, user: user, follow: other)
      relationship2 = build(:relationship, user: user, follow: other)
      relationship2.valid?
      expect(relationship2.errors[:follow_id]).to include("はすでに存在します")
    end
  end
end
