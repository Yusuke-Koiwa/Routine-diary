require 'rails_helper'
describe TasksController do
  let(:user) { create(:user) }

  describe '#index' do

    it '@tasksに正しい値が入っている' do
      tasks = create_list(:task, 3)
      get :index
      expect(assigns(:tasks)).to match(tasks.sort{ |a, b| b.date <=> a.date })
    end
    it 'index.html.hamlに遷移する' do
      get :index
      expect(response).to render_template :index
    end
    
  end

end