require 'rails_helper'

describe Notification do

  describe '#create' do

    it "visitor_id, visited_id, task_id, comment_id, action, checkedの全てが存在すれば登録できる" do
      notification = build(:notification)
      expect(notification).to be_valid
    end

    it "task_id, comment_id, checkedが存在しなくても、それ以外が全て存在すれば登録できる" do
      notification = build(:notification, task_id: nil, comment_id: nil, checked: nil)
      expect(notification).to be_valid
    end

    it "visitor_idが存在しない場合は登録できない" do
      notification = build(:notification, visitor_id: nil)
      notification.valid?
      expect(notification.errors[:visitor_id]).to include("を入力してください")
    end

    it "visited_idが存在しない場合は登録できない" do
      notification = build(:notification, visited_id: nil)
      notification.valid?
      expect(notification.errors[:visited_id]).to include("を入力してください")
    end

    it "actionが存在しない場合は登録できない" do
      notification = build(:notification, action: nil)
      notification.valid?
      expect(notification.errors[:action]).to include("を入力してください")
    end

  end

end