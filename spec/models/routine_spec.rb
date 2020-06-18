require 'rails_helper'

describe Routine do
  describe '#create' do
    it "content, user_id, category_idの全てが存在すれば登録できる" do
      category = create(:category)
      routine = build(:routine, category: category)
      expect(routine).to be_valid
    end

    it "contentが存在しない場合は登録できない" do
      routine = build(:routine, content: nil)
      routine.valid?
      expect(routine.errors[:content]).to include("を入力してください")
    end

    it "category_idが存在しない場合は登録できない" do
      routine = build(:routine, category_id: nil)
      routine.valid?
      expect(routine.errors[:category_id]).to include("を入力してください")
    end

    it "user_idが存在しない場合は登録できない" do
      routine = build(:routine, user_id: nil)
      routine.valid?
      expect(routine.errors[:user]).to include("を入力してください")
    end

    it "routineを既に3つ登録しているユーザーは、それ以上routineを登録できない" do
      user = create(:user)
      routine1 = create(:routine, user: user)
      routine2 = create(:routine, user: user)
      routine3 = create(:routine, user: user)
      routine4 = build(:routine, user: user)
      routine4.valid?
      expect(routine4.errors[:routine]).to include("登録できる習慣は3つまでです")
    end
  end
end