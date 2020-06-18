require 'rails_helper'

describe Comment do
  describe '#create' do
    it "content, user_id, task_idの全てが存在すれば登録できる" do
      comment = build(:comment)
      expect(comment).to be_valid
    end

    it "contentが存在しない場合は登録できない" do
      comment = build(:comment, content: nil)
      comment.valid?
      expect(comment.errors[:content]).to include("を入力してください")
    end

    it "user_idが存在しない場合は登録できない" do
      comment = build(:comment, user_id: nil)
      comment.valid?
      expect(comment.errors[:user]).to include("を入力してください")
    end

    it "task_idが存在しない場合は登録できない" do
      comment = build(:comment, task_id: nil)
      comment.valid?
      expect(comment.errors[:task]).to include("を入力してください")
    end
  end
end