require 'rails_helper'

RSpec.describe "予定追加機能", type: :system do
  before do
    @event = FactoryBot.create(:event)
  end

  context "予定を追加できた時" do
    it "正しい情報が入力された場合予定を追加できる" do
      # サインインする
      sign_in(@event.user)
      # 予定リストを開く
      find(".openbtn1").click
      # 予定表をクリック
      find(".department-name").click
      # 予定を追加をクリック
      click_link('予定を追加')
      # 正しい情報を入力する
      fill_in 'event[title]', with: @event.title
      fill_in 'event[start_time]', with: @event.start_time
      find('.flatpickr-hour').set('12')
      find('.flatpickr-hour').send_keys(:enter)
      fill_in 'event[end_time]', with: @event.end_time
      find('.flatpickr-hour').set('13')
      find('.flatpickr-hour').send_keys(:enter)
      fill_in 'event[content]', with: @event.content
      # 登録ボタンを押してDBの値が１増えたことを確認する
      expect {
        find('input[name="commit"]').click
      }.to change { Event.count }.by(1)
      # タイトル名が予定表画面に表示されたことを確認
      expect(page).to have_content(@event.title)
    end
  end

  context "予定を追加できない時" do
    it "誤った情報が入力された場合予定を追加できない" do
      # サインインする
      sign_in(@event.user)
      # 予定リストを開く
      find(".openbtn1").click
      # 予定表をクリック
      find(".department-name").click
      # 予定を追加をクリック
      click_link('予定を追加')
      # 登録ボタンを押してDBの値が１増えないことを確認する
      expect {
        find('input[name="commit"]').click
      }.not_to change { Event.count }
    end
  end
end
