require 'rails_helper'

RSpec.describe "予定表作成機能", type: :system do
  before do
    @department = FactoryBot.create(:department)
    @user = FactoryBot.create(:user)
  end

  context "予定表が作成出来る時" do
    it "正しい情報が入力されていれば予定表を作成出来る" do
      # サインインする
      sign_in(@user)
      # 予定表追加ボタンをクリックする
      find('.nav-link').click
      # 情報を入力する
      fill_in 'department[name]', with: @department.name
      # 登録した値がDBに保存されていることを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Department.count }.by(1)
      # トップページに遷移している事を確認
      expect(current_path).to eq(root_path)
    end
  end

  context "予定表が作成出来ない時" do
    it "誤った情報が入力されていれば予定表を作成出来ない" do
      # サインインする
      sign_in(@user)
      # 予定表追加ボタンをクリックする
      find('.nav-link').click
      # 情報を入力する
      fill_in 'department[name]', with: ''
      # DBに保存されていないことを確認
      expect {
        find('input[name="commit"]').click
      }.not_to change { Department.count }
      # 予定表追加ページへ戻される
      expect(current_path).to eq(new_department_path)
    end
  end
end
