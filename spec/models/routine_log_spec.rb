require 'rails_helper'

describe RoutineLog do
  describe '#create' do
    let(:category) { create(:category) }

    it "content, date, category_id, task_idの全てが存在すれば登録できる" do
      routine_log = build(:routine_log, category: category)
      expect(routine_log).to be_valid
    end

    it "contentが存在しない場合は登録できない" do
      routine_log = build(:routine_log, content: nil)
      routine_log.valid?
      expect(routine_log.errors[:content]).to include("を入力してください")
    end

    it "dateが存在しない場合は登録できない" do
      routine_log = build(:routine_log, date: nil)
      routine_log.valid?
      expect(routine_log.errors[:date]).to include("を入力してください")
    end

    it "category_idが存在しない場合は登録できない" do
      routine_log = build(:routine_log, category_id: nil)
      routine_log.valid?
      expect(routine_log.errors[:category_id]).to include("を入力してください")
    end

    it "task_idが存在しない場合は登録できない" do
      routine_log = build(:routine_log, task_id: nil)
      routine_log.valid?
      expect(routine_log.errors[:task]).to include("を入力してください")
    end
  end
end