require 'rails_helper'

describe Praise do
  describe '#create' do
    it "user_id, task_idの全てが存在すれば登録できる" do
      praise = build(:praise)
      expect(praise).to be_valid
    end

    it "user_idが存在しない場合は登録できない" do
      praise = build(:praise, user_id: nil)
      praise.valid?
      expect(praise.errors[:user]).to include("を入力してください")
    end

    it "task_idが存在しない場合は登録できない" do
      praise = build(:praise, task_id: nil)
      praise.valid?
      expect(praise.errors[:task]).to include("を入力してください")
    end

    it "user_id, task_idの組み合わせは一意でなければならない" do
      user = create(:user)
      task = create(:task, user: user)
      create(:praise, user: user, task: task)
      praise2 = build(:praise, user: user, task: task)
      praise2.valid?
      expect(praise2.errors[:task_id]).to include("はすでに存在します")
    end
  end
end
