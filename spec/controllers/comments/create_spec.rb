require 'rails_helper'

describe CommentsController do
  let(:user) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:params) { { task_id: task.id, user_id: user.id, comment: {content: "hoge"} } }

  describe "#create" do
    context "ログインしている場合" do
      before do
        login user
      end

      context "保存に成功した場合" do
        subject { post :create, format: :json, params: params }
        it "commentを保存すること" do
          expect{subject}.to change(Comment, :count).by(1)
        end
      end

      context "保存に失敗した場合" do
        let(:invalid_params) { { task_id: task.id, user_id: user.id, comment: {content: nil} } }
        subject { post :create, format: :json, params: invalid_params }
        it "commentを保存しないこと" do
          expect{subject}.not_to change(Comment, :count)
        end
      end
    end

    context "ログインしていない場合" do
      it "ログインページに遷移すること" do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end