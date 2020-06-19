require 'rails_helper'
describe TasksController do
  let(:user) { create(:user) }

  describe '#create' do
    let(:params) { { score: "done", body: "hoge", date: (Date.today - 1).to_s, start_time: (Date.today - 1).to_s, user_id: user.id } }
    let(:blank_params) { { score: nil, body: nil, date: (Date.today - 1).to_s, start_time: (Date.today - 1).to_s, user_id: user.id } }

    context 'ログインしている場合' do
      before do
        login user
      end

      context 'routineが1つ以上設定されている場合' do
        before do
          create(:routine, user: user)
        end

        context "score, bodyが入力されており、同じdateのレコードが存在しない場合" do
          subject { post :create, params: params }
          it 'taskを保存する' do
            expect { subject }.to change(Task, :count).by(1)
          end
          it 'マイページにリダイレクトする' do
            subject
            expect(response).to redirect_to(user_path(user))
          end
        end

        context '同じdateのレコードは存在しないが、score, bodyが共に入力されていない場合' do
          subject { post :create, params: blank_params }
          it 'taskを保存しない' do
            expect { subject }.not_to change(Task, :count)
          end
          it 'マイページにリダイレクトする' do
            subject
            expect(response).to redirect_to(user_path(user))
          end
        end

        context 'score, bodyが入力されているが、同じdateのレコードが既に存在する場合' do
          before do
            create(:task, user: user, date: Date.today - 1)
          end
          subject { post :create, params: params }
          it 'taskを保存しない' do
            expect { subject }.not_to change(Task, :count)
          end
          it 'マイページにリダイレクトする' do
            subject
            expect(response).to redirect_to(user_path(user))
          end
        end
      end

      context 'routineが設定されていない場合' do
        subject { post :create, params: params }
        it 'taskを保存しない' do
          expect { subject }.not_to change(Task, :count)
        end
        it 'マイページにリダイレクトする' do
          subject
          expect(response).to redirect_to(user_path(user))
        end
      end
    end

    context 'ログインしていない場合' do
      it 'ログインページにリダイレクトする' do
        post :create, params: params
        expect(response).to redirect_to(new_user_session_path)
      end
    end
  end
end
