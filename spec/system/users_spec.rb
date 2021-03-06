require 'rails_helper'

RSpec.describe 'ユーザー新規登録機能', type: :system do
  before do
    @user = FactoryBot.build(:user)
  end

  context 'ユーザー新規登録ができるとき' do
    it '正しい情報を入力すればユーザー新規登録ができて、トップページに移動する' do
      # ログインページへ遷移する
      visit new_user_session_path
      # ログインページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ遷移する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: @user.nickname
      fill_in 'user[email]', with: @user.email
      fill_in 'user[password]',              with: @user.password
      fill_in 'user[password_confirmation]', with: @user.password_confirmation
      fill_in 'user[family_name]',           with: @user.family_name
      fill_in 'user[given_name]',            with: @user.given_name
      fill_in 'user[family_name_kana]',      with: @user.family_name_kana
      fill_in 'user[given_name_kana]',       with: @user.given_name_kana
      select '2000', from: 'user[birthday(1i)]'
      select '1',    from: 'user[birthday(2i)]'
      select '1',    from: 'user[birthday(3i)]'
      fill_in 'user[duty_station]', with: @user.duty_station
      # Create Accountボタンを押すとユーザーモデルのカウントが１上がることを確認する
      expect do
        find("input[name='commit']").click
      end.to change { User.count }.by(1)
      # トップページへ遷移したことを確認する
      expect(current_path).to eq(root_path)
    end
  end

  context 'ユーザー新規登録ができないとき' do
    it '誤った情報ではユーザー新規登録ができずに新規登録ページへ戻ってくる' do
      # ログインページへ遷移する
      visit new_user_session_path
      # ログインページにサインアップページへ遷移するボタンがあることを確認する
      expect(page).to have_content('Sign up')
      # 新規登録ページへ遷移する
      visit new_user_registration_path
      # ユーザー情報を入力する
      fill_in 'user[nickname]', with: ''
      fill_in 'user[email]', with: ''
      fill_in 'user[password]',              with: ''
      fill_in 'user[password_confirmation]', with: ''
      fill_in 'user[family_name]',           with: ''
      fill_in 'user[given_name]',            with: ''
      fill_in 'user[family_name_kana]',      with: ''
      fill_in 'user[given_name_kana]',       with: ''
      select '--', from: 'user[birthday(1i)]'
      select '--',    from: 'user[birthday(2i)]'
      select '--',    from: 'user[birthday(3i)]'
      fill_in 'user[duty_station]', with: ''
      # Create Accountボタンを押してもユーザーモデルのカウントは上がらないことを確認する
      expect do
        find("input[name='commit']").click
      end.to change { User.count }.by(0)
      # 新規登録ページへ戻されることを確認する
      page.driver.browser.switch_to.alert.accept
      expect(current_path).to eq user_registration_path
    end
  end
end

RSpec.describe 'ユーザーログイン機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'ログインしていない状態でトップページにアクセスした場合、ログインページに移動する' do
    # トップページに遷移する
    visit root_path
    # ログインしていない場合、サインインページに遷移していることを確認する
    visit new_user_session_path
  end

  context 'ログインが出来る時' do
    it '保存されているユーザーの情報と合致すればログインが出来る' do
      # ログインページへ移動する
      visit new_user_session_path
      # ログインしていない場合、ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # 正しいユーザー情報を入力する
      fill_in 'user[email]',              with: @user.email
      fill_in 'user[password]',           with: @user.password
      # Log inボタンを押す
      find('input[name="commit"]').click
      # トップページへ遷移することを確認する
      expect(current_path).to eq(root_path)
    end
  end

  context 'ログインが出来ない時' do
    it '保存されているユーザーの情報と合致しないとログインができない' do
      # ログインページへ移動する
      visit new_user_session_path
      # ログインしていない場合、ログインページに遷移していることを確認する
      expect(current_path).to eq(new_user_session_path)
      # ユーザー情報を入力する
      fill_in 'user[email]',              with: ''
      fill_in 'user[password]',           with: ''
      # Log inボタンを押す
      find('input[name="commit"]').click
      # ログインページへ戻されることを確認する
      expect(current_path).to eq new_user_session_path
    end
  end
end

RSpec.describe 'ユーザーログアウト機能', type: :system do
  before do
    @user = FactoryBot.create(:user)
  end

  it 'アカウント編集ページからログアウトボタンを押したらログアウト出来る' do
    # サインインする
    sign_in(@user)
    # ユーザー名をクリックして、マイページへ遷移する
    find("a[href='#{users_path(@user.id)}']").click
    # アカウントの編集ボタンを押してアカウント編集画面へ遷移する
    find("a[href='#{edit_user_path(@user.id)}']").click
    # ログアウトボタンを押す
    find("a[href='#{destroy_user_session_path}']").click
    # ログインページへ遷移することを確認
    expect(current_path).to eq new_user_session_path
  end
end
