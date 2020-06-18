require 'rails_helper'
describe TasksController do
  let(:user) { create(:user) }
  let(:other) { create(:user) }
  let(:task) { create(:task, user: user) }
  let(:no_score_task) { create(:task, score: nil, user: user) }
  let(:other_user_task) { create(:task, user: other) }

  describe '#update' do
    context 'ログインしている場合' do
      before do
        login user
      end
        
      context "自分が作成したtaskを更新する場合" do
        context 'scoreが入力されている場合' do
          it 'taskを更新する' do
            params = { id: task.id, task: { score: "bad" } }
            patch :update, params: params
            expect(task.reload.score).to eq("bad")
          end
          it 'taskの詳細ページにリダイレクトする' do
            params = { id: task.id, task: { score: "bad" } }
            patch :update, params: params
            expect(response).to redirect_to(task_path(task))
          end
        end

        context 'score, bodyが共に入力されていない場合' do
          it '元のtaskを削除する' do
            params = { id: no_score_task.id, task: { body: "" } }
            expect {
              patch :update, params: params
            }.to change(Task, :count).by(-1)
          end
          it 'マイページにリダイレクトする' do
            params = { id: no_score_task.id, task: { body: "" } }
            patch :update, params: params
            expect(response).to redirect_to(user_path(user))
          end
        end
      end

      context '他ユーザーのtaskを更新しようとした場合' do
        it 'taskを更新しない' do
          params = { id: other_user_task.id, task: { score: "bad" } }
          patch :update, params: params
          expect(task.reload.score).to eq("done")
        end
        it 'マイページにリダイレクトする' do
          params = { id: other_user_task.id, task: { score: "bad" } }
          patch :update, params: params
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'taskを更新しない' do
        params = { id: task.id, task: { score: "bad" } }
        patch :update, params: params
        expect(task.reload.score).to eq("done")
      end
      it 'ログインページにリダイレクトする' do
        params = { id: task.id, task: { score: "bad" } }
        patch :update, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end