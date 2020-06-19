require 'rails_helper'
feature 'top_page', type: :feature do
  let(:user) { create(:user) }

  context 'ログインしていない場合' do
    background do
      create(:category)
    end
    scenario '詳細ページに遷移出来ない' do
      @task = create(:task)
      visit root_path
      find('.task-link').click
      expect(current_path).to eq new_user_session_path
      expect(page).to have_content('ログインが必要です')
    end
  end

  context 'ログインしている場合' do
    background do
      create(:category)
      @task = create(:task, user: user)
      visit new_user_session_path
      fill_in 'Email', with: user.email
      fill_in 'Password', with: user.password
      click_button 'ログイン'
      expect(current_path).to eq user_path(user)
      visit root_path
    end

    scenario '投稿詳細ページに遷移出来る' do
      find('.task-link').click
      expect(current_path).to eq task_path(@task)
    end

    scenario 'user詳細ページに遷移出来る' do
      find('.user_path_link').click
      expect(current_path).to eq user_path(user)
    end
  end
end
