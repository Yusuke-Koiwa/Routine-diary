require 'rails_helper'

describe Task do

  describe '#create' do

    it "score, body, date, start_time, user_idの全てが存在すれば登録できる" do
      task = build(:task)
      expect(task).to be_valid
    end

    it "scoreが存在しない場合、bodyが存在すれば登録できる" do
      task = build(:task, score: nil)
      expect(task).to be_valid
    end

    it "bodyが存在しない場合、scoreが存在すれば登録できる" do
      task = build(:task, body: nil)
      expect(task).to be_valid
    end

    it "scoreとbodyが共に存在しない場合は登録できない" do
      task = build(:task, score: nil, body: nil)
      task.valid?
      expect(task.errors[:score]).to include("を入力してください")
    end

    it "dateが存在しない場合は登録できない" do
      task = build(:task, date: nil)
      task.valid?
      expect(task.errors[:date]).to include("を入力してください")
    end

    it "start_timeが存在しない場合は登録できない" do
      task = build(:task, start_time: nil)
      task.valid?
      expect(task.errors[:start_time]).to include("を入力してください")
    end

    it "user_idが存在しない場合は登録できない" do
      task = build(:task, user_id: nil)
      task.valid?
      expect(task.errors[:user]).to include("を入力してください")
    end

  end

end